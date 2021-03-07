# Tested on Python 3.7.3
# ******************************************************
# Created by    : Yasaswy Kasarabada, 6th October 2017
# Edited        : Yasaswy Kasarabada, 22nd July 2019
# Description   : Find Cones of Influence
# Functions     : input_coi
#                 output_coi
#                 all_pipo_in_coi
#                 skew
#                 skew2(slow)
#                 metrics
#                 reset_and_clock
#                 benchmark_data
# ******************************************************

import networkx as nx

import read
import write


# Function to find the input cone of influence of given signals
def input_coi(signal_list, netlist):
    """
    Function to find input cone of influence of particular signals in a netlist

    Arguments:
        signal_list {list of strings} -- Signals whose input cones of influence info needs to be found
        netlist {networkx graph} -- Each node is an internal signal or primary output. Predecessors are signals driving the node signal.

    Returns:
        cone_of_influence [dictionary of dictionaries] -- Returns a dictionary with signals of signal_list as keys.
            Each value is a dictionary with three keys - 'PI', 'IS', 'TFI'
            ['PI'] (list of strings) all primary inputs in the input cone of influence
            ['IS'] (list of strings) all internal signals in the input cone of influence
            ['TFI'] (list of strings) all lines of netlist present in the input cone of influence
    """

    # Global variables
    cone_of_influence = {}
    fan_in_inputs = {}
    input_coi_signals = {}
    input_cone_of_influence = {}
    inputs = [signal for signal in netlist.nodes() if netlist.node[signal]['type']=='INPUT']
    outputs = [signal[:-4] for signal in netlist.nodes() if netlist.node[signal]['type']=='INPUT']

    # Recursive function to perform DFT
    def find_coi(sig, primary_sig):
        fan_in_signals = sorted(list(netlist.predecessors(sig)))
        line = sig + " = " + netlist.node[sig]['type'] + "(" + ", ".join([netlist.node[fan_in]['name'] for fan_in in fan_in_signals]) + ")"
        input_cone_of_influence[primary_sig].append(line)
        for net in sorted(fan_in_signals):
            if net in inputs:
                fan_in_inputs[primary_sig].append(net)
            else:
                if net in input_coi_signals[primary_sig] or net in outputs:
                    continue
                input_coi_signals[primary_sig].append(net)
                if net in cone_of_influence:
                    fan_in_inputs[primary_sig] += cone_of_influence[net]['PI']
                    input_coi_signals[primary_sig] += cone_of_influence[net]['IS']
                    input_cone_of_influence[primary_sig] += cone_of_influence[net]['TFI']
                else:
                    find_coi(net, primary_sig)

    # Find TFI data for all signals in signal list
    for signal_name in signal_list:
        # Set variables for TFI data
        fan_in_inputs = fan_in_inputs.fromkeys(signal_list, [])
        input_coi_signals = input_coi_signals.fromkeys(signal_list, [])
        input_cone_of_influence = input_cone_of_influence.fromkeys(signal_list, [])

        # Call recursive function to perform DFS to find COI of particular signal
        find_coi(signal_name, signal_name)
        fan_in_inputs[signal_name] = sorted(list(set(fan_in_inputs[signal_name])))
        input_coi_signals[signal_name] = sorted(list(set(input_coi_signals[signal_name])))
        cone_of_influence[signal_name] = {
            'PI': fan_in_inputs[signal_name],
            'IS': input_coi_signals[signal_name],
            'TFI': input_cone_of_influence[signal_name]
        }

    return cone_of_influence


