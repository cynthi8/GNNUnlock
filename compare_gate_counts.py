import os
import networkx as nx
from collections import defaultdict

import read


base_dir = 'SynthesizedLockedNetlists/SFLL_HD_2/ISCAS-85'
compare_dir = base_dir.replace('SynthesizedLockedNetlists', 'SynthesizedLockedNetlists_CrossedCompiled')

# Nodes with these types are not gates and should excluded from the graph
primary_signal_types = ['INPUT', 'KEY_INPUT', 'OUTPUT']

# Process every verilog file in the netlist directory tree
for root, dirs, files in os.walk(base_dir):
    for file_name in files:
        if file_name.endswith('.v'):
            # Compare Gate Counts in each netlist
            base_path = os.path.join(root, file_name)
            compare_path = base_path.replace(base_dir, compare_dir, 1)
            print('Comparing', base_path, 'and', compare_path)

            base_graph = read.verilogSynopsys(base_path)
            compare_graph = read.verilogSynopsys(compare_path)

            base_gate_counts = defaultdict(int)
            base_gate_total = 0
            compare_gate_counts = defaultdict(int)
            compare_gate_total = 0

            for node in base_graph.nodes:
                base_gate_counts[base_graph.nodes[node]['type']] += 1
                base_gate_total += 1

            for node in compare_graph.nodes:
                compare_gate_counts[compare_graph.nodes[node]['type']] += 1
                compare_gate_total += 1

            print('Total', base_gate_total, compare_gate_total)
            for gate_type in sorted(set(list(base_gate_counts.keys()) + list(compare_gate_counts.keys()))):
                if not base_gate_counts[gate_type] == compare_gate_counts[gate_type]:
                    print(gate_type, base_gate_counts[gate_type], compare_gate_counts[gate_type])
