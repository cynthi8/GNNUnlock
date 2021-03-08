#!/usr/bin/env python3
import os
from pathlib import Path

from encrypt import pointfunc

key_sizes = [8, 16, 32, 64]
verilog_benchmark_directory = './VerilogBenchmarks'
locked_netlist_directory = './LockedNetlists'
# NR -- Anti-SAT
# FR -- SFLL-HD(2)
for entry in os.scandir(verilog_benchmark_directory):
    if entry.path.endswith(".v") and entry.is_file():
        for k in key_sizes:
            pointfunc(entry.path,"NR", k, f'{locked_netlist_directory}/{Path(entry).stem}_AntiSAT_{k}.v')
            pointfunc(entry.path,"FR", k, f'{locked_netlist_directory}/{Path(entry).stem}_SFLL-HD(2)_{k}.v')