# Function to find the output cone of influence of given signals
def output_coi(signal_list, netlist):
    """
    Function to find output cone of influence of particular signals in a netlist[summary]

    Arguments:
        signal_list {list of strings} -- Signals whose input cones of influence info needs to be found
        netlist {networkx graph} -- Each node is an internal signal or primary output. Predecessors are signals driving the node signal.

    Returns:
        cone_of_influence [dictionary of dictionaries] -- Returns a dictionary with signals of signal_list as keys.
            Each value is a dictionary with three keys - 'PI', 'IS', 'TFI'
            ['PO'] (list of strings) all primary outputs in the output cone of influence
            ['IS'] (list of strings) all internal signals in the output cone of influence
            ['TFO'] (list of strings) all lines of netlist present in the output cone of influence
    """

    # Global variables
    cone_of_influence = {}
    fan_out_outputs = {}
    output_coi_signals = {}
    output_cone_of_influence = {}
    inputs = [signal for signal in netlist.nodes if netlist.node[signal]['type']=='INPUT']
    outputs = [signal[:-4] for signal in netlist.nodes if netlist.node[signal]['type']=='OUTPUT']

    # Recursive function to perform DFT
    def find_coi(sig, primary_sig):
        fan_out_signals = sorted(list(netlist.successors(sig)))
        for net in sorted(fan_out_signals):
            if net.endswith('_OUT') and net[:-4] in outputs and net[:-4] in fan_out_outputs[primary_sig]:
                continue
            if net in inputs+output_coi_signals[primary_sig]+fan_out_outputs[primary_sig]:
                continue
            if net in outputs:
                fan_out_outputs[primary_sig].append(net)
            else:
                output_coi_signals[primary_sig].append(net)
            if net in cone_of_influence:
                fan_out_outputs[primary_sig] += cone_of_influence[net]['PO']
                output_coi_signals[primary_sig] += cone_of_influence[net]['IS']
                output_cone_of_influence[primary_sig] += cone_of_influence[net]['TFO']
            else:
                line = f"{net} = {netlist.nodes[net]['type']}({', '.join([netlist.nodes[fan_in]['name'] for fan_in in netlist.predecessors(net)])})"
                output_cone_of_influence[primary_sig].append(line)
                find_coi(net, primary_sig)

    # Find TFO data for all signals in signal list
    for signal_name in signal_list:
        # Set variables for TFO data
        fan_out_outputs = fan_out_outputs.fromkeys(signal_list, [])
        output_coi_signals = output_coi_signals.fromkeys(signal_list, [])
        output_cone_of_influence = output_cone_of_influence.fromkeys(signal_list, [])

        # Call recursive function to perform DFT to find COI of particular signal
        find_coi(signal_name, signal_name)
        fan_out_outputs[signal_name] = sorted(list(set(fan_out_outputs[signal_name])))
        output_coi_signals[signal_name] = sorted(list(set(output_coi_signals[signal_name])))
        cone_of_influence[signal_name] = {
            'PO': fan_out_outputs[signal_name],
            'IS': output_coi_signals[signal_name],
            'TFO': output_cone_of_influence[signal_name]
        }

    return cone_of_influence


# Function to find all PI and PO in COI of each signal
def all_pipo_in_coi(netlist):
    """
    Function to find all PI and PO in cone of influence(COI) of every signal in a netlist

    Arguments:
        netlist {networkx graph} -- Graph of the design obtained from read functions

    Returns:
        coi_primary_outputs [dictionary] -- Each signal in the netlist (except input and output) is a key.
                                            Each value is a list of all POs in the output COI of the corresponding signal
        coi_primary_inputs [dictionary] --  Each signal in the netlist (except input and output) is a key
                                            Each value is a list of all PIs in the input COI of the corresponding signal
    """

    # Global variables
    primary_inputs = [signal for signal in netlist.nodes() if netlist.node[signal]['type']=='INPUT']
    primary_outputs = [signal[:-4] for signal in netlist.nodes() if netlist.node[signal]['type']=='OUTPUT']
    coi_primary_inputs = dict((primary_input, [primary_input]) for primary_input in primary_inputs)
    coi_primary_outputs = dict((primary_output, [primary_output]) for primary_output in primary_outputs)

    # Propagate primary inputs to all affected gates
    def propagate_pi(gate_ip):
        for gate_op in netlist.successors(gate_ip):
            if all(net in coi_primary_inputs for net in netlist.predecessors(gate_op)) and gate_op not in coi_primary_inputs:
                pi_list = []
                for net in netlist.predecessors(gate_op):
                    pi_list += coi_primary_inputs[net]
                coi_primary_inputs[gate_op] = list(set(pi_list))
                if gate_op in primary_outputs and len(netlist.successors(gate_op))==1:
                    continue
                propagate_pi(gate_op)

    # Propagate primary outputs to all affected gates
    def propagate_po(gate_op):
        for gate_ip in netlist.predecessors(gate_op):
            if all(net in coi_primary_outputs for net in netlist.successors(gate_ip)) and gate_ip not in coi_primary_outputs:
                po_list = []
                for net in netlist.successors(gate_ip):
                    po_list += coi_primary_outputs[net]
                coi_primary_outputs[gate_ip] = list(set(po_list))
                if gate_ip in primary_inputs:
                    continue
                propagate_po(gate_ip)

    # Calculate cone of influence of all signals
    for primary_input in primary_inputs:
        propagate_pi(primary_input)
    for primary_output in primary_outputs:
        propagate_po(primary_output)

    # Remove primary inputs and outputs from coi dictionaries
    coi_primary_inputs = dict((signal, coi_primary_inputs[signal]) for signal in coi_primary_inputs
                              if signal not in primary_inputs + primary_outputs)
    coi_primary_outputs = dict((signal, coi_primary_outputs[signal]) for signal in coi_primary_outputs
                               if signal not in primary_inputs + primary_outputs)

    # Return two dictionaries with all PO and PI in cone of influence of each signal respectively
    # Key in each dictionary is an internal signal, value is a list of corresponding PO/PI in cone of influence of key
    return coi_primary_inputs, coi_primary_outputs


