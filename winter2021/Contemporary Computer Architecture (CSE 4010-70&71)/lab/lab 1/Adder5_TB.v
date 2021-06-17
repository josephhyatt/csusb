`timescale 1ns / 1ns
`include "Adder5.v"

//Test bench for Adder5
module Adder5_TB();
reg [4:0]A, B;
reg CI;
wire [4:0]S;
wire CO;

Adder5 DUT(S,CO,A,B,CI);

initial
begin
		A=5'b00110; B=5'b00001; CI=0;
#10	A=5'b00010; B=5'b01111; CI=0;
#10	A=5'b11101; B=5'b00100; CI=0;
#10	A=5'b11011; B=5'b10100; CI=0;
#10
$finish();
end
endmodule
