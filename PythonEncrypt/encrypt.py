#!/usr/bin/env python3

"""
Python script to encrypt verilog designs.

Valid encryption codes:
    SR -- SARLock
    NR -- Anti-SAT
    TR -- TTLock
    FR -- SFLL-HD(2)
    CR -- Cyclic
    RC -- SRCLock
"""

# Package imports 
import re
import os
import sys
import itertools
import networkx as nx
import random
import shutil
import pdb

import find
import read
import write

# Set to true if testing mode needs to be activated
Testing = False

def cyclic(design_file_path, enc_type, key_size, encrypted_file_path):
    """Function to perform cyclic encryption.
    
    Arguments:
        design_file_path {string} -- Path to unencrypted verilog file
        enc_type {string} -- Encryption code (CR/RC)
        key_size {int} -- Key size
        encrypted_file_path {string} -- Path to encrypted verilog file
    
    Raises:
        ValueError: If invalid encryption code is given
        SystemExit: If unencrypted circuit is not a DAG (loop-free combinational design)
    
    Returns:
        bool -- True if encryption was successful; False if encryption was unsuccessful
    """

    
    def find_path(Circuit, primary_inputs, primary_outputs, source, length, invalid_gates, Relaxed):
        """Function to find path of certain length from source node
        
        Arguments:
            Circuit {networkx.DiGraph} -- Circuit represented as a DAG
            primary_inputs {list(strings)} -- List of primary inputs of the design
            primary_outputs {list(strings)} -- List of primary outputs of the design
            source {string} -- Source node from which path needs to be found
            length {int} -- Length of path to be found
            invalid_gates {list(strings)} -- List of nets that should not be in the returned path
            Relaxed {bool} -- False -> path should not have invalid gates; True -> path can have a few invalid gates
        
        Returns:
            networkx.DiGraph -- Path starting at <source> node containing <length> nodes
        """
        path = nx.DiGraph()
        current_node = source
        path.add_node(source)
        invalid_nodes = {source: set()}
        primary_signals = primary_inputs.union(primary_outputs)
        # print(f'finding path for {source}', flush=True)
        while len(path.nodes()) < length:
            fan_out = set(Circuit.successors(current_node)).difference(invalid_nodes[current_node]).difference(primary_signals)
            if not Relaxed:
                fan_out = fan_out.difference(invalid_gates)
            if fan_out:
                added_node = random.choice(list(fan_out))
                path.add_node(added_node)
                path.add_edge(current_node, added_node)
                current_node = added_node
                invalid_nodes[added_node] = set()
            else:
                if current_node ==  source:
                    path.remove_node(source)
                    break
                removal_node = current_node
                current_node = list(path.predecessors(removal_node))[0]
                path.remove_node(removal_node)
                del invalid_nodes[removal_node]
                invalid_nodes[current_node].add(removal_node)
        # print(path.nodes())
        return path

    if enc_type not in ['CR', 'RC']:
        raise ValueError(f"Invalid enctype {enc_type}")
    
    print(f'Encrypting circuit with {key_size} keys ', end='', flush=True)

    # Global variables
    DefaultLoopLength = 8
    primary_inputs, primary_outputs = set(), set()
    Relaxed = False
    
    LoopLength = DefaultLoopLength
    # Find keys to be used for SRCLock
    if enc_type == 'RC':
        new_key_size = int(0.8 * key_size)
        RC_keys = key_size - new_key_size
        key_size = new_key_size
    
    # Read the circuit
    OriginalCircuit = read.verilog(design_file_path)
    primary_inputs = {sigattr['name'] for signal, sigattr in OriginalCircuit.node.items() if sigattr['type']=='INPUT'}
    primary_outputs = {sigattr['name'] for signal, sigattr in OriginalCircuit.node.items() if sigattr['type']=='OUTPUT'}
    
    # Topological sort gates in circuit
    try:
        sorted_gates = nx.topological_sort(OriginalCircuit)
    except (nx.NetworkXError , nx.NetworkXUnfeasible) as err:
        raise SystemExit(f"Circuit must be a DAG.\nNetworkx returned error {err}")
    sorted_gates = [gate for gate in sorted_gates if OriginalCircuit.node[gate]['name'] not in primary_inputs.union(primary_outputs)]
    print('.', end='', flush=True)

    # Find suitable locations for gates
    gate_outputs = []
    correct_inputs, wrong_inputs = {}, {}
    sgr_gates, sgr_correct_outputs = [], {}
    special_gates = []
    multiple_tries = 0
    r_gates = []
    while len(gate_outputs) < key_size:

        # Find looplength
        if key_size - len(gate_outputs) < LoopLength:
            loop_length = key_size - len(gate_outputs)
        else:
            loop_length = LoopLength
        
        # Find paths
        tries = 0
        while True:
            u_gate = random.choice(sorted_gates)
            if u_gate not in gate_outputs:
                tries += 1
                path = find_path(OriginalCircuit, primary_inputs, primary_outputs, u_gate, loop_length, gate_outputs, Relaxed)
                if path.nodes():
                    break
                if tries == 100:
                    break
        
        # If bad locations have been found
        if tries == 100:
            if multiple_tries == 3:
                LoopLength = int(LoopLength/2)
                print('|', end='', flush=True)
            elif multiple_tries == 7:
                Relaxed = True
                print('|', end='', flush=True)
            elif multiple_tries == 10:
                print(' Incomplete', flush=True)
                return False
            gate_outputs = []
            correct_inputs, wrong_inputs = {}, {}
            sgr_gates, sgr_correct_outputs = [], {}
            multiple_tries += 1
            continue
        
        # Get gates in path
        gates_in_path = list(nx.topological_sort(path))
        assert gates_in_path[0]==u_gate, f'Path does not begin with u'
        gate_outputs += gates_in_path

        # Get random gates as wrong inputs for MUXes
        r_gates += list(random.choices([gate for gate in sorted_gates if gate not in gates_in_path], k=(loop_length-1)))

    # pdb.set_trace()
    r_gate_itr = 0
    sgr_gate_count = 0
    itr = 0
    for gate_output in gate_outputs:
        
        # Set correct input and wrong inputs
        if itr % LoopLength == 0:
            correct_inputs[gate_output] = random.choice(list(OriginalCircuit.predecessors(gate_output)))
            if itr + LoopLength > key_size:
                last_gate = key_size - 1
            else:
                last_gate = itr + LoopLength - 1
            wrong_inputs[gate_output] = gate_outputs[last_gate]
        else:
            correct_inputs[gate_output] = gate_outputs[itr-1]
            wrong_inputs[gate_output] = r_gates[r_gate_itr]
            r_gate_itr += 1
        itr += 1

        # For last gate in loop
        if itr % LoopLength == 0 or itr == key_size:
            continue

        # Get gates with only one fanout
        if len(list(OriginalCircuit.successors(gate_output))) == 1:
            r_gate = random.choice([gate for gate in sorted_gates if gate not in gate_outputs+sgr_gates])
            special_gates.append(gate_output)
            sgr_gates.append(r_gate)
            sgr_correct_outputs[r_gate] = random.choice(list(OriginalCircuit.predecessors(r_gate)))
            sgr_gate_count += 1
    print('.', end='', flush=True)

    # Generate mux logic
    keyvalue = format(random.getrandbits(key_size), f'0{key_size}b')
    keyinputs = [f'keyinput{itr}' for itr in range(key_size)]
    mux_outputs = [f'muxed_{itr}' for itr in range(key_size)]
    mux2_outputs = [f'muxed2_{itr}' for itr in range(sgr_gate_count)]
    # print(len(mux2_outputs))
    assign_text = []
    sg_index = 0
    edges_to_be_removed = set()
    mux_index = 0
    for gate_output in gate_outputs:
        
        # Remove original connection
        if not OriginalCircuit.has_edge(correct_inputs[gate_output], gate_output):
            fanin = OriginalCircuit.predecessors(gate_output)
            mux_ins = 0
            for sig in fanin:
                if OriginalCircuit.node[sig]['name'].startswith('muxed_'):
                    correct_inputs[gate_output] = sig
                    mux_ins += 1
            assert mux_ins==1
        OriginalCircuit.remove_edge(correct_inputs[gate_output], gate_output)            
        
        # Add new connection from/to mux output
        mux_output = mux_outputs[mux_index]
        OriginalCircuit.add_node(mux_output, name=mux_output, type='REMOVE')
        OriginalCircuit.add_edge(correct_inputs[gate_output], mux_output)
        OriginalCircuit.add_edge(mux_output, gate_output)

        # Add key gate to circuit
        keyinput = keyinputs[mux_index]
        OriginalCircuit.add_node(keyinput, name=keyinput, type='INPUT')
        OriginalCircuit.add_edge(keyinput, mux_output)

        # Add assign logic
        if keyvalue[mux_index] == '1':
            one_input, zero_input = correct_inputs[gate_output], wrong_inputs[gate_output]
        else:
            one_input, zero_input = wrong_inputs[gate_output], correct_inputs[gate_output]
        assign_text.append(f'assign {mux_output} = {keyinput} ? {one_input} : {zero_input};\n')

        mux_index += 1
        # Logic for special gates
        if gate_output in special_gates:
            mux2_output = mux2_outputs[sg_index]
            r_gate = sgr_gates[sg_index]
            if not OriginalCircuit.has_edge(sgr_correct_outputs[r_gate], r_gate):
                fanin = OriginalCircuit.predecessors(r_gate)
                mux_ins = 0
                for sig in fanin:
                    if OriginalCircuit.node[sig]['name'].startswith('muxed_'):
                        sgr_correct_outputs[r_gate] = sig
                        mux_ins += 1
                assert mux_ins==1
            OriginalCircuit.remove_edge(sgr_correct_outputs[r_gate], r_gate)

            # Add mux2 to circuit
            if mux_index >= len(keyinputs):
                print(gate_outputs)
                print(gate_output)
                print(special_gates)
            keyinput = keyinputs[mux_index]
            OriginalCircuit.add_node(mux2_output, name=mux2_output, type='REMOVE')
            OriginalCircuit.add_edge(mux2_output, r_gate)
            OriginalCircuit.add_edge(sgr_correct_outputs[r_gate], mux2_output)
            OriginalCircuit.add_edge(keyinput, mux2_output)

            # Put correct value in assign logic
            if keyvalue[mux_index] == '1':
                one_input, zero_input = sgr_correct_outputs[r_gate], gate_output
            else:
                one_input, zero_input = gate_output, sgr_correct_outputs[r_gate]
            assign_text.append(f'assign {mux2_output} = {keyinput} ? {one_input} : {zero_input};\n')
            
            sg_index += 1
            special_gates.remove(gate_output)

    OriginalCircuit.remove_edges_from(edges_to_be_removed)
    assert sg_index==sgr_gate_count
    print('.', end='', flush=True)
    
    if True:
        # Write circuit to enc file
        write.verilog(OriginalCircuit, encrypted_file_path)
        print('. Completed', flush=True)
        with open(encrypted_file_path, 'r') as enc_file:
            encrypted_netlist = enc_file.readlines()

        # Add assign text to design file
        encrypted_circuit = [f'//key={keyvalue}\n']
        for line in encrypted_netlist:
            if 'endmodule' in line:
                encrypted_circuit += assign_text + ['\n']
            elif line.startswith('  remove'):
                continue
            else:
                pass
            encrypted_circuit.append(line)
        
        with open(encrypted_file_path, 'w') as enc_file:
            enc_file.writelines(encrypted_circuit)
    
    if enc_type=='RC':
        
        # SRCLock logic here:
        def generateSuperCycles(filename, max_keys_added = 1000, maxIter = 1000):
            """Function to connect SRCLock super cycles from an existing cyclic encrypted circuit
            
            Arguments:
                filename {string} -- Path to cyclic encrypted verilog file
            
            Keyword Arguments:
                max_keys_added {int} -- Number of keys used for super cycle creation (default: {1000})
                maxIter {int} -- Maximum number of iterations when finding cycles (default: {1000})
            
            Raises:
                Exception: If no cycles are found in the design
            """
            
            #First, edit verilog file so it can be read as a graph
            originalFile = open(filename, 'r')
            tmpFilename = filename[:filename.find(".")] + "_tmp.v"
            tmpFile = open(tmpFilename, 'w')
            def closeFile(fileToClose, outString):
                fileToClose.seek(0)
                fileToClose.write(outString)
                fileToClose.truncate()
                fileToClose.close()
            fileString = originalFile.read()
            newEdges = []
            currentPosition = 0
            keyCount = 0
            
            #Find an comment out mux lines and save them to be reconnected later
            gateLabelPos = fileString.find("(")
            gateLabel = fileString[gateLabelPos + 1 : gateLabelPos + 2]
            currentPosition = fileString.find("assign", currentPosition)
            if fileString[currentPosition - 1] != '/':
                fileString = fileString.replace("assign", "//assign")
                currentPosition = fileString.find("assign", currentPosition)
            existingMux = fileString[currentPosition:]
            while(currentPosition > -1):
                nodeNames = []
                muxedStringLoc = fileString.find("muxed", currentPosition)
                muxedString = fileString[muxedStringLoc:fileString.find(" ", muxedStringLoc)]
                nodeNames.append(muxedString)
                nodeNameLoc = fileString.find("keyinput", muxedStringLoc)
                nodeNames.append(fileString[nodeNameLoc : fileString.find(" ", nodeNameLoc)])
                keyCountStr = nodeNames[1][8:]
                keyCount = int(keyCountStr)
                nodeNameLoc = fileString.find(" ", nodeNameLoc) + 1
                nodeNameLoc = fileString.find(" ", nodeNameLoc + 1) + 1
                nodeNames.append(fileString[nodeNameLoc : fileString.find(" ", nodeNameLoc)])
                nodeNameLoc = fileString.find(" ", nodeNameLoc + 1) + 1
                nodeNameLoc = fileString.find(" ", nodeNameLoc + 1) + 1
                nodeNames.append(fileString[nodeNameLoc : fileString.find(";", nodeNameLoc)])
                #print(nodeNames)
                newEdges.append(nodeNames)
                currentPosition = fileString.find("assign", nodeNameLoc)
            #print(keyCount)
            currentPosition = fileString.find("xor")
            
            #Find and remove 3+ input XOR gates that can't be read, to be reconnected later
            while(currentPosition > -1):
                nodeNames = []
                outLoc = fileString.find("(", currentPosition)
                gateString = fileString[outLoc : fileString.find(")", outLoc) + 1]
                if(gateString.count(",") < 3):
                    currentPosition = fileString.find("xor", outLoc)
                    continue
                outNode = gateString[1 : gateString.find(",")]
                nodeNames.append(outNode)
                commaPos = 0
                for i in range(0,3):
                    commaPos = gateString.find(",", commaPos + 1)
                while (commaPos > -1):
                    gateToRemove = gateString[commaPos + 2 : gateString.find(",", commaPos + 1)]
                    nodeNames.append(gateToRemove)
                    commaPos = gateString.find(",", commaPos + 1)
                newGateString = gateString
                for nodeToRemove in nodeNames[1:]:
                    newGateString = newGateString.replace(", " + nodeToRemove, "")
                fileString = fileString.replace(gateString, newGateString)
                newEdges.append(nodeNames)
                currentPosition = fileString.find("xor", outLoc)
            tmpFile.write(fileString)
            tmpFile.close()
            originalFile.close()

            #Read in verilog file as a directed graph
            circuit_graph = read.verilog(tmpFilename)
            
            #Reconnect edges removed in previous step
            for newEdge in newEdges:
                for i in range(1, len(newEdge)):
                    circuit_graph.add_edge(newEdge[i], newEdge[0])
            for node in circuit_graph.node:
                if not 'type' in circuit_graph.node[node].keys():
                    circuit_graph.node[node].update({'type' : 'NONE', 'name' : node })
            muxes = []
            randConeSignals = []
            cycleNum = 0

            #Find cycles and connect them into supercycles
            removedEdges = []
            iters = 0
            while len(muxes) < max_keys_added and iters < maxIter:
                for i in range(0, maxIter):
                    try:
                        cycle = nx.find_cycle(circuit_graph)
                    except:
                       #print("No more cycles", '\n')
                       break
                    else:
                        #print("Cycle Found: ", cycle, '\n')
                        #Find places to place MUX gates in the cycle
                        SCresult = findSCConnections(cycle, circuit_graph)
                        newMuxSignals = SCresult[0]
                        newRandSignals = SCresult[1]
                        repeatSignals = []
                    
                        #If edge is already connected to another MUX, find a new connection
                        for muxSignal in newMuxSignals:
                            if(any(muxSignal in mux for mux in muxes) or muxSignal[0] in existingMux or muxSignal[1] in existingMux):
                                repeatSignals.append(muxSignal)
                                SCresult = findSCConnections(cycle, circuit_graph, repeatSignals)
                                newMuxSignals = SCresult[0]
                                newRandSignals = SCresult[1]
                        randrepeatSignals = []
                    
                        #If adding randomly connected signals (probably not), repeat above for those
                        for randSignal in newRandSignals:
                            if randSignal in randConeSignals:
                                repeatSignals.append(randSignal)
                                SCresult = findSCConnections(cycle, circuit_graph, repeatSignals)
                                newMuxSignals = SCresult[0]
                                newRandSignals = SCresult[1]
                                SCresult = findSCConnections(cycle, circuit_graph)
                                newMuxSignals = SCresult[0]
                                newRandSignals = SCresult[1]
                        if len(newMuxSignals) == 2:
                            muxes.append(newMuxSignals)
                        randConeSignals.extend(newRandSignals)
                        #print("Current Mux Connections: ", muxes, '\n')
                        removedEdges.append([cycle[0][0], cycle[0][1]])
                        circuit_graph.remove_edge(cycle[0][0], cycle[0][1])
                        if len(muxes) > max_keys_added:
                            break
                if len(muxes) < max_keys_added:
                    for edge in removedEdges:
                        circuit_graph.add_edge(edge[0], edge[1])
                iters += 1
            #print(randConeSignals)
            muxes = muxes[:max_keys_added]
            print(muxes) 
            if len(muxes) == 0:
                raise Exception('No cycles found')
                return
            muxLines = []
            signalsToReplace = []
            key = ""
            #print("Mux Lines:", '\n')

            #Create new MUX logic for the new verilog file
            def addMuxLines(firstIndex, secondIndex, keyBit):
                firstCorrect = muxes[secondIndex-keyBit][0+keyBit][0]
                secondCorrect = muxes[firstIndex+keyBit][1-keyBit][0]
                gateNo = i+2+keyCount
                muxLine1 = "assign muxed_" + str(gateNo) + " = keyinput" + str(gateNo) + " ? " + firstCorrect + " : " + secondCorrect + ";"
                muxLine2 = "assign muxed2_" + str(gateNo) + " = keyinput" + str(gateNo) + " ? " + secondCorrect + " : " + firstCorrect + ";"
                muxLines.append(muxLine1)
                muxLines.append(muxLine2)
                #print(muxLine1)
                #print(muxLine2)
            for i in range(-1, len(muxes) - 1):
                signalsToReplace.append(muxes[i][1])
                signalsToReplace.append(muxes[i+1][0])
                keyBit = random.randint(0,1)
                key = key + str(keyBit)
                addMuxLines(i, i+1, keyBit)
            for i in range(0, len(randConeSignals), 2):
                signalsToReplace.append(randConeSignals[i])
                signalsToReplace.append(randConeSignals[i+1])
                keyBit = random.randint(0,1)
                key = key + str(keyBit)
                firstCorrect = randConeSignals[i + 1 - keyBit][0]
                secondCorrect = randConeSignals[i + keyBit][0]
                randGateNo = keyCount + len(muxes) + 1 + int(round(i/2))
                muxLine1 = "assign muxed_" + str(randGateNo) + " = keyinput" + str(randGateNo) + " ? " + firstCorrect + " : " + secondCorrect + ";"
                muxLine2 = "assign muxed2_" + str(randGateNo) + " = keyinput" + str(randGateNo) + " ? " + secondCorrect + " : " + firstCorrect + ";"
                muxLines.append(muxLine1)
                muxLines.append(muxLine2)
            #print('\n', "Signals To Replace: ", signalsToReplace, '\n')
            print("RCkey=", key)

            #Write the new MUX logic to the verilog file
            originalFile = open(filename, 'r+')
            fileString = originalFile.read()
            fileString = fileString.replace("//assign", "assign")
            lastKeyinput = "keyinput" + str(keyCount) + ", "
            newKeyinputs = lastKeyinput
            lastMuxWire = "muxed_" + str(keyCount) + ";"
            newMuxWires = lastMuxWire[:-1] + ", "
            for i in range(0, int(len(muxLines)/2)):
                index = i + keyCount + 1
                newKeyinputs = newKeyinputs + "keyinput" + str(i + keyCount + 1) + ", "
                newMuxWires =  newMuxWires + "muxed_" + str(i + keyCount + 1) + ", "
                newMuxWires =  newMuxWires + "muxed2_" + str(i + keyCount + 1) + ", "
            fileString = fileString.replace(lastKeyinput, newKeyinputs)
            fileString = fileString.replace(lastKeyinput[:-2] + ";", newKeyinputs[:-2] + ";")
            fileString = fileString.replace(lastMuxWire, newMuxWires[:-2] + ";")
            i = 0
            for signal in signalsToReplace:
                gateLoc = fileString.find("(" + signal[1])
                gateString = fileString[gateLoc : fileString.find(")", gateLoc)]
                muxLocation = muxLines[i].find("muxed")
                newSignal = muxLines[i][muxLocation : muxLines[i].find(" ", muxLocation)]
                newgateString = gateString.replace(signal[0], newSignal)
                fileString = fileString.replace(gateString, newgateString)
                i = i + 1
            fileString = fileString.replace("endmodule", "")
            for muxLine in muxLines:
                fileString = fileString + muxLine + '\n'
            fileString = fileString + '\n' + "endmodule" + '\n'
            keyLoc = fileString.find("key=")
            keyString = fileString[keyLoc : fileString.find("\n", keyLoc)]
            fileString = fileString.replace(keyString, keyString + key)  
            closeFile(originalFile, fileString)
            os.remove(tmpFilename)
        
        def findSCConnections(cycle, circuit_graph, muxsignalsToIgnore = [], randsignalsToIgnore = [], doRandomSignals = False):
            """Function that iterates through a cycle to find suitable places to connect to other cycles
            
            Arguments:
                cycle {list} -- Cycle  (list of Networkx edges) to be connected to a supercycle
                circuit_graph {Networkx DiGraph} -- Networkx graph of the main circuit for reference
            
            Keyword Arguments:
                muxsignalsToIgnore {list} -- List of edges to be passed over while searching for connection points with other cycles (default: {[]})
                randsignalsToIgnore {list} -- List of edges to be passed over while searching for connection points with noncycle nets (if doRandomSignals is True) (default: {[]})
                doRandomSignals {bool} -- Decides whether or not to connect cycles to noncycle nets in the circuit (increases computation time) (default: {False})
            
            Returns:
                list -- Index 0: List of edges to turn into connection points to other cycles. Index 1: List of edges to connect to the current cycle.
            """
            
            #Iterates through a cycle to find suitable places to connect to other cycles for supercycles
            signalsToMux = []
            randomConeSignals = []
            for edge in cycle:
                randomIter = 0
                if (edge in signalsToMux) or (edge in muxsignalsToIgnore) or (any('muxed' in node for node in edge)):
                        continue
                elif len(signalsToMux) < 2:
                    signalsToMux.append(edge)
                elif doRandomSignals and randomIter < 1:
                    randomIter = randomIter + 1
                    randomConeSignals.append(edge)
                    #print("Finding coi")
                    inputCoi = find.input_coi([edge[0]], circuit_graph)
                    #print("Found coi")
                    randNum = random.randrange(0, len(inputCoi[edge[0]]['IS']))
                    randomInternalSignal = inputCoi[edge[0]]['IS'][randNum]
                    randomInEdge = circuit_graph.in_edges(randomInternalSignal)[0]
                    i = 0
                    maxIter = 1000
                    while (('keyinput' in randomInEdge[0]) or ('muxed' in randomInEdge[0]) or (randomInEdge in randsignalsToIgnore)) and (i < maxIter):
                        randNum = random.randrange(0, len(inputCoi[edge[0]]['IS']))
                        randomInternalSignal = inputCoi[edge[0]]['IS'][randNum]
                        randomInEdge = circuit_graph.in_edges(randomInternalSignal)[0]
                        i = i + 1
                    randomConeSignals.append(randomInEdge)
            return [signalsToMux, randomConeSignals]

        generateSuperCycles(encrypted_file_path, max_keys_added = RC_keys)

    return True

