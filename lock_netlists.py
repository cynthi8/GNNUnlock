#!/usr/bin/env python3
import os
from pathlib import Path

from encrypt import pointfunc

verilog_benchmark_dir = 'VerilogBenchmarks'
ISCAS_85_sub_dir = 'ISCAS-85'
ITC_99_sub_dir = 'ITC-99'

locked_netlists_path = 'LockedNetlists'
anti_sat_sub_dir = 'AntiSAT'
sfll_sat_sub_dir = 'SFLL'

def file_count(dir):
    return len([name for name in os.listdir(dir) if os.path.isfile(os.path.join(dir, name))])

# NR -- Anti-SAT Generation
key_sizes = [8, 16, 32, 64]
lock_type = 'AntiSAT'
dest_dir = os.path.join(locked_netlists_path, lock_type, ISCAS_85_sub_dir)
Path(dest_dir).mkdir(parents=True, exist_ok=True)
for entry in os.scandir(os.path.join(verilog_benchmark_dir, ISCAS_85_sub_dir)):
    if entry.path.endswith(".v") and entry.is_file():
        circuit_name = Path(entry).stem
        for k in key_sizes:
            if (circuit_name == 'c3540' and k == 64):
                continue # Skip due to limited PIs in circuit
            for i in range(2):
                pointfunc(entry.path,"NR", k, None, os.path.join(dest_dir, f'{circuit_name}_{lock_type}_{k}_{i}.v'))
assert file_count(dest_dir) == 30

key_sizes = [32, 64, 128]
lock_type = 'AntiSAT'
dest_dir = os.path.join(locked_netlists_path, lock_type, ITC_99_sub_dir)
Path(dest_dir).mkdir(parents=True, exist_ok=True)
for entry in os.scandir(os.path.join(verilog_benchmark_dir, ITC_99_sub_dir)):
    if entry.path.endswith(".v") and entry.is_file():
        circuit_name = Path(entry).stem
        for k in key_sizes:
            for i in range(2):
                pointfunc(entry.path,"NR", k, None, os.path.join(dest_dir, f'{circuit_name}_{lock_type}_{k}_{i}.v'))
assert file_count(dest_dir) == 36


# FR -- SFLL-HD Generation
key_sizes = [8, 16, 32, 64]
h_values = [0, 2]
for h in h_values:
    lock_type = f'SFLL_HD_{h}'
    dest_dir = os.path.join(locked_netlists_path, lock_type, ISCAS_85_sub_dir)
    Path(dest_dir).mkdir(parents=True, exist_ok=True)
    for entry in os.scandir(os.path.join(verilog_benchmark_dir, ISCAS_85_sub_dir)):
        if entry.path.endswith(".v") and entry.is_file():
            circuit_name = Path(entry).stem
            for k in key_sizes:
                if (circuit_name == 'c3540' and k == 64):
                    continue # Skip due to limited PIs in circuit
                for i in range(3):
                    pointfunc(entry.path,"FR", k, h, os.path.join(dest_dir, f'{circuit_name}_{lock_type}_{k}_{i}.v'))
    assert file_count(dest_dir) == 45

key_sizes = [32, 64, 128]
h_values = [0, 2, 4]
for h in h_values:
    lock_type = f'SFLL_HD_{h}'
    dest_dir = os.path.join(locked_netlists_path, lock_type, ITC_99_sub_dir)
    Path(dest_dir).mkdir(parents=True, exist_ok=True)
    for entry in os.scandir(os.path.join(verilog_benchmark_dir, ITC_99_sub_dir)):
        if entry.path.endswith(".v") and entry.is_file():
            circuit_name = Path(entry).stem
            for k in key_sizes:
                for i in range(3):
                    pointfunc(entry.path,"FR", k, h, os.path.join(dest_dir, f'{circuit_name}_{lock_type}_{k}_{i}.v'))
    assert file_count(dest_dir) == 54