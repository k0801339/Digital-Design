// Digital Login Design - HW5 testbench

`timescale 1ns/10ps

module hw5_1_test;
	reg [5:0] in;
	wire [63:0] out;
	hw5_1 m(in,out);
	initial begin
		$fsdbDumpfile("hw5_1.fsdb");
		$fsdbDumpvars;
	end
	initial begin
		in = 6'b000000;
		repeat (64) begin
			#100
			$display("in = %d, out = %b", in, out);
			in = in + 6'b000001;
		end
	end
endmodule
