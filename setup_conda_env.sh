conda create -y --name gnnunlock-env python=3.6.8 tensorflow=1.12.0
conda activate gnnunlock-env
conda install -y -c anaconda numpy=1.14.3
conda install -y -c anaconda scipy=1.1.0 
conda install -y -c anaconda scikit-learn=0.19.1
conda install -y -c anaconda pyyaml=3.12
conda install -y -c conda-forge openmp=4.0
conda install -y -c anaconda cython=0.29.2
conda install -y -c anaconda networkx==2.5
conda env config vars set PYTHONPATH=$PWD'/PythonEncrypt/'
conda activate gnnunlock-env