# Function to unroll string
def unroll(list_of_strings): 
    return ', '.join(list_of_strings)

def ham_dist_block(a, b, bit_length):
    """Function to build a Verilog hamming distance caluculator logic block. (only one per module allowed)

    Arguments:
        a {string} -- Name of first wire
        b {string} -- Name of second wire
        bit_length {int} -- Bit length of a and b

    Raises:
        None

    Returns:
        string -- Verilog code of the hamming distance calculator
    """
    return (
        f'  integer ham_dist, idx;\n'
        f'  wire [{bit_length-1}:0] diff;\n'
        f'  assign diff = {a} ^ {b};\n\n'
        f'  always@* begin\n'
        f'    ham_dist = 0;\n'
        f'    for(idx=0; idx<{bit_length}; idx=idx+1) ham_dist = ham_dist + diff[idx];\n'
        f'  end\n\n'
    )

def module_block(module, outputs, inputs, logic_block):
    """Function to build a Verilog module block around given logic

    Arguments:
        module {string} -- Name of module to be declared
        outputs {List[string]} -- List of output ports (these are first to be consistant with rest of codebase)
        inputs {List[string]} -- List of input ports
        logic_block {string} -- Verilog code of the logic that is contained by the module

    Raises:
        None

    Returns:
        string -- Verilog code of the module block
    """
    new_line = '\n'
    return (
        f'module {module} ({unroll(outputs)}, {unroll(inputs)});\n'
        '\n'
        f'  input {unroll(inputs)};\n'
        f'  output {unroll(outputs)};\n'
        f'{logic_block}'
        f'endmodule\n'
    )

