conda create -y --name gnnunlock-env python=3 tensorflow=1
conda activate gnnunlock-env
conda install -y -c anaconda numpy
conda install -y -c anaconda scipy
conda install -y -c anaconda scikit-learn
conda install -y -c anaconda pyyaml
conda install -y -c conda-forge openmp
conda install -y -c anaconda cython
conda install -y -c anaconda networkx=2
conda env config vars set PYTHONPATH=$PWD'/PythonEncrypt/'
conda activate gnnunlock-env
