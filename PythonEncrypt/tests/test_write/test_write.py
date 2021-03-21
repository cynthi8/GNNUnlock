import read
import write
import os

netlists = 'PythonEncrypt/tests/netlists'

def test_and_tree_bench():
    G_in = read.bench(os.path.join(netlists, 'and_tree.bench'))
    write.verilog(G_in,'temp')
    G = read.verilog('temp.v')
    assert G.has_edge('i_10', 'i_14')
    assert G.has_node('i_9')
    os.remove('temp.v')