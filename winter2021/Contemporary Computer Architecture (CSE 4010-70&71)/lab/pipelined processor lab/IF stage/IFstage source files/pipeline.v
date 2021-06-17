// `include "ifetch.v"

module pipeline ();

  wire [31:0] IF_ID_instr, IF_ID_npc;
  reg EX_MEM_PCSrc;
  reg [31:0] EX_MEM_NPC;

   ifetch ifetch1(.IF_ID_instr(IF_ID_instr),
                    .IF_ID_npc(IF_ID_npc),
                    .EX_MEM_PCSrc(EX_MEM_PCSrc),
                    .EX_MEM_NPC(EX_MEM_NPC) );
   initial begin
   EX_MEM_PCSrc <= 0;
   EX_MEM_NPC <= 0;
   end
      initial begin
      $dumpfile ("pipeline.vcd"); // Change filename as appropriate.
      $dumpvars(1, ifetch1);

   end

endmodule // pipeline
