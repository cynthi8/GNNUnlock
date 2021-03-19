#!/usr/bin/env python3
import os
from glob import glob
from pathlib import Path

import read
import write

benchmark_directory = './Benchmarks'
verilog_benchmark_directory = './VerilogBenchmarks'

for walk_tuple in os.walk(benchmark_directory):
    for file in glob(os.path.join(walk_tuple[0], '*.bench')):
        graph = read.bench(file)
        print(file, graph.size())
        write.verilog(graph, os.path.join(verilog_benchmark_directory, Path(file).stem))
