`define WIDTH 8

`include "shift_in.v"
`include "shift_out.v"
`include "enabler.v"

//Test bench connects the flip-flop to the tester module
module testbench;
    initial begin
		initial_count = 12;
        //Dump results of the simulation to file
        $dumpfile( "shifter_test.vcd" );
        $dumpvars;
	end

	defparam writer.width = `WIDTH;
	defparam writer.cwidth = 3;
	defparam reader.width = `WIDTH;

    wire clk, load, clr, enable, sio;
	wire	[ `WIDTH - 1 : 0 ] data_in;
	wire	[ `WIDTH - 1 : 0 ] data_out;
	reg [7:0] initial_count;
	wire enabled;

	shift_out writer( clk, load, enable, data_in, sio );
	shift_in reader( clk, clr, enable, sio, data_out, done );
	enabler enabler1( clk, enabled, enable, load, initial_count );

    tester test1( data_in, clk, load, clr, enable );
endmodule

//Tester module sends a periodic clock signal to the DUT
module tester( data_in, clk, load, clr, enable );
    output [ `WIDTH - 1 : 0 ] data_in;
    // output [ `WIDTH - 1 : 0 ] data_out;
	output clk, load, clr, enable;
    reg clk, load, clr, enable;
	reg [ `WIDTH - 1 : 0 ] data_in;
	// reg [ `WIDTH - 1 : 0 ] data_out;

    //Generate periodic clock signal
    always
    begin
        #1 clk=!clk;
    end

    initial
    begin
		// initial conditions
        clk=0;
        clr = 0;
        load=0;
        enable=0;
		data_in = 8'b11000011;
		// data_out = 8'b00000000;

        //Generate stimulus signals
		#2	load = 1;
				clr = 1;

		#2	load = 0;
				clr = 0;

		#2	enable = 1;

		#24	enable = 0;

        #4 $finish;
    end
endmodule

