`timescale 1ns / 1ns
`include "FullAdder.v"

module FullAdder_TB();
reg A, B, CI;
wire S, CO;

FullAdder DUT(S, CO, A, B, CI);

initial
begin
		A=0; B=0; CI=0;
#10	A=0; B=0; CI=1;
#10	A=0; B=1; CI=0;
#10	A=0; B=1; CI=1;
#10	A=1; B=0; CI=0;
#10	A=1; B=0; CI=1;
#10	A=1; B=1; CI=0;
#10	A=1; B=1; CI=1;

#10
$finish();
end
endmodule
