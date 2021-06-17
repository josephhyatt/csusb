
/* execute.v */
module EXECUTE(
	input		wire	[1:0]		wb_ctl,
	input		wire	[2:0]		m_ctl,
	input		wire				regdst, alusrc,
	input		wire	[1:0]		aluop,
	input		wire	[31:0]	npcout, rdata1, rdata2, s_extendout,
	input		wire	[4:0]		instrout_2016, instrout_1511,
	output	wire	[1:0]		wb_ctlout,
	output	wire				branch, memread, memwrite,
	output	wire	[31:0]	EX_MEM_NPC,
	output	wire				zero,
	output	wire	[31:0]	alu_result, rdata2out,
	output	wire	[4:0]		five_bit_muxout
	);

	// signals
	wire	[31:0]	adder_out, b, aluout;
	wire	[4:0]		muxout;
	wire	[2:0]		control;
	wire				aluzero;

	// instantiations
   // have at it, wire this using Fig 3.1

	 adder adder1(
		// output
		.add_out(adder_out),
		// inputs
		.add_in2(s_extendout),
		.add_in1(npcout));

	mux mux2(
		// output
		.y(b),
		// inputs
		.a(s_extendout),
		.b(rdata2),
		.sel(alusrc));

	alu alu1(
		// inputs
		.a(rdata1),
		.b(b),
		.control(control),
		// outputs
		.result(aluout),
		.zero(aluzero));

	alu_control alu_control1(
		// inputs
		.funct(s_extendout[5:0]),
		.aluop(aluop),
		// output
    	.select(control));

	mux #(5) bottom_mux1(
		 // output
		.y(muxout),
		 // inputs
		.a(instrout_1511),
		.b(instrout_2016),
		.sel(regdst));

	ex_mem ex_mem1(
		//inputs
		.ctlwb_out(wb_ctl),
		.ctlm_out(m_ctl),
		.adder_out(adder_out),
		.aluzero(aluzero),
		.aluout(aluout),
		.readdat2(rdata2),
		.muxout(muxout),
		// outputs
		.wb_ctlout(wb_ctlout),
		.branch(branch),
		.memread(memread),
		.memwrite(memwrite),
		.add_result(add_result),
		.zero(zero),
		.alu_result(alu_result),
		.rdata2out(rdata2out),
		.five_bit_muxout(five_bit_muxout));
		
 initial begin
      $display("Time\t wb_ctlout\t branch\t memread\t memwrite\t EX_MEM_NPC\t zero\t alu_result\t rdata2out\t five_bit_muxout");
      $monitor("%0d\t %b\t %b\t %b\t %b\t %0d\t %b\t %h\t %h\t %b\t", $time, wb_ctlout, branch, memread, memwrite, EX_MEM_NPC, zero, alu_result, rdata2out, five_bit_muxout);
      #20 $finish;
   end

endmodule // IEXECUTE