def instantiation_block(module, instance_name, outputs, inputs):
    """Function to build a Verilog instantiation block (with implicit port mapping)

    Arguments:
        module {string} -- Name of module to be instantiated
        instance_name {string} -- Name of instance
        outputs {List[string]} -- List of output ports (these are first to be consistant with rest of codebase)
        inputs {List[string]} -- List of input ports

    Raises:
        None

    Returns:
        string -- Verilog code of the instantiation block
    """
    return (
        f'  {module} {instance_name} ({unroll(outputs)}, {unroll(inputs)});\n'
    )


def pointfunc(design_file_path, enc_type, key_size, encrypted_file_path):
    """Function to perform point-function based encryption.
    
    Arguments:
        design_file_path {string} -- Path to unencrypted verilog file
        enc_type {string} -- Encryption code (SR/NR/TR/FR)
        key_size {int} -- Key size
        encrypted_file_path {string} -- Path to encrypted verilog file
    
    Raises:
        ValueError: If invalid encryption code is given
    
    Returns:
        bool -- True if encryption was successful; False if encryption was unsuccessful
    """
    
    if enc_type not in ['SR', 'NR', 'TR', 'FR']:
        raise ValueError(f"Invalid enctype {enc_type}")
    
    print(f'Encrypting circuit with {key_size} keys ', end='', flush=True)

    # Read original circuit
    OriginalCircuit = read.verilog(design_file_path)

    # Add key inputs
    for keyinput in [f'keyinput{idx}' for idx in range(key_size)]:
        OriginalCircuit.add_node(keyinput, name=keyinput, type='INPUT')

    # Add flip signal
    h_value = 2                 # For SFLL-HD(h)
    sat_vul_key_size = 0
    sat_res_key_size = key_size
    fanin = []
    invalid_pi = set()
    primary_outputs = {sigattr['name'] for signal,sigattr in OriginalCircuit.node.items() if sigattr['type']=='OUTPUT'}
    primary_output = ''
    while True: # This loop tries to find a primary output with a really big input cone of influence (more than key bit size)
        valid_po = primary_outputs.difference(invalid_pi)
        if valid_po:
            primary_output = random.choice(list(valid_po))
        else: # If it couldn't find any POs with big enough ICOI, fanin will be any non-PO signal (almost the whole graph)
            fanin = [signal for signal in OriginalCircuit.nodes() if OriginalCircuit.node[signal]['name'] not in primary_outputs]
            break
        icoi = find.input_coi([primary_output], OriginalCircuit)[primary_output]
        fanin = [signal for signal in icoi['IS'] + icoi['PI'] if not signal.startswith('keyinput')] # fanin is all the signals in the ICOI, except for any key inputs from a previous round of logic locking
        if len(fanin)>sat_res_key_size:
            break
        invalid_pi.add(primary_output)
    po_replace, flip_signal = f'{primary_output}_in', 'flip_signal'
    OriginalCircuit.add_node(po_replace, name=po_replace, type=OriginalCircuit.node[primary_output]['type'])
    OriginalCircuit.add_edges_from(itertools.product(OriginalCircuit.predecessors(primary_output), [po_replace]))
    OriginalCircuit.remove_edges_from(itertools.product(OriginalCircuit.predecessors(primary_output), [primary_output]))
    OriginalCircuit.node[primary_output]['type'] = 'XOR'
    OriginalCircuit.add_edge(po_replace, primary_output)
    OriginalCircuit.add_node(flip_signal, name=flip_signal, type='REMOVE')
    OriginalCircuit.add_edge(flip_signal, primary_output)
    OriginalCircuit.add_edge(primary_output, flip_signal)
    if Testing:
        pdb.set_trace()

    # Write circuit to temp file
    temp_file_path = encrypted_file_path
    write.verilog(OriginalCircuit, temp_file_path)
    print('.', end='', flush=True)

    # Read temp file
    with open(temp_file_path, 'r') as temp_file:
        original_netlist = temp_file.readlines()
    os.remove(temp_file_path)
    
    # Add extra keys to design
    if enc_type=='NR':
        pi_count = int(sat_res_key_size/2)+1 if sat_res_key_size%2 else int(sat_res_key_size/2)
    else:
        pi_count = sat_res_key_size
    sat_res_inputs = random.sample(fanin, pi_count)
    assert len(sat_res_inputs)==len(set(sat_res_inputs))
    sat_res_key_value = format(random.getrandbits(sat_res_key_size), f'0{sat_res_key_size}b')
    sat_res_key_inputs = [f'keyinput{keybit}' for keybit in range(sat_vul_key_size, sat_vul_key_size+sat_res_key_size)]
    new_wires = [f'newWire{keybit}' for keybit in range(sat_res_key_size+2)]
    if Testing:
        pdb.set_trace()

    # Generate SatHard block
    new_line = '\n'
    sat_res_instance = f'  SatHard block1 ({flip_signal}, {unroll(sat_res_inputs)}, {unroll(sat_res_key_inputs)});\n'
    sat_res_comment = '/*************** SatHard block ***************/\n'
    sat_res_module = sat_res_instance.replace('block1 ', '').replace('  SatHard', 'module SatHard')
    sat_res_in = f'  input {unroll(sat_res_inputs)};\n  input {unroll(sat_res_key_inputs)};\n'
    sat_res_out = f'  output {flip_signal};\n'
    sat_res_wires = f'  wire {unroll(new_wires)};\n'
    if enc_type=='NR':
        flip_logic = f'\n  assign {flip_signal} = ( (keyinputs!=keyvalue) & (sat_res_inputs[{pi_count-1}:0]!=keyinputs[{pi_count-1}:0]) & (sat_res_inputs[{pi_count-1}:0]==keyinputs[{sat_res_key_size-1}:{pi_count}]) ) ? \'b1 : \'b0;'
    elif enc_type=='SR':
        flip_logic = f'\n  assign {flip_signal} = ( (keyinputs!=keyvalue) & (sat_res_inputs==keyinputs) ) ? \'b1 : \'b0;'
    elif enc_type=='TR':
        flip_logic = f'\n  assign {flip_signal} = ( (keyinputs!=keyvalue) & ( (sat_res_inputs==keyinputs) | (sat_res_inputs==keyvalue) ) ) ? \'b1 : \'b0;'
    elif enc_type=='FR':
        peturb_logic = (
            f"{ham_dist_block('sat_res_inputs', 'keyvalue', pi_count)}"
            f'  assign {flip_signal} = ( ham_dist<={h_value}) ) ) ? \'b1 : \'b0;'
        )
        restore_logic = (
            f"{ham_dist_block('sat_res_inputs', 'keyinputs', pi_count)}"
            f'  assign {flip_signal} = ( ham_dist<={h_value}) ) ) ? \'b1 : \'b0;'
        )
    if Testing:
        pdb.set_trace()
    
    sat_res_logic = (
        f'  //SatHard key={sat_res_key_value}\n'
        f'  wire [{pi_count-1}:0] sat_res_inputs;\n'
        f'  assign sat_res_inputs[{pi_count-1}:0] = {{{unroll(sat_res_inputs)}}};\n'
        f'  wire [{sat_res_key_size-1}:0] keyinputs, keyvalue;\n'
        f'  assign keyinputs[{sat_res_key_size-1}:0] = {{{unroll(sat_res_key_inputs)}}};\n'
        f'  assign keyvalue[{sat_res_key_size-1}:0] = {sat_res_key_size}\'b{sat_res_key_value};\n'
        f'{flip_logic}\n'
    )
    print('.', end='', flush=True)
    
    # Modify netlist by adding SatHard block
    edited_netlist = [f'//key={sat_res_key_value}\n']
    for line in original_netlist:
        stripped_line = line.strip()
        if stripped_line.startswith('remove'):
            continue
        if any(stripped_line.startswith(special_item) for special_item in ['//','`']) or not stripped_line:
            edited_netlist.append(line)
            continue
        if stripped_line.startswith('module') or stripped_line.startswith('input'):
            # edited_netlist.append(line.replace(f');', f', {unroll(sat_res_key_inputs)});'))
            edited_netlist.append(line)
        elif stripped_line.startswith('endmodule'):
            edited_netlist += [
                sat_res_instance, 
                new_line, 
                'endmodule\n',
                new_line,
                sat_res_comment,
                sat_res_module,
                new_line,
                sat_res_in,
                sat_res_out,
                sat_res_wires,
                new_line,
                sat_res_logic,
                new_line,
                'endmodule\n',
                sat_res_comment
            ]
        else:
            edited_netlist.append(line)
    print('.', end='', flush=True)
    if Testing:
        pdb.set_trace()
    
    # Write netlist to output file
    with open(encrypted_file_path, 'w') as enc_file:
        enc_file.writelines(edited_netlist)
    print(' Complete', flush=True)

    return True

