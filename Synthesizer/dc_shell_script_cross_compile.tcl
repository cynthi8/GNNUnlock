read_file -format verilog $input_file
ungroup -all -flatten
compile_ultra -no_autoungroup
write_file -format verilog -output $output_file
exit

