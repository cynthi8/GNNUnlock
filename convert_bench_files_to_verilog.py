#!/usr/bin/env python3
import os
from pathlib import Path
from PythonEncrypt.read import bench as ReadBench
from PythonEncrypt.write import verilog as WriteVerilog

benchmark_directory = './Benchmarks'
verilog_benchmark_directory = './VerilogBenchmarks'

for entry in os.scandir(benchmark_directory):
    if entry.path.endswith(".bench") and entry.is_file():
        graph = ReadBench(entry.path)
        print(entry.name, graph.size())
        WriteVerilog(graph, f'{verilog_benchmark_directory}/{Path(entry).stem}')