# Function to find skew values of all nets in the netlist
def skew(netlist, skew_file_path):
    """
    Function to extract inputs, outputs, internal signals and gate types to find probability skew of all signals in the circuit.

    Arguments:
        netlist {networkx graph} : Graph generated by reading design using the read functions
        skew_file_path {string} : Path to file where the skew values are written. CSV file is preferable.

    Returns:
        None
    """

    # Function to calculate skew of output of a gate
    def calculate_gate_skew(gate_type, gate_input_skew_list):
        """
        Function that returns probability skew of a single gate output w.r.t skew of gate inputs based on the gate type.
        Supported gate types - AND, NAND, OR, NOR, NOT, BUFFER, DFF, 2-input XOR, 2-input XNOR, 2-input MUX
        :param gate_type: (string) highlights type of gate
        :param gate_input_skew_list: (list of numbers) probability skew values corresponding to each gate input
        :return: output_skew: (number) probability skew value of gate output
        """

        output_skew = 1
        gate_type = gate_type.strip()
        single_ip = True if len(gate_input_skew_list) < 2 else False
        if gate_type == "AND":
            if single_ip:
                return gate_input_skew_list[0]
            for signal_skew in gate_input_skew_list:
                output_skew *= (0.5 + signal_skew)
            output_skew -= 0.5
        elif gate_type == "NAND":
            if single_ip:
                return -1 * gate_input_skew_list[0]
            for signal_skew in gate_input_skew_list:
                output_skew *= (0.5 + signal_skew)
            output_skew = 0.5 - output_skew
        elif gate_type == "OR":
            if single_ip:
                return gate_input_skew_list[0]
            for signal_skew in gate_input_skew_list:
                output_skew *= (0.5 - signal_skew)
            output_skew = 0.5 - output_skew
        elif gate_type == "NOR":
            if single_ip:
                return -1 * gate_input_skew_list[0]
            for signal_skew in gate_input_skew_list:
                output_skew *= (0.5 - signal_skew)
            output_skew -= 0.5
        elif gate_type == "XOR":
            if single_ip:
                return -0.5
            output_skew = -2 * gate_input_skew_list[0] * gate_input_skew_list[1]
        elif gate_type == "XNOR":
            if single_ip:
                return 0.5
            output_skew = 2 * gate_input_skew_list[0] * gate_input_skew_list[1]
        elif gate_type == "MUX":
            if single_ip:
                return gate_input_skew_list[0]
            output_skew = (gate_input_skew_list[0] * (gate_input_skew_list[2] - gate_input_skew_list[1])) + ((gate_input_skew_list[1] + gate_input_skew_list[2]) / 2)
        elif gate_type == "NOT":
            output_skew = -1 * gate_input_skew_list[0]
        elif gate_type == "BUFF" or gate_type == "BUF" or gate_type == "DFF" or gate_type == "OUTPUT":
            output_skew = gate_input_skew_list[0]
        else:
            print("Error : gate_type is " + gate_type)
            output_skew = 0
        return output_skew

    # Read netlist file if needed
    if isinstance(netlist, str):
        assert '.' in netlist, f"Design file extension must be provided"
        file_type = netlist[netlist.rfind('.')+1:].strip()
        if file_type=='bench':
            netlist = read.bench(netlist)
        elif file_type=='verilog':
            netlist = read.verilog(netlist)
        else:
            raise ValueError(f"Skew calculation of design type {file_type} is not supported")

    # Topologically sort the netlist
    try:
        sorted_nodes = list(nx.topological_sort(netlist))
    except (nx.NetworkXError, nx.NetworkXUnfeasible):
        raise ValueError("Netlist must be a DAG")

    # Find inputs, outputs and store file in list
    inputs = [signal for signal in netlist.nodes if netlist.node[signal]['type']=='INPUT']
    probability_skew = {}
    probability_skew = probability_skew.fromkeys(inputs, 0)

    # Find probability skew of all nodes in the netlist
    for signal in sorted_nodes:
        if signal in probability_skew:
            continue
        fanin = list(netlist.predecessors(signal))
        assert all(net in probability_skew for net in fanin), f"Skew of some of the fan-in signals of {signal} has not been calculated"
        input_skew_list = [probability_skew[net] for net in fanin]
        probability_skew[signal] = calculate_gate_skew(netlist.node[signal]['type'], input_skew_list)
    assert all(signal in probability_skew for signal in sorted_nodes)

    # Write probability values to skew file
    if skew_file_path:
        with open(skew_file_path, 'w') as skew_file:
            skew_file.write("net,Prob0,Prob1\n")
            for signal in sorted(probability_skew.keys()):
                if netlist.node[signal]['type'] == 'OUTPUT':
                    continue
                p0, p1 = 0.5 - probability_skew[signal], probability_skew[signal] + 0.5
                skew_file.write(signal + "," + str(p0) + "," + str(p1) + "\n")

    return probability_skew


