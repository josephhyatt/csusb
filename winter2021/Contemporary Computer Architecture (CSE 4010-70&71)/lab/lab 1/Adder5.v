`include "FullAdder.v"

//Ripple Carry Adder using FullAdder.v
module Adder5(S,CO,A,B,CI);
input [4:0] A, B;
input CI;
output [4:0]S;
output CO;

//Store sums and carries, first carry is zero.
wire s0, s1, s2, s3, s4;
wire c0 = CI;
wire c1, c2, c3, c4, c5;

FullAdder fa0(s0,c1, A[0], B[0], c0);
FullAdder fa1(s1,c2, A[1], B[1], c1);
FullAdder fa2(s2,c3, A[2], B[2], c2);
FullAdder fa3(s3,c4, A[3], B[3], c3);
FullAdder fa4(s4,CO, A[4], B[4], c4);

assign S = {s4,s3,s2,s1,s0};
endmodule
