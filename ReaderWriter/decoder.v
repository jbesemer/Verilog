// decode a message and apply changes to the appropriate global setting

module decoder( sclk, enable, data_in );
	parameter width = 64;	// 8 bytes

	input [ width - 1 : 0 ] data_in;
	input sclk, enable;

	always @( posedge sclk )
	begin
		if( enable )
			begin
				// IsBusMaster <= 0;
			end
	end

endmodule
