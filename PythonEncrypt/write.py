#!/usr/bin/env python

"""
This module contains functions to write design circuits.
:param circuit -- networkx graph of design
:param design file path

Four functions have been designed for this purpose.
1. bench function to write a design in the bench format.
2. verilog function to write a design in the verilog format.
3. vhdl function to write a design in the vhdl format.
4. smv function to write a design in the smv format.

Returns:
    success -- True
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
import copy

# Global variables
single_ip_gates = ['DFF', 'NOT', 'BUFF']


# Function to write netlist in bench format
def bench(circuit_graph, bench_file_path):
    """
    Function to write bench file.
    
    Arguments:
        circuit_graph {networkx.DiGraph} -- Circuit graph obtained from read functions.
        bench_file_path {string} -- Path to bench file.
    
    Returns:
        True
    """

    global single_ip_gates
    netlist = circuit_graph.copy()
    primary_inputs = [signal for signal, sigattr in netlist.node.items() if sigattr['type'] == 'INPUT']
    key_inputs = [signal for signal in primary_inputs if signal.startswith('keyinput')]
    primary_inputs = [signal for signal in primary_inputs if signal not in key_inputs]
    primary_outputs = [signal[:-4] for signal, sigattr in netlist.node.items() if sigattr['type'] == 'OUTPUT']
    
    with open(bench_file_path, 'w') as bench_file:
        # Write primary inputs and primary outputs
        bench_file.write("INPUT(" + ")\nINPUT(".join(sorted(primary_inputs)) + ")\n")
        if key_inputs:
            if all('_' in key_input for key_input in key_inputs):
                assert all(key_input[key_input.rfind('_')+1:].isdigit() for key_input in key_inputs)
                bench_file.write("INPUT(" + ")\nINPUT(".join(sorted(key_inputs, key=lambda keyip:(int(keyip[8:keyip.index('_')]), int(keyip[keyip.index('_')+1:])))) + ")\n")
            elif any('_' in key_input for key_input in key_inputs):
                raise ValueError("Invalid key inputs found")
            else:
                bench_file.write("INPUT(" + ")\nINPUT(".join(sorted(key_inputs, key=lambda keyip:int(keyip[8:]))) + ")\n")
        bench_file.write("OUTPUT(" + ")\nOUTPUT(".join(sorted(primary_outputs)) + ")\n")
            
        # Write netlist logic
        for signal in sorted(list(netlist.nodes()), key=lambda sig:netlist.node[sig]['name']):
            sigattr = netlist.node[signal]
            if sigattr['type'] == 'INPUT' or sigattr['type'] == 'OUTPUT':
                continue
            gate_output, gate_type = sigattr['name'], sigattr['type']
            gate_inputs = [netlist.node[fanin]['name'] for fanin in netlist.predecessors(signal)]
            if gate_type not in single_ip_gates and len(gate_inputs) < 2:
                gate_inputs.append(gate_inputs[0])
            bench_file.write(gate_output + " = " + gate_type + "(" + ", ".join(gate_inputs) + ")\n")
    
    return True


# Function to write netlist in smv format
def smv(circuit_graph, smv_file_path):
    """
    Function to write smv file.
    
    Arguments:
        circuit_graph {networkx.DiGraph} -- Circuit graph returned by the read functions.
        smv_file_path {string} -- Path to smv file.
    
    Returns:
        True
    """

    global single_ip_gates
    smv_file = open(smv_file_path, 'w')
    smv_file.write("-- SMV file\n\n")
    netlist = circuit_graph.copy()
    
    # Combinational gate operators and negators
    gate_attr = {
        'AND' : ['', ' & '], 'NAND': ['!', ' & '],
        'OR'  : ['', ' | '], 'NOR' : ['!', ' | '],
        'XOR' : ['', ' xor '], 'XNOR': ['', ' xnor '],
        'BUFF': ['', ''], 'NOT' : ['!', '']
    }
    
    # Change variable names to avoid conflict with keywords
    keywords = {'F', 'G', 'X', 'U', 'V', 'W', 'H', 'O', 'Y', 'Z', 'S', 'T', 'B', 'word', 'word1', 'bool', 'init'}
    for signal, sigattr in netlist.node.items():
        if sigattr['name'].upper() in keywords or sigattr['name'].lower() in keywords:
            sigattr['name'] += "_sig"

    # Write DFF module
    dff_outputs = [sigattr['name'] for signal, sigattr in netlist.node.items() if sigattr['type'] == 'DFF']
    if dff_outputs:
        smv_file.write(
            "-- Module describing D flip-flop\n"
            "MODULE DFF(D)\nVAR\n\tOUT : boolean;\nASSIGN\n\tinit(OUT) := FALSE;\n\tnext(OUT) := D;\n\n"
        )
    
    # Write main module
    smv_file.write(
        "-- Main module\n"
        "MODULE main\n"
        "IVAR\n\t-- Primary inputs\n\t")
    
    # Find and write primary inputs
    primary_inputs = [sigattr['name'] for signal, sigattr in netlist.node.items() if sigattr['type'] == 'INPUT']
    primary_inputs.sort()
    smv_file.write(" : boolean;\n\t".join(primary_inputs) + " : boolean;\n\n")

    # Separate sequential and combinational sub-circuits
    seq_ckt, comb_ckt = [], []
    for signal, sigattr in netlist.node.items():
        if sigattr['type'] == 'INPUT' or sigattr['type'] == 'OUTPUT':
            continue
        gate_output, gate_type, gate_inputs = sigattr['name'], sigattr['type'], []
        for node in netlist.predecessors(signal):   
            if netlist.node[node]['type']=='OUTPUT':
                node = next(netlist.predecessors(node))
            if node in dff_outputs:
                gate_inputs.append(netlist.node[node]['name'] + ".OUT")
            else:
                gate_inputs.append(netlist.node[node]['name'])
        if gate_type not in single_ip_gates and len(gate_inputs) < 2:
            gate_inputs.append(gate_inputs[0])
        if sigattr['type'] == 'DFF':
            seq_ckt.append(gate_output + " : DFF(" + ", ".join(gate_inputs) + ");")
        else:
            comb_ckt.append(gate_output + " := " + gate_attr[gate_type][0] + "(" + gate_attr[gate_type][1].join(gate_inputs) + ");")

    # Write sequential sub-circuit
    smv_file.write("VAR\n\t-- Main netlist (sequential)\n\t")
    smv_file.write("\n\t".join(seq_ckt) + "\n\n")

    # Write combinational sub-circuit
    smv_file.write("DEFINE\n\t-- Main netlist (combinational)\n\t")
    smv_file.write("\n\t".join(comb_ckt) + "\n\n")

    smv_file.close()
    return True


# Function to write netlist in verilog format
def verilog(circuit_graph, verilog_file_path):
    """
    Function to write verilog gate level file.

    Arguments:
        circuit_graph {networkx.DiGraph} -- Circuit graph returned by the read functions.
        verilog_file_path {string} -- Path to verilog file.
    
    Returns:
        True
    """

    global single_ip_gates

    netlist = circuit_graph.copy()
    if verilog_file_path[-2:] != ".v":
        verilog_file_path += ".v"
    verilog_file = open(verilog_file_path, 'w')
    benchmark = verilog_file_path[verilog_file_path.rfind('/')+1:verilog_file_path.rfind('.')]
    verilog_file.write("// Main module\nmodule "+ benchmark + "(")

    # Write primary inputs and outputs
    primary_inputs = [signal for signal, sigattr in netlist.node.items() if sigattr['type'] == 'INPUT']
    primary_outputs = [signal[:-4] for signal, sigattr in netlist.node.items() if sigattr['type'] == 'OUTPUT']
    dff_outputs = [signal for signal, sigattr in netlist.node.items() if sigattr['type'] == 'DFF']
    if dff_outputs:
        if 'CK' not in primary_inputs:
            primary_inputs.append('CK')
            clock_pin = 'CK'
        elif 'CLK' not in primary_inputs:
            primary_inputs.append('CLK')
            clock_pin = 'CLK'
        elif 'CLOCK' not in primary_inputs:
            primary_inputs.append('CLOCK')
            clock_pin = 'CLOCK'
        else:
            assert('NEWCLOCK' not in primary_inputs)
            primary_inputs.append('NEWCLOCK')
            clock_pin = 'NEWCLOCK'
        if 'RST' in primary_inputs:
            reset_pin = 'RST'
        elif 'rst' in primary_inputs:
            reset_pin = 'rst'
        elif 'RESET' in primary_inputs:
            reset_pin = 'RESET'
        elif 'reset' in primary_inputs:
            reset_pin = 'reset'
        else:
            reset_pin = 'RESET'
            primary_inputs.append(reset_pin)
    verilog_file.write(
        ", ".join(primary_inputs + primary_outputs) + ");\n\n"
        "  input " + ", ".join(primary_inputs) + ";\n"
        "  output " + ", ".join(primary_outputs) + ";\n"
    )

    # Write internal signal declaration
    internal_signals = [signal for signal, sigattr in netlist.node.items() if sigattr['type'] != 'INPUT' and sigattr['type'] != 'OUTPUT']
    verilog_file.write("  wire " + ", ".join([signal for signal in internal_signals if signal not in primary_outputs]) + ";\n\n")

    # Write netlist
    gate_count = 1
    for signal in sorted(internal_signals):
        gate_output, gate_type = netlist.node[signal]['name'], netlist.node[signal]['type'].lower()
        gate_inputs = [netlist.node[gate_input]['name'] for gate_input in netlist.predecessors(signal)]
        
        # Add clock and reset pin for DFF
        if gate_type == 'dff':
            gate_inputs.append(clock_pin)
            gate_inputs.append(reset_pin)
        
        # If same signal is connected twice to a non-single input gate, add the connection again
        if gate_type.upper() not in single_ip_gates and len(gate_inputs) < 2:
            gate_inputs.append(gate_inputs[0])
        gate_type = 'buf' if gate_type=='buff' else gate_type
        verilog_file.write(f"  {gate_type} ginst{gate_count} ({gate_output}, {', '.join(gate_inputs)});\n")
        gate_count += 1
    verilog_file.write("\nendmodule\n")

    # Write dff module
    if dff_outputs:
        verilog_file.write(
            "\n// DFF module\nmodule dff(q, d, ck, rst);\n\ninput d, ck, rst;\noutput q;\nreg q;\n\n"
            "  always @(posedge ck)\n  begin\n    if (rst)  q <= 1\'b0;\n   else  q <= d;\n  end\nendmodule\n"
        )

    verilog_file.close()

    return True


# Function to write netlist in vhdl format
def vhdl(circuit_graph, vhdl_file_path):
    """
    Function to write vhdl file.
    
    Arguments:
        circuit_graph {networkx.DiGraph} -- Circuit graph obtained from read functions.
        vhdl_file_path {str} -- Path to vhdl file.
    
    Returns:
        True
    """

    vhdl_file = open(vhdl_file_path, 'w')
    netlist = circuit_graph.copy()

    vhdl_file.write(
        'library ieee;\nuse IEEE.STD_LOGIC_1164.all;\n'
        'use IEEE.std_logic_unsigned.all;\n\n'
    )
    
    benchmark = vhdl_file_path[vhdl_file_path.rfind('/')+1:vhdl_file_path.rfind('.')]
    vhdl_file.write(f'entity {benchmark} is port(\n\t')
    
    primary_inputs = [signal for signal, sigattr in netlist.node.items() if sigattr['type'] == 'INPUT']
    primary_outputs = [signal[:-4] for signal, sigattr in netlist.node.items() if sigattr['type'] == 'OUTPUT']
    dff_outputs = [signal for signal, sigattr in netlist.node.items() if sigattr['type'] == 'DFF']
    if dff_outputs:
        if 'CK' not in primary_inputs:
            primary_inputs.append('CK')
        clock_pin = 'CK'
        if 'RST' in primary_inputs:
            reset_pin = 'RST'
        elif 'rst' in primary_inputs:
            reset_pin = 'rst'
        elif 'RESET' in primary_inputs:
            reset_pin = 'RESET'
        elif 'reset' in primary_inputs:
            reset_pin = 'reset'
        else:
            reset_pin = 'RESET'
            primary_inputs.append(reset_pin)
    
    vhdl_file.write(
        ' : in std_logic;\n\t'.join(primary_inputs) + ' : in std_logic;\n\t'
        ' : out std_logic;\n\t'.join(primary_outputs) + ' : out std_logic);\nend ' + benchmark + ';\n\n'
    )
    
    internal_signals = [signal for signal, sigattr in netlist.node.items() if sigattr['type'] != 'INPUT' and sigattr['type'] != 'OUTPUT' and signal not in primary_outputs]
    
    if dff_outputs:
        vhdl_file.write(
            f'architecture mixed of {benchmark} is\n'
            f'component dff port(q: out std_logic; d, clk, rst: in std_logic); end component;\n'
        )
    else:
        vhdl_file.write(f'architecture dataflow of {benchmark} is\n')
    vhdl_file.write('signal ' + ', '.join(internal_signals) + ': std_logic;\nbegin\n')
    
    dff_count = 1
    for signal in dff_outputs:
        gate_output, gate_type = netlist.node[signal]['name'], netlist.node[signal]['type'].lower()
        gate_inputs = [netlist.node[gate_input]['name'] for gate_input in netlist.predecessors(signal)]
        vhdl_file.write(f"\tg{dff_count} : dff port map( q => {gate_output}, d => {gate_inputs[0]}, clk => {clock_pin}, rst => {reset_pin});\n")
        dff_count += 1

    internal_signals = list(set(internal_signals+primary_outputs).difference(set(dff_outputs)))
    gate_precursor = '('
    if dff_outputs:
        vhdl_file.write(
            'P: process(all)\n'
            'begin\n'
        )
    for signal in sorted(internal_signals):
        gate_output, gate_type = netlist.node[signal]['name'], netlist.node[signal]['type'].lower()
        gate_inputs = [netlist.node[gate_input]['name'] for gate_input in netlist.predecessors(signal)]
        
        # Change nand and nor to not and and not or
        if gate_type == 'nand':
            gate_precursor = 'not('
            gate_type = 'and'
        elif gate_type == 'nor':
            gate_precursor = 'not('
            gate_type = 'or'
        
        # If same signal is connected twice to a non-single input gate, add the connection again
        if gate_type.upper() not in single_ip_gates and len(gate_inputs) < 2:
            gate_inputs.append(gate_inputs[0])
        gate_type = '' if gate_type=='buff' else gate_type
        if gate_type.upper() in single_ip_gates:
            vhdl_file.write(f"\t{gate_output} <= {gate_precursor}{gate_type} {gate_inputs[0]});\n")
        else:
            vhdl_file.write(f"\t{gate_output} <= {gate_precursor}{f' {gate_type} '.join(gate_inputs)});\n")
    if dff_outputs:
        vhdl_file.write(
            'end process;\n'
            'end mixed;\n'
        )
    else:
        vhdl_file.write('end dataflow;\n')
    
    # Write dff module
    if dff_outputs:
        vhdl_file.write(
            '\nlibrary ieee;\nuse IEEE.STD_LOGIC_1164.all;\n'
            'use IEEE.std_logic_unsigned.all;\n\n'
            '-- DFF module\nentity dff is port(q: out std_logic; d, clk,rst: in std_logic);\nend entity dff;\n\n'
            'architecture behav of dff is begin\n\nprocess (clk) is begin\n  if rising_edge(clk) then\n'
            '    if (rst=\'1\') then \n      q <= \'0\';\n    else \n      q <= d;\n    end if;\n'
            '  end if;\nend process;\nend behav;\n'
        )
    
    vhdl_file.close()

    return True

