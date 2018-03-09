// Digital Login Design - HW4 testbench

`timescale 1ns/10ps

module hw4_2_test;
	reg [3:0] A;
	reg [3:0] B;
	reg cin;
	
	wire [3:0] sum;
	wire cout;
	hw4_2 m(A,B,cin,sum,cout);

	initial begin
		$fsdbDumpfile("hw4_2.fsdb");
		$fsdbDumpvars;
	end
	initial begin
		A = 4'b0000;
		B = 4'b0000;
		cin = 1'b0;
		repeat(16) begin
			B = A;	//�קK���ơAB�qA���ƭȶ}�l
			while(B!=4'b1111) begin
				#20
				$display("A=%b B=%b cin=%b | cout=%b sum=%b", A, B, cin, cout, sum);
				B = B + 4'b0001;
			end
			//�H�U��B=4'b1111�ɪ����p
			#20
			$display("A=%b B=%b cin=%b | cout=%b sum=%b", A, B, cin, cout, sum);
			A = A +4'b0001;
		end
	end
	
endmodule
