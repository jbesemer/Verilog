module lab0(SW,LEDR);
input [3:0]SW;     // add SW[0] and SW[1] are inputs
output [2:0]LEDR;  // LED's are outputs 

wire cout1;

// create a two bit adder, a half adder and a full adder
	hadd myHalfAdder(SW[0], SW[2], cout1, LEDR[0]);			// Add low bits
	fadd myFullAdder(SW[1], SW[3], cout1, LEDR[2], LEDR[1]);// Add high bits

endmodule