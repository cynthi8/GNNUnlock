import os
import re
import json
import scipy.sparse as sp
import numpy as np
import networkx as nx
from collections import defaultdict

import sys
sys.path.append("PythonEncrypt")

import read

netlists_dir = 'SynthesizedLockedNetlists/AntiSAT/ISCAS-85/'
graph_dir = 'Graph'

#adj_full
#adj_train
role = {'te': [], 'tr': [], 'va': []}
class_map = {}
feats = defaultdict(lambda: defaultdict(int))

# Keep track of the node index in the mega graph of all netlists
base_index = 0

# Regex pattern to extract the class from a node name
regex_node_class = r"\\(\w+)/"

# Class definition for gate nodes
default_class = 'main'
valid_classes = ['main', 'flip', 'perturb', 'restore']

# Nodes with these types are not gates and should excluded from the graph
primary_signal_types = ['INPUT', 'KEY_INPUT', 'OUTPUT']

# Convert every verilog file in the netlist directory tree
for root, dirs, files in os.walk(netlists_dir):
    for file_name in files:
        if file_name.endswith('.v'):
            # Read original graph
            file_path = os.path.join(root, file_name)
            G = read.verilogSynopsys(file_path)

            # Relabel the gate nodes to integers and update the base index
            gate_nodes = [node for node in G.nodes if not G.nodes[node]['type'] in primary_signal_types]
            relabel_mapping = {old_label:(new_label + base_index) for new_label, old_label in enumerate(gate_nodes)}
            base_index += len(relabel_mapping)
            nx.relabel.relabel_nodes(G, relabel_mapping, copy=False)

            # Create a subgraph of only the gates
            gate_nodes = list(relabel_mapping.values())
            H = G.subgraph(gate_nodes)
            
            # Print out G for debugging
            with open('graph.txt', 'w') as f:
                for node in G.nodes(data=True):
                    f.write(str(node) + '\n')

            # Process each gate node
            for node in H.nodes:
                # Extract node class
                node_name = G.nodes[node]['name']
                node_class = default_class
                m = re.search(regex_node_class, node_name)
                if m:
                    node_class = m.group(1)
                    if not node_class in valid_classes:
                        raise ValueError('\n Unrecognized node class -' + node_class + ' from\n' + node_name)
                class_map[node] = node_class

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
                    feats[node][neighbor_type] += 1


            # Turn into an undirected graph

            # Convert to Scipy CSR format

            

            break
            