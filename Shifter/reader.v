// shift register, serial in, parallel out, async clear.
// multiple instances may be chained together.

module reader( clk, enable, si, so, dout );
	parameter width = 32;

	input clk, enable, si;
	output so;
	output [ width - 1 : 0 ] dout;

	reg [ width - 1 : 0 ] data;

	always @( posedge clk )
	begin
		if( enable )
			data <= { data[ width - 1 : 0 ], si };
		// no changeif not clear or enable
	end

	assign dout = { data[ width - 1 : 0 ] };
	assign so = data[ width - 1 ];
endmodule
