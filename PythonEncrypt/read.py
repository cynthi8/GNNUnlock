#!/usr/bin/env python

"""
This module contains functions to read design circuits.
:param design file path

Four functions have been designed for this purpose.
1. bench function to read a design specified in the bench format.
2. verilog function to read a design specified in the verilog format.
3. vhdl function to read a design specified in the vhdl format.
4. smv function to read a design specified in the smv format.

Returns:
    circuit -- networkx graph of design read from design file
"""

# Authorship information
__all__ = ['bench', 'verilog', 'vhdl', 'smv']
__author__ = "Yasaswy Kasarabada"
__credits__ = ["Yasaswy Kasarabada"]
__license__ = "Public Domain"
__version__ = "1.0"
__maintainer__ = "Yasaswy Kasarabada"
__contact__ = "yasaswy.kasarabada@gmail.com"
__status__ = "Development"


# Imported packages
import re
import networkx as nx
import random


# Method to read bench file
def bench(bench_file_path):
    """
    Function to read bench file.
    :param bench_file_path(string): Path to bench file
    :returns: the circuit as a networkx graph 
    """

    def _sanitize(name):
        # Identifiers for VHDL/Verilog should start with a character. 'N' is used in other "bench -> verilog" converters
        # http://www.pld.ttu.ee/~maksim/benchmarks/iscas85/verilog/ 
        if not name[0].isalpha():
            name = 'N' + name
        return name 

    # Regular expression for signal extraction
    regex_signal_extract = r".*\((.*?)\).*"
    regex_gate_out_extract = r"(.*?)=.*"
    regex_gate_type_extract = r".*=(.*?)\(.*"

    # Read bench file and store in graph
    circuit = nx.DiGraph()
    edge_list = []
    input_list = []
    output_list = []
    try:
        bench_file = open(bench_file_path, "r")
    except IOError:
        raise SystemExit("Could not open bench file.\nCheck if path is correct and try again.")
    
    with bench_file:
        for line in bench_file:
            line = line.strip()
            if not line or line.startswith('#'):
                continue
            if line.startswith("INPUT("):
                signal = re.findall(regex_signal_extract, line)[0].strip()
                signal = _sanitize(signal)
                assert not signal in input_list
                input_list.append(signal)
            elif line.startswith("OUTPUT("):
                signal = re.findall(regex_signal_extract, line)[0].strip()
                signal = _sanitize(signal)
                assert not signal in output_list
                output_list.append(signal)
            else:
                gate_type = re.findall(regex_gate_type_extract, line)[0].strip()
                gate_output = re.findall(regex_gate_out_extract, line)[0].strip()
                gate_output = _sanitize(gate_output)
                gate_inputs = [signal.strip() for signal in re.findall(regex_signal_extract, line)[0].strip().split(",")]
                circuit.add_node(gate_output, name=gate_output, type=gate_type)
                for gate_input in gate_inputs:
                    gate_input = _sanitize(gate_input)
                    edge_list.append((gate_input, gate_output))

        for feed_through in set(input_list).intersection(output_list):
            # Add a buffer between feed throughs
            buffer_input = feed_through
            buffer_output = feed_through + "_BUFF"
            circuit.add_node(buffer_input, name=buffer_input, type="INPUT")
            circuit.add_node(buffer_output, name=buffer_output, type="BUFF")
            circuit.add_node(buffer_output + "_OUT", name=buffer_output + "_OUT", type="OUTPUT")
            edge_list.append((buffer_input, buffer_output))
            edge_list.append((buffer_output, buffer_output + "_OUT"))
            input_list.remove(feed_through)
            output_list.remove(feed_through)

        for signal in input_list:
            circuit.add_node(signal, name=signal, type="INPUT")
        
        for signal in output_list:
            edge_list.append((signal, signal + "_OUT"))
            circuit.add_node(signal + "_OUT", name=signal, type="OUTPUT")

    circuit.add_edges_from(edge_list)

    # Return netlist graph
    return circuit


