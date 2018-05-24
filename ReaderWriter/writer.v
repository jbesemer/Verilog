// shift register, parallel in, serial out

module writer( sclk, enable, mosi, load_data, data_init );
	parameter width = 64;	// 8 bytes
	parameter cwidth = 6;	// indexer width

	input sclk, enable, load_data;
	output mosi;
	input [ width - 1 : 0 ] data_init;
	reg [ width - 1 : 0 ] data;
	reg [ cwidth - 1 : 0 ] index;
	reg done;

	always @( posedge sclk or posedge load_data )
	begin
		if( load_data )
			begin
				data <= data_init;
				index <= 0;
				done <= 0;
			end

		else if( enable && !done )
			begin
				index <= index +1;
				done = &index;
			end
	end

	assign mosi = data[ index ];

endmodule
