/* alu.v */
module alu(
    input	wire	[31:0]	a,
    input	wire	[31:0]	b,
    input	wire	[2:0]		control,
    output	reg	[31:0]	result,
    output	wire				zero
    );

	parameter	ALUadd		=	3'b010, // Get these values from
					ALUsub		=	3'b110, // Figure 3.2 in Lab Manual
					ALUand		=	3'b000,
					ALUor			=	3'b001,
					ALUslt		=	3'b111;
					
					
// Handles negative inputs
	wire sign_mismatch;
	assign sign_mismatch = a[31] ^ b[31]; 
	
	initial
		result <= 0;
	
	always@*
		case(control)
			ALUadd:			result = a + b;
			ALUsub:			result = a - b;
			ALUand:			result = a && b;
			ALUor:			result = a || b;
			ALUslt:			result = a < b	? 1 - sign_mismatch : 0 + sign_mismatch;			
			default:			result = 32'bX;
		endcase
		
		assign zero = (result==0) ? 1'b1 : 1'b0;
		/* If result is 0, assign it true (1).
		Otherwise, assign it false (0) */	
endmodule // alu

