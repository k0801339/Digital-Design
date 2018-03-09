// Digital Login Design - HW5 module

`timescale 1ns/10ps

module hw5_1(in, out);
	input	[5:0]	in;
	output	[63:0]	out;
	wire	[7:0]	x, y;
	reg	[63:0]	out;
	integer	i, j;
	
	//pre-decoders
	decoder d0(in[2:0], x);
	decoder d1(in[5:3], y);
	
	always @* begin
		for(i=0;i<8;i=i+1) begin
			for(j=0;j<8;j=j+1) begin
				out[i*8+j] = y[i] & x[j];
			end
		end
	end
endmodule
