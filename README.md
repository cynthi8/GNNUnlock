# GNNUnlock
*Reproduction of https://github.com/DfX-NYUAD/GNNUnlock*

This project reproduces the steps of _Lilas Alrahis ect al._ in **GNNUnlock** up to evaluating the GNN (Graph Neural Network).

[SFLL-HD](#sfll-hd) explains that I was unable to reproduce the success of the original authors for netlists locked with SFLL-HD and [Cross Compilation](#cross-compilation) explains an essential shortcoming with **GNNUnlock**.

## SFLL-HD 

I chose to reproduce the setup in [ANTI_SAT_DATASET_c7552](https://github.com/DfX-NYUAD/GNNUnlock/blob/main/Netlist_to_graph/Circuits_datasets/ANTI_SAT_DATASET_c7552/) except with **SFLL-HD_2**. This setup uses 24 netlists of _c2670_ and _c5315_ as _training_ graphs, 9 netlists of _c3540_ as validation graphs, and 12 netlists of _c7552_ as _testing_ graphs (total: 45 netlists). Each netlist is locked with various key sizes and different values and are contained in [Datasets/SFLL_HD_2](Datasets/SFLL_HD_2).

The training log for this setup is shown in [Datasets/SFLL_HD_2/log_training.txt](Datasets/SFLL_HD_2/log_training.txt). The GNN performance on the _test_ graphs is shown below:

**Confusion Matrix**
| True \ Predicted | main | perturb | restore |
|:--------------:|:----:|:-------:|:-------:|
|      main      | 8367 |   195   |    0    |
|     perturb    |  81  |   657   |    83   |
|     restore    |   7  |    11   |   1014  |


**F1 Score by Class**
|  main | perturb | restore |
|:-----:|:-------:|:-------:|
| 0.983 | 0.780   | 0.953   |

**The GNN performs significantly worse on classifying pertub nodes**, which is expected as the GNN cannot use _Key Inputs_ as a determining feature like for restore nodes.

However, **these results contradict** those reported in **GNNUnlock**. GNNUnlock reports F1 scores above 99% for all node classes as shown in **Table V**, which I was unable to due for the same GNN training parameters - [DATE21.yml](DATE21.yml) - and a similar feature set.

![reported_success_of_GNNUnlock](https://user-images.githubusercontent.com/71356003/116633821-7b754100-a928-11eb-864a-ccd1d2aad9f0.png)

## Cross Compilation 
In **GNNUnlock**, _training_, _validation_, and _testing_ are all done on **non-cross-compiled** netlists. Any realistic implementation of logic locking would flatten the design heirarchy before compiling which would further obfuscate the main design/pertub/restore node classes.

All netlists were compiled with [Synthesizer/dc_shell_script.tcl](Synthesizer/dc_shell_script.tcl), while [Synthesizer/dc_shell_script_cross_compile.tcl](Synthesizer/dc_shell_script_cross_compile.tcl) would be a more "realistic" implementation.

# Setup Steps:
1. Run `source setup_conda_env.sh` to setup the anaconda enviroment
2. Run `setup_GraphSAINT.sh` to clone GraphSAINT and build it

_Remain in the `gnnunlock-env` anaconda enviroment while working within this repository._

# Reproduction Steps: 
*The bolded directories at each step contain the relevant files.*

1. Obtain Benchmarks in *Bench* format. **`Benchmarks`**
2. Convert to Verilog. **`convert_bench_files_to_verilog.py`**, **`VerilogBenchmarks`**
3. Lock with SFLL and AntiSAT. **`lock_netlists.py`**, **`LockedNetlists`**
4. Synthesize with Design Compiler™. **`Synthesizer`**, **`SynthesizedLockedNetlists`**
5. Assign roles (train, validation, test). **`Datasets`**
6. Convert to graph and extract features. **`convert_netlists_to_graph.py`**, **`Graph`**
7. Train GNN. **`trainGNN.sh`**

### Epochs Trained
Adjust the _phase: end_ parameter in [DATE21.yml](DATE21.yml) to increase the training time. Data were collected with `end: 2000` to be consistant with **GNNUnlock**.
