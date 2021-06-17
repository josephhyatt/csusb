/* adder.v */
module adder(
	 output reg [31:0] add_out,
    input [31:0] add_in1, add_in2
    ); 
	always@ * 
	begin
		add_out <= add_in1 + add_in2;
	end
endmodule // adder
