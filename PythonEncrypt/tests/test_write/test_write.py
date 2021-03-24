import read
import write
import os
import networkx as nx

netlists = 'PythonEncrypt/tests/netlists'

def test_and_tree_bench():
    G_in = read.bench(os.path.join(netlists, 'and_tree.bench'))
    write.verilog(G_in,'temp')
    G = read.verilog('temp.v')
    assert nx.is_isomorphic(G, G_in, lambda a, b: a['type'] == b['type'])
    os.remove('temp.v')

def test_feed_through_bench():
    G_in = read.bench(os.path.join(netlists, 'feed_through.bench'))
    write.verilog(G_in,'temp')
    G = read.verilog('temp.v')
    assert nx.is_isomorphic(G, G_in, lambda a, b: a['type'] == b['type'])
    os.remove('temp.v')