# Function to find skew values of all nets in the netlist
def skew2(netlist, skew_file_path):
    """
    (Slow) Function to extract inputs, outputs, internal signals and gate types to find probability skew of all signals in the circuit.

    Arguments:
        netlist {networkx graph} : Graph generated by reading design using the read functions
        skew_file_path {string} : Path to file where the skew values are written. CSV file is preferable.

    Returns:
        None
    """

    # Function to calculate skew of output of a gate
    def calculate_gate_skew(gate_type, gate_input_skew_list):
        """
        Function that returns probability skew of a single gate output w.r.t skew of gate inputs based on the gate type.
        Supported gate types - AND, NAND, OR, NOR, NOT, BUFFER, DFF, 2-input XOR, 2-input XNOR, 2-input MUX
        :param gate_type: (string) highlights type of gate
        :param gate_input_skew_list: (list of numbers) probability skew values corresponding to each gate input
        :return: output_skew: (number) probability skew value of gate output
        """

        output_skew = 1
        gate_type = gate_type.strip()
        single_ip = True if len(gate_input_skew_list) < 2 else False
        if gate_type == "AND":
            if single_ip:
                return gate_input_skew_list[0]
            for signal_skew in gate_input_skew_list:
                output_skew *= (0.5 + signal_skew)
            output_skew -= 0.5
        elif gate_type == "NAND":
            if single_ip:
                return -1 * gate_input_skew_list[0]
            for signal_skew in gate_input_skew_list:
                output_skew *= (0.5 + signal_skew)
            output_skew = 0.5 - output_skew
        elif gate_type == "OR":
            if single_ip:
                return gate_input_skew_list[0]
            for signal_skew in gate_input_skew_list:
                output_skew *= (0.5 - signal_skew)
            output_skew = 0.5 - output_skew
        elif gate_type == "NOR":
            if single_ip:
                return -1 * gate_input_skew_list[0]
            for signal_skew in gate_input_skew_list:
                output_skew *= (0.5 - signal_skew)
            output_skew -= 0.5
        elif gate_type == "XOR":
            if single_ip:
                return -0.5
            output_skew = -2 * gate_input_skew_list[0] * gate_input_skew_list[1]
        elif gate_type == "XNOR":
            if single_ip:
                return 0.5
            output_skew = 2 * gate_input_skew_list[0] * gate_input_skew_list[1]
        elif gate_type == "MUX":
            if single_ip:
                return gate_input_skew_list[0]
            output_skew = (gate_input_skew_list[0] * (gate_input_skew_list[2] - gate_input_skew_list[1])) + ((gate_input_skew_list[1] + gate_input_skew_list[2]) / 2)
        elif gate_type == "NOT":
            output_skew = -1 * gate_input_skew_list[0]
        elif gate_type == "BUFF" or gate_type == "BUF" or gate_type == "DFF" or gate_type == "OUTPUT":
            output_skew = gate_input_skew_list[0]
        else:
            print("Error : gate_type is " + gate_type)
            output_skew = 0
        return output_skew

    # Find inputs, outputs and store file in list
    inputs = [signal for signal,sigattr in netlist.node.items() if sigattr['type']=='INPUT']
    probability_skew = {}
    probability_skew = probability_skew.fromkeys(inputs, 0)

    # Recursive function that propagates skew forward from given signal
    def propagate_skew(input_signal):
        for output in netlist.successors(input_signal):
            if all(net in probability_skew for net in netlist.predecessors(output)) and output not in probability_skew:
                input_skew_list = [probability_skew[net] for net in netlist.predecessors(output)]
                probability_skew[output] = calculate_gate_skew(netlist.node[output]['type'], input_skew_list)
                if list(netlist.successors(output)):
                    propagate_skew(output)

    # Calculate skew of all signals starting with primary inputs
    for primary_input in inputs:
        if list(netlist.successors(primary_input)):
            propagate_skew(primary_input)

    # Write probability values to skew file
    skew_file = open(skew_file_path, 'w')
    skew_file.write("net,Prob0,Prob1\n")
    for signal in sorted(probability_skew.keys()):
        if netlist.nodes[signal]['type'] == 'OUTPUT':
            continue
        p0, p1 = 0.5 - probability_skew[signal], probability_skew[signal] + 0.5
        skew_file.write(signal + "," + str(p0) + "," + str(p1) + "\n")
    skew_file.close()


