// Digital Login Design - HW5 module

`timescale 1ns/10ps

module hw5_3(in, pri, out, zero);
	input	[15:0]	in;
	input	[3:0]	pri;	//select
	output 	[3:0]	out;
	output			zero;
	reg		[3:0]	out;
	wire	[2:0]	tmp_pri;
	wire	[2:0]	out_1, out_2;
	wire			zero;
	wire			zero_1, zero_2;

	assign tmp_pri = 7 - pri[2:0];
	//if pri>7, for enc0 pri should start from "7", and vise versa.
	hw5_2 enc0(in[7:0], tmp_pri[2:0]*pri[3]+pri[2:0], out_1, zero_1);	  //pri[3]==1 means pri>7
	hw5_2 enc1(in[15:8], tmp_pri[2:0]*~pri[3]+pri[2:0], out_2, zero_2);	  //pri[3]==0 means pri<7
	
	assign zero = zero_1 && zero_2;

	always@* begin
		if(zero!=1) begin
			if(pri<=7) begin
				if(out_1<=pri&&zero_1!=1)
					out = out_1;
				else if(zero_2==1)
					out = out_1;
				else
					out = out_2 + 8;
			end else begin
				if(out_2+8<=pri&&zero_2!=1)
					out = out_2 + 8;
				else if(zero_1==1)
					out = out_2 + 8;
				else
					out = out_1;
			end
		end else
			out = 4'h0;
	end
endmodule
