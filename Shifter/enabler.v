// hold enabled output high for fixed number of clock cycles

module enabler( clk, enabled, enable, reset, initial_count );
	parameter width = 8;

	output enabled;
	input clk, enable, reset;
	input [ width - 1 : 0] initial_count;

	reg [ width - 1 : 0 ] count;

	always @( posedge clk or posedge reset )
	begin
		if( reset )
			begin
				count <= initial_count;
			end
		else if( enable && count > 0 )
			begin
				count <= count - 1;
			end
		// no change if not load or enable
	end

	assign enabled = enable && ( count > 0 );

endmodule
