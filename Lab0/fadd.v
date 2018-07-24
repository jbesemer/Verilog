	
module fadd(a,b,cin,cout,s);  //Implement a full adder.
input a, b, cin;   	// Inputs to be added together with a carry in
output cout, s;   	// Output, carry (cout) and sum (s)

assign {cout,s} = a+b+cin;   // add a and b and put result in c and s.

endmodule