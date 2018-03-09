// Digital Login Design - HW1 testbench

`timescale 1ns/10ps

module hw1_test;
	reg [1:0] count;	//����ܼơA2bits
	wire out;
	hw1 m(count[0], count[1], out);
	initial begin
		$fsdbDumpfile("hw1.fsdb");
		$fsdbDumpvars;
	end
	initial begin
		count = 2'b00;	//�q 0 0 �}�l
		repeat (4) begin
			#100
			$display("in = %b, out = %b", count, out);
			count = count + 2'b01;	//�C���ҼW�[1
		end
	end
endmodule
