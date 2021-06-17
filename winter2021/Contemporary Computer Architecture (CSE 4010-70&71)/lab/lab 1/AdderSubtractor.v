`include "Adder5.v"

//Adds or subtracts based off of control input
module AdderSubtractor(S,CO, A, B, C);
input [4:0] A, B;
input C;
output [4:0] S;
output CO;

wire x0,x1,x2,x3,x4;
wire [4:0] IB;

//XOR each bit using the contol C
xor
	Inv0(x0,C,B[0]),
	Inv1(x1,C,B[1]),
	Inv2(x2,C,B[2]),
	Inv3(x3,C,B[3]),
	Inv4(x4,C,B[4]);
assign IB = {x4,x3,x2,x1,x0};


Adder5 adder(S, CO, A, IB, C);

endmodule