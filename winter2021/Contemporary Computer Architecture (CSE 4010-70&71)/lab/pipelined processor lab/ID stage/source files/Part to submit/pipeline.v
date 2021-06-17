
module pipeline ();

  wire [31:0] IF_ID_instr, IF_ID_npc;
  
  wire [4:0] MEM_WB_rd;
  wire 		 MEM_WB_regwrite;
  wire [31:0]WB_mux5_writedata;
  wire [1:0] ID_EX_wbctlout;
  wire [2:0] ID_EX_mctlout;
  wire [1:0] ID_EX_aluop;
  wire ID_EX_regdst, ID_EX_alusrc;
  wire [31:0] ID_EX_npcout,IP_EX_rdata1out, IP_EX_rdata2out, IP_EX_sextendout;
  wire [4:0] IP_EX_instrout2016, IP_EX_instrout1511;
  reg EX_MEM_PCSrc;
  reg [31:0] EX_MEM_NPC;
  //ID

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
	
   initial begin
   EX_MEM_PCSrc <= 0;
   EX_MEM_NPC <= 0;
	
   end
      initial begin
      $dumpfile ("pipeline.vcd"); // Change filename as appropriate. 
      $dumpvars(1, ifetch1);
     
   end

endmodule // pipeline
