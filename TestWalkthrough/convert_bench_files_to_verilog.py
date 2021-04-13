import os
from glob import glob
from pathlib import Path

import read
import write

benchmark_dir = './'
verilog_benchmark_dir = './'

for file in glob(os.path.join(benchmark_dir, '*.bench')):
    graph = read.bench(file)
    print(file, graph.size())
    write.verilog(graph, os.path.join(verilog_benchmark_dir, Path(file).stem))
