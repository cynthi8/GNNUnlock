#!/usr/bin/env python3
# This script synthesizes all the locked netlists by calling dc_shell and passing the synthesis command file
import os
import subprocess

locked_netlists_path = '../LockedNetlists'
output_path = '../SynthesizedLockedNetlists'

for file_dir, _, files in os.walk(locked_netlists_path):
    output_dir = file_dir.replace(locked_netlists_path, output_path)
    os.makedirs(output_dir, exist_ok=True)
    for file_name in files:
        input_file = os.path.join(file_dir, file_name)
        output_file = os.path.join(output_dir, file_name)
        subprocess.run(['dc_shell', '-f', 'dc_shell_script.tcl', '-x', f'set input_file {input_file}; set output_file {output_file}'])

output_path = '../SynthesizedLockedNetlists_CrossedCompiled'

for file_dir, _, files in os.walk(locked_netlists_path):
    output_dir = file_dir.replace(locked_netlists_path, output_path)
    os.makedirs(output_dir, exist_ok=True)
    for file_name in files:
        input_file = os.path.join(file_dir, file_name)
        output_file = os.path.join(output_dir, file_name)
        subprocess.run(['dc_shell', '-f', 'dc_shell_script_cross_compile.tcl', '-x', f'set input_file {input_file}; set output_file {output_file}'])
