import os
import pytest

import encrypt
import read
import write

netlists = 'PythonEncrypt/tests/netlists'

def test_ham_dist_block():
    signature = (
        f'  integer ham_dist, idx;\n'
        f'  wire [7:0] diff;\n'
        f'  assign diff = sat_res_inputs ^ keyvalue;\n\n'
        f'  always@* begin\n'
        f'    ham_dist = 0;\n'
        f'    for(idx=0; idx<8; idx=idx+1) ham_dist = $signed($unsigned(ham_dist) + diff[idx]);\n'
        f'  end\n\n'
    )
    assert encrypt.ham_dist_block('sat_res_inputs', 'keyvalue', 8, 'ham_dist') == signature

def test_enough_PIs():
    encrypt.pointfunc(os.path.join(netlists, 'and_tree.v'), 'FR', 8, 0, os.path.join(netlists, 'temp.v'))
    os.remove(os.path.join(netlists, 'temp.v'))

def test_not_enough_PIs():
    with pytest.raises(ValueError):
        encrypt.pointfunc(os.path.join(netlists, 'and_tree.v'), 'FR', 9, 0, os.path.join(netlists, 'temp.v'))
    