# Find all metrics from circuit
def metrics(circuit):
    """
    Return the primary inputs, primary outputs and dff outputs of the design

    Arguments:
        circuit {networkx graph} -- Design as a networkx graph (returned by the read functions)

    Returns:
        primary_inputs [list of strings] -- List of primary inputs of the design
        primary_outputs [list of strings] -- List of primary outputs of the design
        dff_outputs  [list of strings] -- List of dff outputs of the design
    """

    assert all('type' in circuit.node[signal] for signal in circuit.nodes)
    primary_inputs = [signal for signal,sigattr in circuit.node.items() if sigattr['type']=='INPUT']
    primary_outputs = [signal[:-4] for signal,sigattr in circuit.node.items() if sigattr['type']=='OUTPUT']
    dff_outputs = [signal for signal,sigattr in circuit.node.items() if sigattr['type']=='DFF']
    return primary_inputs, primary_outputs, dff_outputs


# Find reset pin and clock pin
def reset_and_clock(primary_inputs):
    """
    Finds the reset and clock pins of the design.

    Arguments:
        primary_inputs {list of strings} -- A list of all primary inputs of the circuit

    Raises:
        ValueError: If no reset pin is found

    Returns:
        reset_pin [string] -- Reset pin of the design
        clock_pin [string] -- Clock pin of the design
    """
    if 'CK' not in primary_inputs:
        clock_pin = 'CK'
    elif 'CLK' not in primary_inputs:
        clock_pin = 'CLK'
    elif 'CLOCK' not in primary_inputs:
        clock_pin = 'CLOCK'
    else:
        assert 'NEWCLOCK' not in primary_inputs, f"No suitable clock pin found"
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
        raise ValueError("No reset pin found in primary inputs")

    return reset_pin, clock_pin


