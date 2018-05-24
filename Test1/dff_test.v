//Test bench connects the flip-flop to the tester module
module testbench;
    wire clk,d,q,qn;
    dff ff1(d,clk,q,qn);
    tester tst1(q,qn,clk,d);
endmodule

`include "dff.v"

//Tester module sends a periodic clock signal to the flip-flop
module tester(q,qn,clk,d);
    input q,qn;
    output clk,d;
    reg clk,d;

    //Run the test once
    initial
    begin
        clk=0;
        //Dump results of the simulation to ff.cvd
        $dumpfile("dff.vcd");
        $dumpvars;
        //Generate input signal d
           d=0; #9 d=1; #1 d=0; #1 d=1; #2 d=0; #1 d=1; #12 d=0;
        #1 d=1; #2 d=0; #1 d=1; #1 d=0; #1 d=1; #1 d=0; # 7 d=1;
        #8 $finish;
    end

    //Generate periodic clock signal
    always
    begin
        #4 clk=!clk;
    end
endmodule

