/* WRITEBACK.v */
module WRITEBACK(
	input	wire MEM_WB_memtoreg,
	input	wire [31:0]	read_data, mem_alu_result,
	output wire [31:0] WB_mux_writedata
   );

	// instantiation
	mux mux3(
				// output
				.y(WB_mux_writedata),
				// inputs
				.sel(MEM_WB_memtoreg),
				.a(read_data),
				.b(mem_alu_result)
	);
endmodule // WRITEBACK