# Function to find benchmark data
def benchmark_data(benchmark_file_path, format='bench'):
    """
    Function to find benchmark data

    Arguments:
        benchmark_file_path {string} -- Path to the benchmark design file

    Keyword Arguments:
        format {string} -- The format of the design file (default: {'bench'})

    Raises:
        ValueError: If format is unknown

    Returns:
        metrics [dictionary] -- Returns the metrics of the benchmark (in,out,dff,and,or,etc.)
    """

    # Read design from file
    if format == 'bench':
        circuit = read.bench(benchmark_file_path)
    elif format == 'verilog':
        circuit = read.verilog(benchmark_file_path)
    elif format == 'vhdl' or format == 'vhd':
        circuit = read.vhdl(benchmark_file_path)
    elif format == 'smv':
        circuit = read.smv(benchmark_file_path)
    else:
        raise ValueError(f"Unknown format {format}")

    # Find and return metrics
    metrics = {}
    metrics['input'] = len([signal for signal,sigattr in circuit.node.items() if sigattr['type']=='INPUT'])
    metrics['output'] = len([signal for signal,sigattr in circuit.node.items() if sigattr['type']=='OUTPUT'])
    metrics['dff'] = len([signal for signal,sigattr in circuit.node.items() if sigattr['type']=='DFF'])
    metrics['mux'] = len([signal for signal,sigattr in circuit.node.items() if sigattr['type']=='MUX'])
    metrics['and'] = len([signal for signal,sigattr in circuit.node.items() if sigattr['type']=='AND'])
    metrics['nand'] = len([signal for signal,sigattr in circuit.node.items() if sigattr['type']=='NAND'])
    metrics['or'] = len([signal for signal,sigattr in circuit.node.items() if sigattr['type']=='OR'])
    metrics['nor'] = len([signal for signal,sigattr in circuit.node.items() if sigattr['type']=='NOR'])
    metrics['xor'] = len([signal for signal,sigattr in circuit.node.items() if sigattr['type']=='XOR'])
    metrics['xnor'] = len([signal for signal,sigattr in circuit.node.items() if sigattr['type']=='XNOR'])
    metrics['not'] = len([signal for signal,sigattr in circuit.node.items() if sigattr['type']=='NOT'])
    metrics['buff'] = len([signal for signal,sigattr in circuit.node.items() if sigattr['type']=='BUFF' or sigattr['type']=='BUF'])
    return metrics


# Function to find signals with fan-out outside TFI of signal in signal list
def ignore_signals(signal_list, netlist, internal_signals):
    """
    Function to find signals with fan-out outside TFI of signals in signal_list
    :param signal_list: (list of strings) List of signals whose TFI is known
    :param inputs: (list of strings) List of primary inputs
    :param netlist : (graph) Each node is an internal signal or primary output. Predecessors are signals driving the node signal.
    :param internal_signals: (dictionary of strings) Each key is a signal from signal_list.
                              Value is the set of internal signals in the TFI of key signal.
    :return: ignore_signals: (dictionary of lists) Each key is a signal from signal list.
                              Value is a list of signals with fan-out outside TFI of signals in signal list.
    """

    inputs = [signal for signal in netlist.nodes() if netlist.node[signal]['type']=='INPUT']

    # Recursive function to remove dont touch signals whose tfo holds other fan-out signals
    def remove_from_dont_touch(sig, primary_sig):
        for net in list(netlist.predecessors[sig]):
            if net not in inputs:
                if net in dont_touch_signals:
                    dont_touch_signals.remove(net)
                remove_from_dont_touch(net, primary_sig)

    # Declare ignore signals dictionary
    ignore_signals = {}
    # ignore_signals = ignore_signals.fromkeys(signal_list, [])

    # Find all internal signals
    internal_signals_all = set([signal for internal_signal_list in internal_signals.values() for signal in internal_signal_list] + signal_list)

    # Determine don't touch signals from all cones
    for signal_name in signal_list:

        # Set don't touch variables
        dont_touch_signals = []

        # Find signals with fan-out outside coi
        for signal in internal_signals[signal_name]:
            if any(net not in internal_signals_all for net in netlist.successors[signal]):
                dont_touch_signals.append(signal)

        for signal in dont_touch_signals:
            remove_from_dont_touch(signal, signal_name)
        dont_touch_signals = sorted(list(set(dont_touch_signals)))

        # Return list of fan-in inputs, all internal signals in input cone of influence and input cone of influence
        ignore_signals[signal_name] = dont_touch_signals

    return ignore_signals
