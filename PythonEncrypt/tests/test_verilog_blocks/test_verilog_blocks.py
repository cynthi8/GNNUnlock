import encrypt

def test_unroll():
    assert encrypt.unroll(['some', 'kind', 'of', 'Python list']) == 'some, kind, of, Python list'

def test_unroll_single():
    assert encrypt.unroll(['some string']) == 'some string'

def test_instantiation_block():
    signature = '  SatHard block1 (flip_signal, U7044, R2358_U520, R2099_U33, U2521, SUB_450_U61, R2096_U24, R2358_U487, R2144_U95, keyinput0, keyinput1, keyinput2, keyinput3, keyinput4, keyinput5, keyinput6, keyinput7);\n'
    inputs_1 = ['U7044', 'R2358_U520', 'R2099_U33', 'U2521', 'SUB_450_U61', 'R2096_U24', 'R2358_U487', 'R2144_U95']
    inputs_2 = ['keyinput0', 'keyinput1', 'keyinput2', 'keyinput3', 'keyinput4', 'keyinput5', 'keyinput6', 'keyinput7']
    assert encrypt.instantiation_block('SatHard', 'block1', ['flip_signal'], inputs_1 + inputs_2) == signature

def test_module_block():
    signature = ( 
        f'*** Super Cool And3 Module ***\n'
        f'module And3 (output0, input0, input1, input2);\n'
        f'\n'
        f'  input input0, input1, input2;\n'
        f'  output output0;\n'
        f'  output0 = input0 & input1 & input2;\n'
        f'endmodule\n'
        f'*** Super Cool And3 Module ***\n'
    )

    outputs = ['output0']
    inputs = ['input0', 'input1', 'input2']
    logic_block = '  output0 = input0 & input1 & input2;\n'
    assert encrypt.module_block('And3', outputs, inputs, logic_block, '*** Super Cool And3 Module ***\n') == signature