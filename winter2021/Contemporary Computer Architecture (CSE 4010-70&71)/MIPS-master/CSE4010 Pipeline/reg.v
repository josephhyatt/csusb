/*  reg.v  */
module register(
    input [4:0] rs,
    input [4:0] rt,
    input [4:0] rd,
    input [31:0] writedata,
    input regwrite,
    output reg	[31:0] A,
    output reg	[31:0] B
    );

// Register Declaration
reg [31:0] REG [0:31]; //gives us 32 registers, each 32 bits long
	
integer i;

initial 
begin
	    A <= 0;
	    B <= 0;
		  
		// initialize our registers
		for (i = 0; i < 32; i = i + 1)
			REG[i] <= 0;
end

always @ * 
begin
		A <= REG[rs];// Assign the rs index of REG to A ;
		B <= REG[rt];// Assign the __ index of REG to B ;
		
		// WRITE data using index rd
		if ((rd!=0) & (regwrite==1))
			REG[rd] <= writedata;
end

endmodule // register

