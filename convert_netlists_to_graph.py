import os
import re
import json
import scipy.sparse as sp
import numpy as np
import networkx as nx
from collections import defaultdict

import read

netlists_dir = 'Datasets/SFLL_HD_2'
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
class_key_mapping = {'main': 0, 'perturb': 1, 'restore': 2}
if locking_type == 'AntiSAT':
    class_key_mapping = {'main': 0, 'flip': 1}

# Nodes with these types are not gates and should excluded from the graph
primary_signal_types = ['INPUT', 'KEY_INPUT', 'OUTPUT']

# Feature ordering
feature_list = primary_signal_types + ['in_degree', 'out_degree', 'AND2X1', 
'AND3X1', 'AND4X1', 'AO21X1', 'AO221X1', 'AO222X1', 'AO22X1', 'AOI21X1', 
'AOI221X1', 'AOI222X1', 'AOI22X1', 'FADDX1', 'INVX0', 'INVX2', 'INVX4', 
'MUX21X1', 'MUX41X1', 'NAND2X0', 'NAND3X0', 'NAND4X0', 'NBUFFX2', 'NOR2X0', 
'NOR3X0', 'NOR4X0', 'OA21X1', 'OA221X1', 'OA222X1', 'OA22X1', 'OAI21X1', 'OAI221X1', 
'OAI222X1', 'OAI22X1', 'OR2X1', 'OR3X1', 'OR4X1', 'XNOR2X1', 'XNOR3X1', 'XOR2X1', 'XOR3X1']
feature_mapping = {feature: key for key, feature in enumerate(feature_list)}

# Keep track of the node index in the mega graph of all netlists
base_index = 0

# Regex pattern to extract the class from a node name
regex_node_class = r"\\(\w+)/"

# Process every verilog file in the netlist directory tree
for root, dirs, files in os.walk(netlists_dir):
    for file_name in files:
        if file_name.endswith('.v'):
            # Read original graph
            file_path = os.path.join(root, file_name)
            print('Processing', file_path)
            G = read.verilogSynopsys(file_path)

            # Extract the role from the file name prefix
            role = file_name.split('_')[0]
            print('Role:', role)
            if not role in roles:
                raise ValueError('\n Unrecognized graph role -' + role + ' from\n' + file_name)

            # Relabel the gate nodes to integers and update the base index
            gate_nodes = [node for node in G.nodes if not G.nodes[node]['type'] in primary_signal_types]
            relabel_mapping = {old_label:(new_label + base_index) for new_label, old_label in enumerate(gate_nodes)}
            base_index += len(relabel_mapping)
            nx.relabel.relabel_nodes(G, relabel_mapping, copy=False)

            # Create a subgraph of only the gates
            gate_nodes = list(relabel_mapping.values())
            H = G.subgraph(gate_nodes)

            # Process each gate node
            for node in H.nodes:
                # Extract node class
                node_name = G.nodes[node]['name']
                node_class = default_class
                m = re.search(regex_node_class, node_name)
                if m:
                    node_class = m.group(1)
                    if not node_class in class_key_mapping:
                        raise ValueError('\n Unrecognized node class -' + node_class + ' from\n' + node_name)
                class_map[node] = class_key_mapping[node_class]

                # Extract connectivity degree
                feats[node]['in_degree'] = G.in_degree(node)
                feats[node]['out_degree'] = G.out_degree(node)

                # Extract PI, KI, PO connectivity count
                for neighbor in G.neighbors(node):
                    neighbor_type = G.nodes[neighbor]['type']
                    if neighbor_type in primary_signal_types:
                        feats[node][neighbor_type] += 1

                # Extract 2-hop gate neighborhood count 
                for neighbor in nx.generators.ego.ego_graph(G, node, radius=2, center=True, undirected=True, distance=None):
                    neighbor_type = G.nodes[neighbor]['type']
                    if neighbor_type in primary_signal_types:
                        continue
                    if not neighbor_type in feature_list:
                        raise ValueError('\n Unrecognized feature - ' + neighbor_type)
                    feats[node][neighbor_type] += 1

            # Convert into an undirected graph for GNN
            G = G.to_undirected()

            # Add the gate nodes to the role dict
            roles[role].extend(list(H.nodes))

            # Add the adjacency matrix to our list
            matrix = nx.convert_matrix.to_scipy_sparse_matrix(H, dtype=bool, format='coo')
            full_matrixs.append(matrix)
            if role == 'tr':
                train_matrixs.append(matrix)
            else:
                # Save an empty matrix of the same size
                train_matrixs.append(sp.coo_matrix(matrix.get_shape()))
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