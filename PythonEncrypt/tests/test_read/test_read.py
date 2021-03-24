import read
import os.path

netlists = 'PythonEncrypt/tests/netlists'

def test_and_tree_bench():
    G = read.bench(os.path.join(netlists, 'and_tree.bench'), False)
    assert G.has_edge('10', '14')
    assert G.has_node('9')
    assert G.size() == 15

def test_and_tree_bench_sanitize():
    G = read.bench(os.path.join(netlists, 'and_tree.bench'), True)
    assert G.has_edge('N10', 'N14')
    assert G.has_node('N9')
    assert G.size() == 15