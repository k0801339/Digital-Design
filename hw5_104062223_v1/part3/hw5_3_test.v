// Digital Login Design - HW5 testbench

`timescale 1ns/10ps

module hw5_3_test;
	reg [15:0] in;
	reg [3:0] pri;
	wire [3:0] out;
	wire zero;
	hw5_3 m(in, pri, out, zero);
	initial begin
		$fsdbDumpfile("hw5_3.fsdb");
		$fsdbDumpvars;
	end
	initial begin
		in = 16'b0000000000000000;
		pri = 10;	
		#10

		in = in + 1;
		repeat (16) begin
			#10
			in = in << 1;
		end
		
		in = 16'b0000000000100001;
		pri = 10;
		#10

		in = 16'b0010000100000000;
		pri = 3;
		#10

		in = 16'b0010000000000001;
		pri = 7;
		#10

		in = 16'b0000001000000001;
		pri = 13;
		#10
		in = 16'b0100000100101000;
		pri = 7;
		#10

		#100
		$finish;
	end
	initial begin
		$monitor("in = %b, pri = %d | out = %d, zero = %b", in, pri, out, zero);
	end
endmodule
