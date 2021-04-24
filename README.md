# GNNUnlock
*Reproduction of https://github.com/DfX-NYUAD/GNNUnlock*

Steps: 
*the bolded directories at each step contain the relevant files.*

1. Obtain Benchmarks in *Bench* format. **`Benchmarks`**
2. Convert to Verilog. **`convert_bench_files_to_verilog.py`**, **`VerilogBenchmarks`**
3. Lock with SFLL and AntiSAT. **`lock_netlists.py`**, **`LockedNetlists`**
4. Synthesize with Design Compiler™. **`Synthesizer`**, **`SynthesizedLockedNetlists`**
5. Assign roles (train, validation, test). **`Datasets`**
6. Convert to graph and extract features. **`convert_netlists_to_graph.py`**, **`Graph`**
7. Train GNN. **`trainGNN.sh`**
