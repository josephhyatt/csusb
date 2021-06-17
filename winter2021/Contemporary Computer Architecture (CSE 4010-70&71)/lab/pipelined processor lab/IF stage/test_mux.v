//From Lab Manual
module test_mux();

	// Wire Ports
	wire [31:0] Y;
	
	//Register Declarations
	reg [31:0] A, B;
	reg sel;
	
	mux mux1 (Y, A, B, sel); //instantiate the mux
	
	initial begin
		
		A = 32'hAAAAAAAA;
		B = 32'h55555555;
		sel = 1'b1;
		#10;
		A = 32'h00000000;
		#10
		sel = 1'b1;
		#10;
		B= 32'hffffffff;
		#5;
		A= 32'hA5A5A5A5;
		#5;
		sel = 1'b0;
		B= 32'hDDDDDDDD;
		#5;
		sel = 1'bx;
	end
	
	always @(A or B or sel)
		#1 $display(" At t = %0d sel = %b A = %h B = %h Y = %h",
							$time, sel, A, B, Y);
	
endmodule // test
