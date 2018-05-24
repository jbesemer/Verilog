`define WIDTH 64

`include "reader.v"
`include "writer.v"
`include "sender.v"
// `include "enabler.v"
// `include "receiver.v"
// `include "decoder.v"
// `include "settings.v"

//Test bench connects the tester module to the DUT
module testbench;
    initial begin
		initial_count = `WIDTH;
        //Dump results of the simulation to file
        $dumpfile( "results.vcd" );
        $dumpvars;
	end

	// `include "globals.vh"

    wire clk, load, clr, enable, sio;
	wire	[ `WIDTH - 1 : 0 ] data_init;
	wire	[ `WIDTH - 1 : 0 ] data_out;
	reg [7:0] initial_count;
	wire enabled;

	writer writer1( clk, enable, sio, load, data_init );
	reader reader1( clk, enable, sio, data_out );
// 	enabler enabler1( clk, enabled, enable, load, initial_count );
// 	receiver receiver1( clk, enabled, reset, sio );

    tester test1( clk, load, clr, enable );
endmodule

//Tester module sends a periodic clock signal and other stimuli to the DUT

module tester(
	output clk, load, clr, enable
	);

    reg clk, load, clr, enable;

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

        //Generate stimulus signals
		#2	load = 1;
				clr = 1;

		#2	load = 0;
				clr = 0;

		#2	enable = 1;

		#64	enable = 0;

        #4 $finish;
    end
endmodule

