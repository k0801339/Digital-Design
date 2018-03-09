// Digital Login Design - HW4 testbench

`timescale 1ns/10ps

module hw4_1_test;
	reg [3:0] x;
	wire out;
	hw4_1 m(x,out);
	initial begin
		$fsdbDumpfile("hw4_1.fsdb");
		$fsdbDumpvars;
	end
	initial begin
		x = 4'b0000;
		repeat (16) begin
			#100
			$display("in = %b, out = %b", x, out);
			x = x + 4'b0001;
		end
	end
endmodule