# Method to read verilog file
def verilog(verilog_file_path):
    """
    Function to read verilog gate level file.
    Note: 1. If a technology independent DFF gate is defined in the file, the dff gate instantiation should follow the following format. If this format is not followed, the resulting netlist read will have error.
                dff <gate_instantiation_name> (<clock_pin>, <Q_pin>, <D_pin>)
          2. If a reset pin is specified, the pin must be named 'RESET'. If a separate pin called 'RESET' already exists, reset pin must be named 'RST'.
    :param verilog_file_path(string): Path to verilog file
    :returns: the circuit as a networkx graph
    """

    # Global variables
    circuit = nx.DiGraph()
    edge_list = []
    newgate_count = 1
    newgate_name = 'newgate'
    regex_signal_extract = r".*\((.*?)\).*"

    # Function to format signal name
    def format_signal(signal_name):
        if signal_name=="1'b0":
            return "zero"
        if signal_name=="1'b1":
            return "one"
        while not signal_name[0].isalnum() and signal_name[0] not in ['_', '\\']:
            signal_name = signal_name[1:]
        while not signal_name[-1].isalnum() and signal_name[-1] not in ['_', '\\']:
            signal_name = signal_name[:-1]
        if signal_name.startswith('keyinput['):
            return re.sub('[^0-9a-zA-Z_]+', '', signal_name)
        return re.sub('[^0-9a-zA-Z_]+', '_', signal_name)

    # Function to format netlist
    def format_netlist(verilog_file_path):
        # Read circuit
        netlist = []
        full_line = ''
        for line in open(verilog_file_path, 'r'):
            line = line.strip()
            if not line or line.startswith('//'):
                continue
            if full_line and full_line[-1] == ",":
                full_line += " "
            if 'endmodule' in line:
                full_line += line[:line.index('endmodule')].strip()
                if full_line:
                    netlist.append(full_line)
                    full_line = ''
                netlist.append('endmodule')
                continue
            if ';' in line:
                full_line += line[:line.index(';')+1].strip()
                netlist.append(full_line)
                full_line = line[line.index(';')+1:].strip()
            else:
                full_line += line
        
        return netlist
    
    # Function to add new signal
    def create_signal():
        nonlocal newgate_count, newgate_name, internal_signals

        if newgate_count == 1:
            newgate_signals = [signal.replace(newgate_name, '') for signal in internal_signals+primary_inputs+primary_outputs if signal.startswith(newgate_name)]
            if newgate_signals:
                newgate_signals = [int(signal) for signal in newgate_signals if signal.isdigit()]
                newgate_count = max(newgate_signals)+1

        newgate_count += 1
        return newgate_name + str(newgate_count - 1)

    # Function to check if gate exists. Return gate output if gate exists
    def find_gate(gate_type, gate_inputs):
        try:
            assert gate_type
            assert all(gate_input.strip() for gate_input in gate_inputs)
        except AssertionError:
            raise ValueError(f"Cannot find gate of type {gate_type} with inputs {gate_inputs}")

        gate_inputs = [format_signal(gate_input) for gate_input in gate_inputs]
        if not all(gate_input in circuit for gate_input in gate_inputs):
            return ''
        # print(",".join(gate_inputs), flush=True)
        for gate_output in circuit.successors(gate_inputs[0]):
            if circuit[gate_output]['type'] == gate_type:
                if all(signal in circuit.predecessors(gate_output) for signal in gate_inputs):
                    return gate_output
        return ''

    # Function to add node and connection to graph
    def add_to_graph(gate_output, gate_type, gate_inputs):
        nonlocal circuit, edge_list

        try:
            assert gate_output
            assert gate_type
            assert all(gate_input.strip() for gate_input in gate_inputs)
        except AssertionError:
            raise ValueError(f"Cannot add to graph node {gate_output} of type {gate_type} with inputs {gate_inputs}")

        gate_output = format_signal(gate_output)
        gate_inputs = [format_signal(gate_input) for gate_input in gate_inputs]

        if gate_output not in circuit:
            circuit.add_node(gate_output, name=gate_output, type=gate_type)
        else:
            if circuit.nodes[gate_output]['type'] != gate_type:
                raise ValueError("Gate type mismatch on " + gate_output + " - " + circuit.nodes[gate_output]['type'] + " and " + gate_type)
        for gate_input in gate_inputs:
            edge_list.append((gate_input, gate_output))
    
    # Global variables
    primary_inputs, key_inputs, primary_outputs, clock_signals = [], [], [], []
    netlist = format_netlist(verilog_file_path)

    # Read verilog file and store in graph
    dff_module = False
    internal_signals = []
    for line in netlist:
        line = line.strip()
        if line.startswith('module') and line[6:line.index('(')].strip().lower() == 'dff':
            dff_module = True
            continue
        if dff_module:
            if line.startswith('endmodule'):
                dff_module = False
            continue
        if not line or 'module' in line or line.startswith('//'):
            continue
        if line.startswith('wire'):
            signal_list = [signal.strip() for signal in line[4:-1].strip().split(',')]
            for signal in signal_list:
                while '[' in signal:
                    assert ']' in signal, f"Wire {signal} is of invalid format"
                    signal = signal[:signal.index('[')] + signal[signal.index(']')+1:]
                internal_signals.append(signal)
            continue
        if line.startswith('input'):
            input_list = [signal.strip() for signal in line[5:-1].strip().split(',')]
            for primary_input in input_list:
                if '[' in primary_input and ']' in primary_input:
                    if ':' in primary_input:
                        lower_bound, upper_bound = int(primary_input[primary_input.index('[')+1:primary_input.index(':')].strip()), int(primary_input[primary_input.index(':')+1:primary_input.index(']')].strip())
                        if upper_bound < lower_bound:
                            lower_bound, upper_bound = upper_bound, lower_bound
                        primary_input = primary_input[primary_input.index(']')+1:].strip()
                        for index in range(lower_bound, upper_bound+1):
                            pi = primary_input + '[' + str(index) + ']' 
                            pi = format_signal(pi)
                            if 'keyinput' in primary_input.lower():
                                # pi = pi.replace('_','')
                                assert(pi.startswith('keyinput'))
                                assert(pi[8:].isdigit()) 
                                key_inputs.append(pi)
                            else:
                                primary_inputs.append(pi)
                            circuit.add_node(pi, name= pi, type='INPUT')
                    else:
                        primary_input = primary_input.strip()
                        pi = format_signal(primary_input)
                        if 'keyinput' in pi.lower():
                            assert(pi.startswith('keyinput'))
                            assert(pi[8:].isdigit())
                            key_inputs.append(pi)
                        else:
                            primary_inputs.append(pi)
                        circuit.add_node(pi, name=pi, type='INPUT')
                else:
                    primary_input = format_signal(primary_input)
                    if 'keyinput' in primary_input.lower():
                        assert(primary_input.startswith('keyinput'))
                        assert(primary_input[8:].isdigit())
                        key_inputs.append(primary_input)
                    else:
                        primary_inputs.append(primary_input)
                    circuit.add_node(primary_input, name=primary_input, type='INPUT')
        elif line.startswith('output'):
            output_list = [signal.strip() for signal in line[6:-1].strip().split(',')]
            for primary_output in output_list:
                if '[' in primary_output:
                    if ':' in primary_output:
                        lower_bound, upper_bound = int(primary_output[primary_output.index('[')+1:primary_output.index(':')].strip()), int(primary_output[primary_output.index(':')+1:primary_output.index(']')].strip())
                        if upper_bound < lower_bound:
                            lower_bound, upper_bound = upper_bound, lower_bound
                        primary_output = primary_output[primary_output.index(']')+1:].strip()
                        for index in range(lower_bound, upper_bound+1):
                            po = primary_output + '[' + str(index) + ']'
                            po = format_signal(po)
                            primary_outputs.append(po)
                            circuit.add_node(po+'_OUT', name=po, type='OUTPUT')
                            edge_list.append((po, po+'_OUT'))
                    else:
                        primary_output = primary_output.strip()
                        po = format_signal(primary_output)
                        primary_outputs.append(po)
                        circuit.add_node(po+'_OUT', name=po, type='OUTPUT')
                        edge_list.append((po, po+'_OUT'))
                else:
                    primary_output = format_signal(primary_output)
                    primary_outputs.append(primary_output)
                    circuit.add_node(primary_output+'_OUT', name=primary_output, type='OUTPUT')
                    edge_list.append((primary_output, primary_output+'_OUT'))
        elif line.startswith('assign'):
            signals = [signal for signal in line[:-1].split() if signal != 'assign' and signal != '=']
            # print(line)
            gate_output = signals[0]
            gate_input = signals[1]

            # Generate logic for assign
            gate_type = 'BUFF'
            if gate_input == "1'b0":
                if '1_b0' not in circuit:
                    add_to_graph('1_b0', 'XOR', [random.choice(primary_inputs)])
                gate_input = '1_b0'
            elif gate_input == "1'b1":
                if '1_b1' not in circuit:
                    add_to_graph('1_b1', 'XNOR', [random.choice(primary_inputs)])
                gate_input = '1_b1'
            # print(gate_output, gate_type, gate_input, flush=True)
            add_to_graph(gate_output, gate_type, [gate_input])
        elif line.startswith('tri'):
            print('\nTri-state wire in circuit - ' + line)
        else:
            # print(line)
            gate_params = [signal for signal in line.split() if signal != '(' and signal != ');']
            gate_type = gate_params[0].upper()
            gate_signals = [signal.strip() for signal in line[line.index('(')+1:line.rfind(')')].split(',')]

            # Check if any gate signal is a 1'b0 or a 1'b1
            for gate_signal in gate_signals:
                if "1'b0" in gate_signal:
                    if 'zero' not in circuit:
                        add_to_graph('zero', 'XOR', [random.choice(primary_inputs)])
                    gate_signal = gate_signal.replace("1'b0", "zero")
                elif "1'b1" in gate_signal:
                    if 'one' not in circuit:
                        add_to_graph('one', 'XOR', [random.choice(primary_inputs)])
                    gate_signal = gate_signal.replace("1'b1", "one")

            if gate_type.startswith('DFF'):
                
                # Find D, CLK, RST, SET, Q, QN
                D_input, Qn_output, Q_output, reset_input, set_input = '', '', '', '', ''
                for gate_signal in gate_signals:
                    signal = re.findall(regex_signal_extract, gate_signal)
                    if not signal:
                        if gate_signals.index(gate_signal) == 0:
                            clock_signals.append(gate_signal)
                        elif gate_signals.index(gate_signal) == 1:
                            Q_output = gate_signal
                        elif gate_signals.index(gate_signal) == 2:
                            D_input = gate_signal
                        else:
                            raise ValueError("\nDFF gate format should be 'dff <gate_instance> (<clock_pin>, <Q_output>, <D_input>)'")
                        continue
                    signal = signal[0].strip()
                    if gate_signal.startswith('.CLK'):
                        clock_signals.append(signal)
                    elif gate_signal.startswith('.D'):
                        D_input = signal
                    elif gate_signal.startswith('.QN'):
                        Qn_output = signal
                    elif gate_signal.startswith('.Q'):
                        Q_output = signal
                    elif gate_signal.startswith('.RST'):
                        reset_input = signal
                    elif gate_signal.startswith('.SET'):
                        set_input = signal
                    else:
                        raise ValueError("\nUnknown signal assignment - " + gate_signal)
                
                # Generate internal signals based on type of DFF
                if gate_type.startswith('DFFASR'):
                    # Generate !SET
                    set_input_inv = find_gate('NOT', [set_input])
                    if not set_input_inv:
                        set_input_inv = create_signal()
                        add_to_graph(set_input_inv, 'NOT', [set_input])
                    
                    # Generate !SET + D
                    set_signal = find_gate('OR', [set_input_inv, D_input])
                    if not set_signal:
                        set_signal = create_signal()
                        add_to_graph(set_signal, 'OR', [set_input_inv, D_input])

                    # Generate R(!SET + D)
                    reset_signal = find_gate('AND', [reset_input, set_signal])
                    if not reset_signal:
                        reset_signal = create_signal()
                        add_to_graph(reset_signal, 'AND', [reset_input, set_signal])

                    # Set final input
                    final_input = reset_signal

                elif gate_type.startswith('DFFAS'):
                    # Generate !SET
                    set_input_inv = find_gate('NOT', [set_input])
                    if not set_input_inv:
                        set_input_inv = create_signal()
                        add_to_graph(set_input_inv, 'NOT', [set_input])
                    
                    # Generate !SET + D
                    set_signal = find_gate('OR', [set_input_inv, D_input])
                    if not set_signal:
                        set_signal = create_signal()
                        add_to_graph(set_signal, 'OR', [set_input_inv, D_input])

                    # Set final input
                    final_input = set_signal

                elif gate_type.startswith('DFFAR'):
                    # Generate R(!SET + D)
                    reset_signal = find_gate('AND', [reset_input, D_input])
                    if not reset_signal:
                        reset_signal = create_signal()
                        add_to_graph(reset_signal, 'AND', [reset_input, D_input])

                    # Set final input
                    final_input = reset_signal
                
                elif gate_type.startswith('DFF'):
                    # Set final input
                    final_input = D_input
                
                else:
                    raise ValueError("\nGate type error - " + gate_type)             

                # Generate Q and QN logic
                if Qn_output:
                    if not Q_output:
                        new_signal = create_signal()
                        add_to_graph(new_signal, 'DFF', [final_input])
                        add_to_graph(Qn_output, 'NOT', [new_signal])
                    else:
                        add_to_graph(Q_output, 'DFF', [final_input])
                        # new_signal = create_signal()
                        # add_to_graph(new_signal, 'NOT', [final_input])
                        # add_to_graph(Qn_output, 'DFF', [new_signal])
                        add_to_graph(Qn_output, 'NOT', [Q_output])

                else:
                    if Q_output:
                        add_to_graph(Q_output, 'DFF', [final_input])
                    else:
                        continue
                        # raise NameError("\nDFF output pin error - no Q or Qn detected in '" + line + "'")

            elif gate_type.startswith(('BUF', 'NBUFF', 'IBUFF', 'INV', 'NOT', 'DELL')):

                # Find gate input and output
                gate_input, gate_output = '', ''
                for gate_signal in gate_signals:
                    if '(' in gate_signal and ')' in gate_signal:
                        signal = re.findall(regex_signal_extract, gate_signal)[0].strip()
                        if gate_signal.startswith('.IN'):
                            gate_input = signal
                        elif gate_signal.startswith('.Z'):
                            gate_output = signal
                        else:
                            raise ValueError("\nUnknown signal assignment - " + gate_signal)
                    else:
                        if gate_signals.index(gate_signal) == 0:
                            gate_output = gate_signal
                        else:
                            gate_input = gate_signal

                # Generate gate logic
                gate_type = 'BUFF' if gate_type.startswith(('BUF', 'NBUFF', 'DELL')) else 'NOT'
                add_to_graph(gate_output, gate_type, [gate_input])

            elif gate_type.startswith('AO') or gate_type.startswith('OA'):

                # Find gate inputs and output
                gate_inputs, gate_output = [], ''
                for gate_signal in gate_signals:
                    signal = re.findall(regex_signal_extract, gate_signal)[0].strip()
                    if gate_signal.startswith('.IN'):
                        gate_inputs.append(signal)
                    elif gate_signal.startswith('.Q'):
                        gate_output = signal
                    else:
                        raise ValueError("\nUnknown signal assignment - " + gate_signal)

                
                # Assign first and second gates.
                if gate_type.startswith('AOI'):
                    first_gate = 'AND'
                    second_gate = 'NOR'
                elif gate_type.startswith('OAI'):
                    first_gate = 'OR'
                    second_gate = 'NAND'
                elif gate_type.startswith('AO'):
                    first_gate = 'AND'
                    second_gate = 'OR'
                elif gate_type.startswith('OA'):
                    first_gate = 'OR'
                    second_gate = 'AND'
                else:
                    raise ValueError("\nGate type error - " + gate_type)
                
                # If odd number of inputs, add last input to second gate inputs
                second_gate_inputs = [] if len(gate_inputs) % 2 == 0 else [gate_inputs.pop()]
                
                # Add gate logic
                for index in range(0, len(gate_inputs), 2):
                    new_signal = find_gate(first_gate, [gate_inputs[index], gate_inputs[index+1]])
                    if not new_signal:
                        new_signal = create_signal()
                        add_to_graph(new_signal, first_gate, [gate_inputs[index], gate_inputs[index+1]])
                    second_gate_inputs.append(new_signal)
                add_to_graph(gate_output, second_gate, second_gate_inputs)
                 
            elif gate_type.startswith('MUX'):

                # Find gate inputs, select inputs and gate output
                gate_inputs, select_inputs, gate_output = [], [], ''
                for gate_signal in gate_signals:
                    signal = re.findall(regex_signal_extract, gate_signal)[0].strip()
                    if gate_signal.startswith('.IN'):
                        gate_inputs.append(signal)
                    elif gate_signal.startswith('.Q'):
                        gate_output = signal
                    elif gate_signal.startswith('.S'):
                        select_inputs.append(signal)
                    else:
                        raise ValueError("\nUnknown signal assignment - " + gate_signal)
                select_inputs.reverse()
                
                # Generate inverted select inputs
                inv_select_inputs = []
                for select_input in select_inputs:
                    new_signal = find_gate('NOT', [select_input])
                    if not new_signal:
                        new_signal = create_signal()
                        add_to_graph(new_signal, 'NOT', [select_input])
                    inv_select_inputs.append(new_signal)
                
                # Generate MUX logic
                internal_gate_outputs = []
                for gate_input in gate_inputs:
                    select_value = format(gate_inputs.index(gate_input), f"0{len(select_inputs)}b")
                    if len(select_value) < len(select_inputs):
                        select_value = '0' + select_value
                    select_signals = []
                    for bit in select_value:
                        bit_index = select_value.index(bit)
                        select_signals.append(inv_select_inputs[bit_index] if bit=='0' else select_inputs[bit_index])
                    new_signal = find_gate('AND', [gate_input] + select_signals)
                    if not new_signal:
                        new_signal = create_signal()
                        add_to_graph(new_signal, 'AND', [gate_input] + select_signals)
                    internal_gate_outputs.append(new_signal)
                add_to_graph(gate_output, 'OR', internal_gate_outputs)

            elif 'ADD' in gate_type:
                if gate_type.startswith('H'): # Half adder
                    gate_inputs, sum_output, carry_output = [], '', ''
                    for gate_signal in gate_signals:
                        signal = re.findall(regex_signal_extract, gate_signal)[0].strip()
                        if '.A0' in gate_signal or '.B0' in gate_signal:
                            gate_inputs.append(signal)
                        elif '.SO' in gate_signal:
                            sum_output = signal
                        elif '.C1' in gate_signal:
                            carry_output = signal
                        else:
                            raise ValueError("\nUnknown signal assignment - " + gate_signal)
                    
                    if sum_output:
                        add_to_graph(sum_output, 'XOR', gate_inputs)
                    if carry_output:
                        add_to_graph(carry_output, 'AND', gate_inputs)
                
                elif gate_type.startswith('F'): # Full adder
                    gate_inputs, sum_output, carry_output = [], '', ''
                    for gate_signal in gate_signals:
                        signal = re.findall(regex_signal_extract, gate_signal)[0].strip()
                        if '.A' in gate_signal or '.B' in gate_signal or '.CI' in gate_signal:
                            gate_inputs.append(signal)
                        elif '.S' in gate_signal:
                            sum_output = signal
                        elif '.CO' in gate_signal:
                            carry_output = signal
                        else:
                            raise ValueError("\nUnknown signal assignment - " + gate_signal)
                    assert(len(gate_inputs)==3)
                    
                    # Logic for sum
                    new_signal = create_signal()
                    add_to_graph(new_signal, 'XOR', gate_inputs[:2])
                    internal_gate_outputs = [new_signal, gate_inputs[2]]
                    if sum_output:
                        add_to_graph(sum_output, 'XOR', internal_gate_outputs)
                    # Logic for carry
                    if carry_output:
                        new_signal = create_signal()
                        add_to_graph(new_signal, 'AND', internal_gate_outputs)
                        internal_gate_outputs = [new_signal]
                        new_signal = create_signal()
                        add_to_graph(new_signal, 'AND', gate_inputs[:2])
                        internal_gate_outputs.append(new_signal)
                        add_to_graph(carry_output, 'OR', internal_gate_outputs)

                else:
                    raise ValueError("\nGate type error - " + gate_type)

            else:
                gate_types = ['AND', 'OR', 'NAND', 'NOR', 'XOR', 'XNOR']

                # Check gate type
                if gate_type.strip().upper() in gate_types:
                    gate_type = gate_type.strip().upper()
                else:
                    if gate_type[:-3].strip().upper() in gate_types:
                        gate_type = gate_type[:-3].strip().upper()
                    else:
                        raise ValueError("\nGate type error - " + gate_type)
                
                # Find gate inputs and output
                gate_inputs, gate_output = [], ''
                for gate_signal in gate_signals:
                    if '(' in gate_signal and ')' in gate_signal:
                        signal = re.findall(regex_signal_extract, gate_signal)[0].strip()
                        if gate_signal.startswith('.IN'):
                            gate_inputs.append(signal)
                        elif gate_signal.startswith('.Q'):
                            gate_output = signal
                        else:
                            raise ValueError("\nUnknown signal assignment - " + gate_signal)
                    else:
                        if gate_signals.index(gate_signal) == 0:
                            gate_output = gate_signal
                        else:
                            gate_inputs.append(gate_signal)
                
                # Add gate logic
                if gate_type in ['XOR', 'XNOR'] and len(gate_inputs) > 2:
                    if len(gate_inputs) > 3:
                        raise ValueError(f"\n{gate_type} cannot have more than 3 inputs.")
                    new_signal1 = find_gate(gate_type, gate_inputs[:2])
                    if not new_signal1:
                        new_signal2 = find_gate(gate_type, gate_inputs[1:])
                        if not new_signal2:
                            new_signal3 = find_gate(gate_type, [gate_inputs[0], gate_inputs[2]])
                            if not new_signal3:
                                new_signal = create_signal()
                                add_to_graph(new_signal, gate_type, gate_inputs[:2])
                                int_signals = gate_inputs[2:] + [new_signal]
                            else:
                                add_to_graph(new_signal3, gate_type, [gate_inputs[0], gate_inputs[2]])
                                int_signals = [gate_inputs[1], new_signal3]
                        else:
                            add_to_graph(new_signal2, gate_type, gate_inputs[1:])
                            int_signals = [gate_inputs[0], new_signal2]
                    else:
                        add_to_graph(new_signal1, gate_type, gate_inputs[:2])
                        int_signals = [gate_inputs[2], new_signal1]
                    add_to_graph(gate_output, 'XOR', int_signals)

                else:
                    add_to_graph(gate_output, gate_type, gate_inputs)
    circuit.add_edges_from(edge_list)

    # Remove clock signals from circuit
    remove_nodes = set()
    for clock_signal in clock_signals:
        if clock_signal not in circuit or not all(circuit.nodes[fanout]['type']=='DFF' for fanout in circuit.successors(clock_signal)):
            continue
        remove_nodes.add(clock_signal)
        queue = set(circuit.predecessors(clock_signal))
        while queue:
            # print(queue)
            new_queue = set()
            for signal in queue:
                if all(fanout in remove_nodes for fanout in circuit.successors(signal) if fanout != signal):
                    remove_nodes.add(signal)
                    if signal in primary_inputs:
                        continue
                    new_queue = new_queue.union(set(circuit.predecessors(signal)))
            # print("|", new_queue)
            queue.clear()
            queue = new_queue.copy()
            # for fanin in circuit.predecessors(signal):
            #     if all(fanout in remove_nodes for fanout in circuit.successors(fanin)):
            #         remove_nodes.add(fanin)
    # print(sorted(remove_nodes))
    circuit.remove_nodes_from(list(remove_nodes))

    # Return netlist grap)h
    return circuit


# Incomplete method. Do not use!!!!
def smv(smv_file_path):
    """
    (Incomplete) Function to read smv file.
    :param smv_file_path(string): Path to smv file
    :returns: the circuit as a networkx graph 
    """

    # Regular expression for signal extraction
    # regex_signal_extract = r".*\((.*?)\).*"
    # regex_gate_out_extract = r"(.*?)=.*"
    # regex_gate_type_extract = r".*=(.*?)\(.*"

    # Read verilog file and store in graph
    circuit = nx.DiGraph()
    for line in open(smv_file_path, 'r'):
        line = line.strip()

    # Return netlist graph
    return circuit


# Incomplete method. Do not use!!!!
def vhdl(vhdl_file_path):
    """
    (Incomplete) Function to read vhdl file.
    :param vhdl_file_path(string): Path to vhdl file
    :returns: the circuit as a networkx graph 
    """

    # Read verilog file and store in graph
    circuit = nx.DiGraph()
    for line in open(vhdl_file_path, 'r'):
        line = line.strip()

    # Return netlist graph
    return circuit