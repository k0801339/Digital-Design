// Digital Login Design - HW4 module

`timescale 1ns/10ps

module hw4_1(x, out);
	input	[3:0]	x;
	output			out;
	reg			out;
	always @(*) begin
		case (x)
			3,6,9:	out = 1;	//x=3 or 6 or 9�ɡA��X1
			default:	out = 0;	//��l��X0
		endcase
	end	
endmodule
