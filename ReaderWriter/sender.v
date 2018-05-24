// format a message and load it into the writer

`include "ipc_commands.vh"

module sender(
	input clk, start, command, load_data,
	output [ `WIDTH - 1 : 0 ] data_out );

	integer command;

	always @( posedge clk )
	begin
		if( start )
		begin
			data_out[ 7 : 0 ] = command[ 7 : 0 ];
			case( command )
				`SET_MASTER_CONFIG:
					begin
						data_out[ 63 ] = 1;
					end
				`SET_PROG_DECIMATOR:
				default:
			endcase
		end
	end

endmodule
