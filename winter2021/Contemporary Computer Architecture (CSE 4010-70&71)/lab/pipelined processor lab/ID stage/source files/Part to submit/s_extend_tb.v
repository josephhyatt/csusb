// test s_extend
module s_extend_tb();
reg [15:0] A;
wire [31:0] B;

s_extend uut(A, B);

initial begin
		A = 16'b0000000000000000;
		#10
		A = 16'b1000000000000000;
		#10
		A = 16'b0000001000000000;
		#10
		A = 16'b1111111111111111;
end

endmodule
