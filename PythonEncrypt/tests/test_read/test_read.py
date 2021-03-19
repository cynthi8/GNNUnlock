import read
import os.path

netlists = 'PythonEncrypt/tests/netlists'

def test_and_tree_bench():
    G = read.bench(os.path.join(netlists, 'and_tree.bench'))
    assert G.has_edge('10', '14')
    assert G.has_node('9')
    assert G.size() == 15