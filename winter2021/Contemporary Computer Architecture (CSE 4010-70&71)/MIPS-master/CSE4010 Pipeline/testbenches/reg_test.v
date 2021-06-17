`timescale 1ns / 1ps

module reg_test;
   wire [31:0] data_rs, data_rt;

   reg [4:0]  addr_rs, addr_rt, write_addr;
   reg [31:0] write_data;
   reg        regWrite;

   initial
     begin
        addr_rs = 0;
        addr_rt = 1;
        regWrite = 0;

        #1;
		  addr_rs = 2;
        addr_rt = 3;
        write_addr = 3;
        write_data = 'b100;

        #1;
		  addr_rs = 4;
        addr_rt = 5;
        regWrite = 1;

        #1;
		  regWrite = 0;
        addr_rt = 3;

        #1;
		  addr_rs = 6;
        regWrite = 1;
        write_addr = 6;
        write_data = 'b100;

        #1;
		  $finish;
     end

   register	regfile(
		.rs(addr_rs),
		.rt(addr_rt),
      .rd(write_addr),
		.writedata(write_data),
		.regwrite(regWrite),
		.A(data_rs), //output
		.B(data_rt) // output
		);

endmodule
