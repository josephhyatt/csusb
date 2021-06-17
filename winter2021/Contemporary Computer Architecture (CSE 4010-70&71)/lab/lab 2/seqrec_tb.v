// Test bench for seqrec.v
module seqrec_tb();
reg x, CLK, RST;
reg [14:0] sequence;
wire y;
integer i = 0;

seqrec DUT (y, x, RST, CLK);

initial 
	begin
	// 010110101101100
	x = 0;
	CLK = 0;
	RST = 0;
	sequence = 15'b010110101101100;
	// Reset needs to be on
	#10 RST = 1;
	
	for( i = 0; i < 15; i = i + 1)
	begin
		// Simulate the clock, check each bit of the sequence.
		x = sequence[14-i];
		#5 CLK = 1;
		#5 CLK = 0;
	end
	end
endmodule
