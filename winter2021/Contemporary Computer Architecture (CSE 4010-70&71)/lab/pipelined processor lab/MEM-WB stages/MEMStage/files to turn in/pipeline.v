
module pipeline ();
//IF
  wire [31:0] IF_ID_instr, IF_ID_npc;
  reg EX_MEM_PCSrc;
  reg [31:0] EX_MEM_NPC;
//ID 
  wire [4:0] MEM_WB_rd;
  wire 		 MEM_WB_regwrite;
  wire [31:0]WB_mux5_writedata;
  wire [1:0] ID_EX_wbctlout;
  wire [2:0] ID_EX_mctlout;
  wire [1:0] ID_EX_aluop;
  wire ID_EX_regdst, ID_EX_alusrc;
  wire [31:0] ID_EX_npcout,IP_EX_rdata1out, IP_EX_rdata2out, IP_EX_sextendout;
  wire [4:0] IP_EX_instrout2016, IP_EX_instrout1511;
 //EX
  wire [1:0] EX_ctlout;
  wire EX_branch, EX_memread, EX_memwrite;
  wire EX_zero;
  wire [31:0] EX_alu_result, EX_rdata2out;
  wire [4:0] EX_five_bit_muxout;
 //MEM
  wire MEM_PCSrc;
  wire MEM_WB_memtoreg;
  wire [31:0] MEM_read_data;
  wire [31:0] MEM_alu_result;
  wire [4:0] MEM_write_reg;

   ifetch ifetch1(.IF_ID_instr(IF_ID_instr),
                    .IF_ID_npc(IF_ID_npc),
                    .EX_MEM_PCSrc(EX_MEM_PCSrc),
                    .EX_MEM_NPC(EX_MEM_NPC) );
						  
	IDECODE idecode1(.IF_ID_instrout(IF_ID_instr),
							.IF_ID_npcout(IF_ID_npc),
							.MEM_WB_rd(MEM_WB_rd),
							.MEM_WB_regwrite(MEM_WB_regwrite),
							.WB_mux5_writedata(WB_mux5_writedata),
							.wb_ctlout(ID_EX_wbctlout),
							.m_ctlout(ID_EX_mctlout),
							.regdst(ID_EX_regdst),
							.alusrc(ID_EX_alusrc),
							.aluop(ID_EX_aluop),
							.npcout(ID_EX_npcout),
							.rdata1out(IP_EX_rdata1out),
							.rdata2out(IP_EX_rdata2out),
							.s_extendout(IP_EX_sextendout),
							.instrout_2016(IP_EX_instrout2016),
							.instrout_1511(IP_EX_instrout1511));
							
	EXECUTE execute1(.wb_ctl(ID_EX_wbctlout),
							.m_ctl(ID_EX_mctlout),
							.regdst(ID_EX_regdst),
							.alusrc(ID_EX_alusrc),
							.aluop(ID_EX_aluop),
							.npcout(ID_EX_npcout),
							.rdata1(IP_EX_rdata1out),
							.rdata2(IP_EX_rdata2out),
							.s_extendout(IP_EX_sextendout),
							.instrout_2016(IP_EX_instrout2016),
							.instrout_1511(IP_EX_instrout1511),
							.wb_ctlout(EX_ctlout),
							.branch(EX_branch),
							.memread(EX_memread),
							.memwrite(EX_memwrite),
							.EX_MEM_NPC(EX_MEM_NPC),
							.zero(EX_zero),
							.alu_result(EX_alu_result),
							.rdata2out(EX_rdata2out),
							.five_bit_muxout(EX_five_bit_muxout));
	
	MEMORY memory1(.wb_ctlout(EX_ctlout),
						.branch(EX_branch),
						.memread(EX_memread),
						.memwrite(EX_memwrite),
						.zero(EX_zero),
						.alu_result(EX_alue_result),
						.rdata2out(EX_rdata2out),
						.five_bit_muxout(EX_five_bit_muxout),
						.MEM_PCSrc(MEM_PCSrc),
						.MEM_WB_regwrite(MEM_WB_regwrite),
						.MEM_WB_memtoreg(MEM_WB_memtoreg),
						.read_data(MEM_read_data),
						.mem_alu_result(MEM_alu_result),
						.mem_write_reg(MEM_write_reg));
	
	writeback wb1(.MEM_WB_memtoreg(MEM_WB_memtoreg),
						.read_data(MEM_read_data),
						.mem_alu_result(MEM_alu_result),
						.WB_mux_writedata(WB_mux_writedata));
	
	
   initial begin
   EX_MEM_PCSrc <= 0;
   EX_MEM_NPC <= 0;
	
   end
      initial begin
      $dumpfile ("pipeline.vcd"); // Change filename as appropriate. 
      $dumpvars(1, ifetch1);
     
   end

endmodule // pipeline
