// read a message and process it into the appropriate global setting

module receiver( sclk, enable, reset, mosi );
	input sclk, enable, reset, mosi;

	always @( posedge sclk )
	begin
		if( reset )
			begin
				// IsBusMaster <= 0;
			end
	end

endmodule
