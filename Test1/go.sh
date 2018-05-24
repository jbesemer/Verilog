iverilog -o dff_test dff_test.v
vvp dff_test
gtkwave dff.vcd
