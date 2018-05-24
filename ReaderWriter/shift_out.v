// shift register, parallel in, serial out

module shift_out( clk, load, enable, init_value, sout );
	parameter width = 64;	// 8 bytes
	parameter cwidth = 5;

	input	clk, load, enable;
	input [ width - 1 : 0 ] init_value;
	output	sout;
	reg [ width - 1 : 0 ] data;
	reg [ cwidth - 1 : 0 ] index;
	reg done;

	always @( posedge clk or posedge load )
	begin
		if( load )
			begin
				data <= init_value;
				index <= 0;
				done <= 0;
			end
		else if( enable && !done )
			begin
				index <= index +1;
				done <= &index;
			end
		// no change if not load or enable
	end

	assign sout = data[ index ];

endmodule
