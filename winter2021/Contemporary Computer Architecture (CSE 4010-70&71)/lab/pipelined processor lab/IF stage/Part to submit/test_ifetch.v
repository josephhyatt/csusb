
module test_ifetch();

	// Inputs
	reg EX_MEM_PCSrc;
	reg [31:0] EX_MEM_NPC;
	
	// Outputs
	wire [31:0] IF_ID_instr;
	wire [31:0] IF_ID_npc;
	
	// Instantiate the Unit Under Test (UUT)
	ifetch uut (
		.IF_ID_instr(IF_ID_instr),
		.IF_ID_npc(IF_ID_npc),
		.EX_MEM_PCSrc(EX_MEM_PCSrc),
		.EX_MEM_NPC(EX_MEM_NPC)
	);
	
	initial begin
		// Initialize Inputs
		EX_MEM_PCSrc = 0;
		EX_MEM_NPC = 0;
		
		#100;
		
	end

endmodule
