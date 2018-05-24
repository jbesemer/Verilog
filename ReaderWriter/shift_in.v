// shift register, serial in, parallel out, async clear

module shift_in( clk, clr, enable, si, dout, done );
	parameter width = 64;	// 8 bytes

	input clk, si, clr, enable;
	output [ width - 1 : 0 ] dout;
	output done;

	reg [ width : 0 ] data;

	always @( posedge clk or posedge clr )
	begin
		if( clr )
			data <= 1; // { ( width ){ 1'b0 }};
		else if( enable && !done )
			data <= { data[ width - 1 : 0 ], si };
		// no changeif not clear or enable
	end

	assign dout = { data[ width - 1 : 0 ] };
	assign done = data[ width ];
endmodule
