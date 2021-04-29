# This script formats the netlist directories to place each instantiation on only one line allowing a direct comparison
import os
import read

input_dirs = ['SynthesizedLockedNetlists', 'SynthesizedLockedNetlists_CrossedCompiled']

for input_dir in input_dirs:
    dest_dir = os.path.join('Formatted', input_dir)
    for root, dirs, files in os.walk(input_dir):
        for file_name in files:
            if file_name.endswith('.v'):
                # Create output directory structure 
                output_dir = root.replace(input_dir, dest_dir, 1)
                os.makedirs(output_dir, exist_ok=True)
                output_file_path = os.path.join(output_dir, file_name)

                # Output the formatted netlist
                input_file_path = os.path.join(root, file_name)
                print('Processing', input_file_path)
                with open(output_file_path, "w") as f:
                    f.write("\n".join(read.format_verilog_netlist(input_file_path)))
