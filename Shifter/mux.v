// shift register, parallel in, serial out

module mux( data, index, dout );
	parameter data_width = 32;
	parameter index_width = 5;

	input [ data_width - 1 : 0 ] data;
	input	[ index_width - 1 : 0 ] index;
	output	dout;

	assign dout = data[ index ];
endmodule
