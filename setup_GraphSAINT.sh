# This script clones the GraphSAINT repository and build it (only run this once)
git clone https://github.com/GraphSAINT/GraphSAINT.git
cd GraphSAINT
python3 graphsaint/setup.py build_ext --inplace 
cd ..
