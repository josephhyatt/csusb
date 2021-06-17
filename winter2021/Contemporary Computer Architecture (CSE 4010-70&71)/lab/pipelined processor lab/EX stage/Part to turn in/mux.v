
module mux 
	#(parameter BITS = 32)(
	output	wire	[BITS-1:0]	y,		// Output of Multiplexer
	input		wire	[BITS-1:0]	a,		// Input 1 of Multiplexer
										b,		// Input 0 of Multiplexer
	input		wire					sel	// Select Input
   );
   
   assign	y = sel ? a : b;
	
endmodule // mux
