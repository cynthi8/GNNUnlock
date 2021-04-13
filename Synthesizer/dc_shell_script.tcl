# This script should be called from the python script to set the variables
read_file -format verilog $input_file
set_max_area 0
compile
ungroup -all -flatten
write_file -format verilog -output $output_file
exit

