read_file -format verilog $input_file
compile_ultra -no_autoungroup
ungroup -all -flatten
write_file -format verilog -output $output_file
exit

