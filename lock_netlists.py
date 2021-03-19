#!/usr/bin/env python3
import os
from pathlib import Path

from encrypt import pointfunc

key_sizes = [8, 16, 32, 64]
h_values = [0, 2, 4]

ISCAS_85_path = './VerilogBenchmarks/ISCAS-85'
ITC_99_path = './VerilogBenchmarks/ITC-99'

locked_netlists_path = './LockedNetlists'
# NR -- Anti-SAT
# FR -- SFLL-HD(2)
for entry in os.scandir(ISCAS_85_path):
    if entry.path.endswith(".v") and entry.is_file():
        for k in key_sizes:
            pointfunc(entry.path,"NR", k, f'{locked_netlists_path}/{Path(entry).stem}_AntiSAT_{k}.v')
            pointfunc(entry.path,"FR", k, f'{locked_netlists_path}/{Path(entry).stem}_SFLL-HD(2)_{k}.v')
