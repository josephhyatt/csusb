`timescale 1ns / 1ns
`include "AdderSubtractor.v"

//Testbench for AdderSubtractor
module AdderSubtractor_TB();
reg [4:0]A, B;
reg C;
wire [4:0]S;
wire CO;

AdderSubtractor DUT(S,CO,A,B,C);

initial
begin
		A=5'b00110; B=5'b00001; C=0;
#10	A=5'b00110; B=5'b00001; C=1;
#10	A=5'b00010; B=5'b01111; C=0;
#10	A=5'b00010; B=5'b01111; C=1;
#10	A=5'b11101; B=5'b00100; C=0;
#10	A=5'b11101; B=5'b00100; C=1;
#10	A=5'b11011; B=5'b10100; C=0;
#10	A=5'b11011; B=5'b10100; C=1;
#10
$finish();
end
endmodule
