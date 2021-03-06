`timescale 1ns / 1ps

module test_mem();
   wire [31:0] data_out;

   reg [31:0] address;
   reg [31:0] data;
   reg        mem_read, mem_write;

   initial
     begin
        // $dumpfile("reg_test.vcd");
        // $dumpvars(0, reg_test);

        mem_read  = 1'b1;
        mem_write = 1'b0;
        address   = 32'b00000001;

        #1;
		  mem_read = 1'b0;
        mem_write = 1'b1;
        address   = 32'b00000001;
        data      = ~address;

        #1;
		  mem_read = 1;
        mem_write = 0;
        address   = 32'b00000010;

        #1;
		  mem_read = 1;
        mem_write = 1;
        address   = 32'b00000010;
        data      = ~address;

        #1;
		  mem_read = 1;
        mem_write = 0;
        address   = 32'b00000100;

        #1;
		  mem_read = 0;
        mem_write = 1;
        address   = 32'b00000100;
        data      = ~address;

        #1;
		  mem_read = 1;
        mem_write = 0;
        address   = 32'b00001000;

        #1;
		  mem_read = 1;
        mem_write = 1;
        address   = 32'b00001000;
        data      = ~address;

        #1;
		  $finish;
     end

   data_memory data_memory1(
						.address(address),
						.write_data(data),
						.memread(mem_read),
						.memwrite(mem_write),
                  .read_data(data_out));

endmodule
