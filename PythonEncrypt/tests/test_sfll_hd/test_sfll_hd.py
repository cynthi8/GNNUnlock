import encrypt

def test_ham_dist_block():
    signature = (
        f'  integer ham_dist, idx;\n'
        f'  wire [7:0] diff;\n'
        f'  assign diff = sat_res_inputs ^ keyvalue;\n\n'
        f'  always@* begin\n'
        f'    ham_dist = 0;\n'
        f'    for(idx=0; idx<8; idx=idx+1) ham_dist = ham_dist + diff[idx];\n'
        f'  end\n\n'
    )
    assert encrypt.ham_dist_block('sat_res_inputs', 'keyvalue', 8, 'ham_dist') == signature