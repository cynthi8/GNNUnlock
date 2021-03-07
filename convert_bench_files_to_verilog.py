#!/usr/bin/env python3
import os
import networkx as nx
from PythonEncrypt.read import bench as ReadBench
from PythonEncrypt.write import verilog as WriteVerilog

benchmark_directory = './Benchmarks'
python_encrypt_directory = './PythonEncrypt'

for entry in os.scandir(benchmark_directory):
    if entry.path.endswith(".bench") and entry.is_file():
        graph = ReadBench(entry.path)
        print(graph.size())
        WriteVerilog(graph, f'{benchmark_directory}/{entry.name}')

        print(entry.name)