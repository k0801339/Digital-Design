// Digital Login Design - HW5 module

`timescale 1ns/10ps

module hw5_2(in, pri, out, zero);
	input	[7:0]	in;
	input	[2:0]	pri;	//select
	output 	[2:0]	out;
	output 	    	zero;	//if zero = 1, means in == 0
	wire	[15:0]	in_d;
	wire	[3:0]	pri_d;
	reg		[2:0]	out;
	reg				zero;
	integer			i;
	
	assign in_d = {in, in};
	assign pri_d = {1'b0, pri};

	always@* begin
		out = 3'h0;
		zero = 1'b1;
		for(i=8;i>=1&&zero!=0;i=i-1) begin	//start from pri, right forward
			if(in_d[pri_d+i] == 1'b1) begin
				out = pri + i;
				zero = 1'b0;
			end
		end
	end	
endmodule
