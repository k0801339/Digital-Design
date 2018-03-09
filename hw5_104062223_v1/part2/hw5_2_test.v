// Digital Login Design - HW5 testbench

`timescale 1ns/10ps

module hw5_2_test;
	reg [7:0] in;
	reg [2:0] pri;
	wire [2:0] out;
	wire zero;
	hw5_2 m(in, pri, out, zero);
	initial begin
		$fsdbDumpfile("hw5_2.fsdb");
		$fsdbDumpvars;
	end
	initial begin
		in = 8'b00000000;
		pri = 4;		
		#20

		in = in + 1;
		pri = 5;
		#20
		
		in = 8'b01000000;
		pri = 3;
		#20

		in = 8'b00100010;
		pri = 4;
		#20

		in = 8'b01001000;
		pri = 0;
		#20
		
		#100
		$finish;
	end
	initial begin
		$monitor("in = %b, pri = %d | out = %d, zero = %b", in, pri, out, zero);
	end
endmodule
