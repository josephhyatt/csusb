// test the alu control
module alu_control_tb();
	wire [2:0] select;
	reg [1:0] alu_op;
	reg [5:0] funct;
	
	alu_control uut(funct, alu_op, select);
	initial begin
	alu_op = 2'b00;
	funct = 6'b100000;
	$monitor("ALUOp = %b\tfunct = %b\tselect = %b", alu_op, funct, select);
	#1
	alu_op = 2'b01;
	funct = 6'b100000;
	#1
	alu_op = 2'b10;
	funct = 6'b100000;
	#1
	funct = 6'b100010;
	#1
	funct = 6'b100100;
	#1
	funct = 6'b100101;
	#1
	funct = 6'b101010;
	#1
	$finish;
	end

endmodule
