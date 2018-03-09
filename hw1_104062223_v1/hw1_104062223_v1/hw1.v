// Digital Login Design - HW1 module
`timescale 1ns/10ps

module hw1(x, y, out);
    input x, y;
    output out;
    wire out;
	assign out = (x|y)&~(x&y);
endmodule
