# GNNUnlock
*Reproduction of https://github.com/DfX-NYUAD/GNNUnlock*

This project reproduces the steps of _Lilas Alrahis et al._ in **GNNUnlock** up to evaluating the GNN (Graph Neural Network).

[SFLL-HD](#sfll-hd) explains that I was **able reproduce the success** of the original authors for netlists locked with SFLL-HD and [Cross Compilation](#cross-compilation) explains an **essential shortcoming** with **GNNUnlock**.

## SFLL-HD 

I chose to reproduce the setup in [ANTI_SAT_DATASET_c7552](https://github.com/DfX-NYUAD/GNNUnlock/blob/main/Netlist_to_graph/Circuits_datasets/ANTI_SAT_DATASET_c7552/) except with **SFLL-HD_2**. This setup uses 24 netlists of _c2670_ and _c5315_ as _training_ graphs, 9 netlists of _c3540_ as validation graphs, and 12 netlists of _c7552_ as _testing_ graphs (total: 45 netlists). Each netlist is locked with various key sizes and different values and are contained in [Datasets/SFLL_HD_2](Datasets/SFLL_HD_2).

The training log for this setup is shown in [Datasets/SFLL_HD_2/log_training.txt](Datasets/SFLL_HD_2/log_training.txt). The GNN performance on the _test_ graphs is shown below:

**Confusion Matrix**
| True \ Predicted | restore | perturb | main |
|:--------------:|:----:|:-------:|:-------:|
|restore|888|0  |0|
|perturb|0  |654|22|
|main   |15 |5  |8518|


**F1 Score by Class**
|  main | perturb | restore |
|:-----:|:-------:|:-------:|
| 0.992 | 0.980   | 0.998   |

## Cross Compilation 
In **GNNUnlock**, _training_, _validation_, and _testing_ are all done on **non-cross-compiled** netlists. Any realistic implementation of logic locking would flatten the design heirarchy before compiling which would further obfuscate the main design/pertub/restore node classes.

All netlists were compiled with [Synthesizer/dc_shell_script.tcl](Synthesizer/dc_shell_script.tcl), while [Synthesizer/dc_shell_script_cross_compile.tcl](Synthesizer/dc_shell_script_cross_compile.tcl) would be a more "realistic" implementation.

# Setup Steps:
1. Run `source setup_conda_env.sh` to setup the anaconda enviroment
2. Run `setup_GraphSAINT.sh` to clone GraphSAINT and build it

_Remain in the `gnnunlock-env` anaconda enviroment while working within this repository._

# Reproduction Steps: 
*The bolded directories at each step contain the relevant files.*

1. Obtain Benchmarks in *Bench* format. These are already saved in **Benchmarks**
2. Convert to Verilog.
```python convert_bench_files_to_verilog.py```
3. Lock with SFLL and AntiSAT. 
```python lock_netlists.py```
4. Synthesize with Design Compiler™. Examples are already saved in **SynthesizedLockedNetlists**
```
cd Synthesizer/ 
python synthesize_netlists.py
```
5. Assign roles (train, validation, test). Examples are saved in **Datasets**
6. Convert to graph and extract features. 
```
python convert_netlists_to_graph.py
```
7. Train GNN.
```
./trainGNN.sh
```

### Epochs Trained
Adjust the `phase: end` parameter in [DATE21.yml](DATE21.yml) to increase the training time. Data were collected with `end: 2000` to be consistant with **GNNUnlock**.
