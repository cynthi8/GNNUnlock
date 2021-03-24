import read
import os.path

netlists = 'PythonEncrypt/tests/netlists'

def test_and_tree_bench():
    G = read.bench(os.path.join(netlists, 'and_tree.bench'))
    assert G.has_edge('N10', 'N14')
    assert G.has_node('N9')
    assert G.size() == 15

def test_feed_through_bench():
    G = read.bench(os.path.join(netlists, 'feed_through.bench'))
    assert G.nodes['N3_I']['type'] == 'INPUT'
    assert G.nodes['N3_O']['type'] == 'BUFF'
    assert G.nodes['N3_O_OUT']['type'] == 'OUTPUT'
    assert G.has_edge('N3_I', 'N3_O')
    assert G.has_edge('N3_O', 'N3_O_OUT')