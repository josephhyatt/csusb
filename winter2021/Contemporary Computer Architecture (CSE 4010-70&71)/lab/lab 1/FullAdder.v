
// Structural full adder, from Wakerly Verilog Tutorial
module FullAdder(S, CO, A, B, CI);
input A,B, CI;
output S, CO;

wire X1;
wire P1,P2,P3;

xor
	U1a(X1,A,CI),
	U1b(S,X1,B);
	
and
	U2a(P1,A,B),
	U2b(P2,A,CI),
	U2c(P3,B,CI);

or
	U3a(CO,P1,P2,P3);
endmodule
