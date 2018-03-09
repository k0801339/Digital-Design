// Digital Login Design - HW4 module

`timescale 1ns/10ps

module hw4_2(x, y, cin, sum, cout);
	input	[3:0]	x;
	input	[3:0]	y;
	input			cin;
	output	[3:0] 	sum;
	output 			cout;

	wire	c1;
	wire	c2;
	wire	c3;

	//TODO: connect these adders
	f_adder adder0(x[0],y[0],cin,sum[0],c1);
	f_adder adder1(x[1],y[1],c1,sum[1],c2);
	f_adder adder2(x[2],y[2],c2,sum[2],c3);
	f_adder adder3(x[3],y[3],c3,sum[3],cout);
	
endmodule
