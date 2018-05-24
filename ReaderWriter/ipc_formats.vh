
`include "ipc_commands.vh"

// only used for testing

function [ `IpcMessageWidth - 1 : 0 ] ipc_create_SetMasterConfig;
input isEnabled;
reg [ `IpcMessageWidth - 1 : 0 ] result;
begin
	result = 0;
	result[ 7 : 0 ] = SET_MASTER_CONFIG;
	result[ `IpcMessageWidth - 1 ] = isEnabled;
	ipc_create_SetMasterConfig = result;
end
endfunction

function [ `IpcMessageWidth - 1 : 0 ] ipc_create_SetDecimator;
input [ 16 : 0 ] divider;
reg [ `IpcMessageWidth - 1 : 0 ] result;
begin
	result = 0;
	result[ 7 : 0 ] = SET_PROG_DECIMATOR;
	result[ `IpcMessageWidth : `IpcMessageWidth - 16 ] = divider;
end
endfunction

function [ `IpcMessageWidth - 1 : 0 ] ipc_create_SetBinAveraging;
input [ 4 : 0 ] bin_size;
reg [ `IpcMessageWidth - 1 : 0 ] result;
begin
	result = 0;
	result[ 7 : 0 ] = SET_PROG_BINAVG;
	result[ `IpcMessageWidth : `IpcMessageWidth - 4  ] = bin_size;
end
endfunction
