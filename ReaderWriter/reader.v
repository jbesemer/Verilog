// shift register, serial in, parallel out, async clear.

module reader( sclk, enable, mosi, dout );
	parameter width = 64;	// 8 bytes

	input sclk, enable, mosi;
	output [ width - 1 : 0 ] dout;
	reg [ width - 1 : 0 ] data;

	always @( posedge sclk )
	begin
		if( enable )
			data <= { data[ width - 1 : 0 ], mosi };
		// no changeif not clear or enable
	end

	assign dout = { data[ width - 1 : 0 ] };
endmodule
