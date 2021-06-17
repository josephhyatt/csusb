// test bench for mux
module five_bit_mux_tb();
	wire [4:0] Y;
	reg [4:0] A,B;
	reg sel;
	
	mux #(5) uut( Y, A, B, sel);
	
	initial begin
	A = 5'b01010;
	B = 5'b10101;
	sel = 1'b1;
	#10;
	A = 5'b00000;
	#10
	sel = 1'b1;
	#10;
	B = 5'b11111;
	#5;
	A = 5'b00101;
	#5;
	sel = 1'b0;
	B = 5'b11101;
	#5;
	sel = 1'bx;
	end

endmodule
