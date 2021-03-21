#!/usr/bin/env python3
import os
from glob import glob
from pathlib import Path

import read
import write

benchmark_dir = 'Benchmarks'
ISCAS_85_sub_dir = 'ISCAS-85'
ITC_99_sub_dir = 'ITC-99'

verilog_benchmark_dir = 'VerilogBenchmarks'

for sub_dir in [ISCAS_85_sub_dir, ITC_99_sub_dir]:
    for file in glob(os.path.join(benchmark_dir, sub_dir, '*.bench')):
        graph = read.bench(file)
        print(file, graph.size())

        dest_dir = os.path.join(verilog_benchmark_dir, sub_dir)
        Path(dest_dir).mkdir(parents=True, exist_ok=True)
        write.verilog(graph, os.path.join(dest_dir, Path(file).stem))