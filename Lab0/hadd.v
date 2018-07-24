

module hadd(a,b,cout,s);  // Implement a half-adder
input a, b;               // Inputs to be added together
output cout, s;	       // Output, carry (cout) and sum (s)

assign {cout,s} = a+b;  // add a and b,
                        // ...result in cout and s.

endmodule

// from; http://www.swarthmore.edu/NatSci/echeeve1/Ref/embedRes/QQS_V/QuickQuartusVerilog.html