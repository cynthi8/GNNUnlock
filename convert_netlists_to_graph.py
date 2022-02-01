import os
import re
import json
import scipy.sparse as sp
import numpy as np
import networkx as nx
from collections import defaultdict
from itertools import chain

import read

netlists_dir = '/home/erin/GNNUnlock/Netlist_to_graph/Circuits_datasets/sfll_one_shot/'
#netlists_dir = '/home/erin/GNNUnlock/Netlist_to_graph/Circuits_datasets/SFLL_DATASET_c7552/'
output_dir = 'Graph'
locking_type = 'SFLL'

# Variables to store the final output
full_matrixs = []
train_matrixs = []
roles = {'te': [], 'tr': [], 'va': []}
class_map = {}
feats = defaultdict(lambda: defaultdict(int))

# Class definition for gate nodes
default_class = 'main'
#class_key_mapping = {'main': 0, 'perturb': 1, 'restore': 2}
class_key_mapping = {'main': 2, 'perturb': 1, 'restore': 0}
if locking_type == 'AntiSAT':
    class_key_mapping = {'main': 0, 'flip': 1}

# Allow for different gate libraries
with open("lilas_gate_library.json") as f:
    gate_library = json.load(f)
gate_type = gate_library['gate_type']

# Nodes with these types are not gates and should excluded from the graph
primary_signal_types = ['INPUT','OUTPUT', 'KEY_INPUT']
ignored_types = primary_signal_types + [gate_library['const0_type'], gate_library['const1_type']]

# Alias lookup for Lilas-style role and classes names
alias_role_names = {'Test' : 'te', 'Train' : 'tr', 'Validate' : 'va'}
alias_class_names = {'perturbb' : 'perturb',}

# Feature ordering
feature_list = primary_signal_types + gate_library['types'][0:17] + ['in_degree', 'out_degree'] + gate_library['types'][17:]
#feature_mapping = {feature: key for key, feature in enumerate(feature_list)}

with open("lilas_feature_mapping.json") as f:
    feature_mapping = json.load(f)

# Keep track of the node index in the mega graph of all netlists
base_index = 0

# Regex pattern to extract the class from a node name
regex_node_class = r"\\(\w+)/"

# Log the final node labeling used in GNN
node_labeling = {}

# Process every verilog file in the netlist directory tree
for root, dirs, files in os.walk(netlists_dir):
    for file_name in sorted(files):
        if file_name.endswith('.v'):
            # Read original graph
            file_path = os.path.join(root, file_name)
            print('Processing', file_path)
            G = read.verilogSynopsys(file_path)

            # Extract the role from the file name prefix
            role = file_name.split('_')[0]
            if role in alias_role_names:
                role = alias_role_names[role]
            print('Role:', role)
            if not role in roles:
                raise ValueError('\n Unrecognized graph role - ' + role + ' from\n' + file_name)

            # Relabel the gate nodes to integers and update the base index
            gate_nodes = [node for node in G.nodes if not G.nodes[node]['type'] in ignored_types]
            gate_nodes.sort(key=lambda x: G.nodes[x]['order'])
            relabel_mapping = {old_label:(new_label + base_index) for new_label, old_label in enumerate(gate_nodes)}
            base_index += len(relabel_mapping)

            for k in relabel_mapping:
                node_labeling[relabel_mapping[k]] = (k, G.nodes[k]['name'], file_name)

            nx.relabel.relabel_nodes(G, relabel_mapping, copy=False)

            # Reassign gate_nodes with the new integer labels
            gate_nodes = sorted(list(relabel_mapping.values()))

            # Keep track of nodes connected to primary outputs
            primary_output_nodes = set()

            # Process each gate node
            for node in gate_nodes:
                # Extract node class
                node_name = G.nodes[node]['name']
                node_class = default_class
                m = re.search(regex_node_class, node_name)
                if m:
                    node_class = m.group(1)
                    if node_class in alias_class_names:
                        node_class = alias_class_names[node_class]
                    if not node_class in class_key_mapping:
                        raise ValueError('\n Unrecognized node class - ' + node_class + ' from\n' + node_name)
                class_map[node] = class_key_mapping[node_class]

                # Extract connectivity degree
                feats[node]['in_degree'] = G.in_degree(node)
                feats[node]['out_degree'] = G.out_degree(node)

                # Extract PI, KI, PO connectivity count
                for neighbor in chain(G.predecessors(node), G.successors(node)):
                    neighbor_type = G.nodes[neighbor]['type']
                    if neighbor_type in primary_signal_types:
                        feats[node][neighbor_type] += 1
                    # Add self-loops for nodes connected to POs
                    if neighbor_type == 'OUTPUT':
                        primary_output_nodes.add(node)

                # Extract 2-hop gate neighborhood count (use 2-hop successor and predecessor cone, not true neighborhood)
                cone = set([node])
                cone.update(G.successors(node))
                for succ in G.successors(node):
                    cone.update(G.successors(succ))
                cone.update(G.predecessors(node))
                for pred in G.predecessors(node):
                    cone.update(G.predecessors(pred))
                for neighbor in cone:
                    neighbor_type = G.nodes[neighbor]['type']
                    if neighbor_type in primary_signal_types:
                        continue
                    neighbor_gate_type = gate_type[neighbor_type]
                    feats[node][neighbor_gate_type] += 1

            # Add the gate nodes to the role dict
            roles[role].extend(gate_nodes)

            # Add self-loops for nodes connected to primary outputs (done in Lilas)
            for node in list(primary_output_nodes):
                G.add_edge(node, node)

            # Convert into an undirected graph for GNN
            G = G.to_undirected()
               
            # Add the adjacency matrix to our list
            matrix = nx.convert_matrix.to_scipy_sparse_matrix(G, nodelist=gate_nodes, dtype=bool, weight=None, format='coo')
            full_matrixs.append(matrix)
            if role == 'tr':
                train_matrixs.append(matrix)
            else:
                # Save an empty matrix of the same size
                train_matrixs.append(sp.coo_matrix(matrix.get_shape(), dtype=bool))
            print('Nodes added:', matrix.get_shape()[0], '\n')

# Write outputs to specified directory
os.makedirs(output_dir, exist_ok=True)

# Create the mega matrix in Scipy CSR format
adj_full = sp.block_diag(full_matrixs, format='csr')
adj_train = sp.block_diag(train_matrixs, format='csr')
assert (adj_full.get_shape() == adj_train.get_shape())
sp.save_npz(os.path.join(output_dir, 'adj_full.npz'), adj_full)
sp.save_npz(os.path.join(output_dir, 'adj_train.npz'), adj_train)
node_count = adj_full.get_shape()[0]

# Save features as a numpy matrix
assert(len(feats) == node_count)
feats_array = np.zeros( (node_count, len(feature_mapping)),dtype=np.int32 )
for node in feats:
    for feature in feats[node]:
        row = node
        col = feature_mapping[feature]
        feats_array[row, col] = feats[node][feature]
np.save(os.path.join(output_dir, 'feats.npy'), feats_array)

# Save JSON files
with open(os.path.join(output_dir, 'class_map.json'), 'w') as f:
    json.dump(class_map, f)

with open(os.path.join(output_dir, 'role.json'), 'w') as f:
    json.dump(roles, f)

with open(os.path.join(output_dir, 'node_labeling.txt'), 'w') as f:
    for label in node_labeling:
        f.write(f"{label} {' '.join(node_labeling[label])}\n")