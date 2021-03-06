{\rtf1\ansi\ansicpg950\deff0\nouicompat\deflang1033\deflangfe1028{\fonttbl{\f0\fnil\fcharset136 \'b7\'73\'b2\'d3\'a9\'fa\'c5\'e9;}}
{\*\generator Riched20 10.0.10240}\viewkind4\uc1 
\pard\sa200\sl276\slmult1\f0\fs22\lang1028 module elevator(door, led, ud, alarm, up, down, clk, full, stop, close, clr, up1, up2, up3, down2, down3, down4, k1, k2, k3, k4, g1, g2, g3, g4);\par
input clk, full, stop, close, clr;\par
input up1, up2, up3;\par
input down2, down3, down4;\par
input k1, k2, k3, k4;\par
input g1, g2, g3, g4;\par
output reg [1:0] door;\par
output reg [3:0] led;\par
output reg ud, alarm, up, down;\par
reg k11, k22, k33, k44;\par
reg up11, up22, up33;\tab //output led maybe\par
reg down22, down33, down44;\par
reg [2:0] ql;\tab //timer\par
reg operdoor, updown, en_up, en_down;\par
reg [3:0] kk, uu, dd, uu_dd;\par
\par
always @(posedge clk) begin\par
\tab //\'ac\'b0\'b9\'71\'b1\'e8\'a4\'ba\'b0\'54\'b8\'b9\'c0\'cb\'ac\'64\'a8\'c3\'c0\'78\'a6\'73\par
\tab if(k1)\tab k11<=k1;\par
\tab else if(k2)\tab k22<=k2;\par
\tab else if(k3)\tab k33<=k3;\par
\tab else if(k4)\tab k44<= k4;\line\tab //\'ac\'b0\'b9\'71\'b1\'e8\'a5\'7e\'aa\'ba\'a4\'57\'a4\'c9\'ab\'f6\'b6\'73\'c0\'cb\'ac\'64\'a8\'c3\'c0\'78\'a6\'73\par
\tab if(up1)\tab up11<=up1;\par
\tab else if(up2)\tab up22<=up2;\par
\tab else if(up3)\tab up33<=up3;\par
\tab //\'ac\'b0\'b9\'71\'b1\'e8\'a5\'7e\'aa\'ba\'a4\'55\'ad\'b0\'ab\'f6\'b6\'73\'c0\'cb\'ac\'64\'a8\'c3\'c0\'78\'a6\'73\par
\tab if(down2)\tab down22<=down2;\par
\tab else if(down3)\tab down33<=down3;\par
\tab else if(down4)\tab down44<=down4;\par
\par
\tab kk[3:0] = \{k44,k33,k22,k11\};\tab //\'b9\'71\'b1\'e8\'a4\'ba\'ab\'f6\'b6\'73\'b0\'54\'b8\'b9\'b6\'b0\'a6\'58\par
\tab uu[3:0] = \{1'b0, up33, up22, up11\};\tab //\'b9\'71\'b1\'e8\'a5\'7e\'a4\'57\'a4\'c9\'b6\'b0\'a6\'58\par
\tab dd[3:0] = \{down44, down33, down22, 1'b0\};\tab //\'b9\'71\'b1\'e8\'a5\'7e\'a4\'55\'ad\'b0\'b6\'b0\'a6\'58\par
\tab uu_dd[3:0] = kk||uu||dd;\par
\tab ud = updown;\par
\tab\par
\tab if(clr) begin\par
\tab\tab ql <= 3'b000;\par
\tab\tab alarm <= 1'b0;\par
\tab end else if(full) begin\par
\tab\tab alarm <= 1'b1;\par
\tab\tab ql <= 3'b000;\par
\tab\tab door <= 2'b10;\par
\tab end else begin\par
\tab\tab if(opendoor) begin\par
\tab\tab\tab door <= 2'b10;\par
\tab\tab\tab ql <= 3'b000;\par
\tab\tab\tab up <= 1'b0;\par
\tab\tab\tab down <= 1'b0;\par
\tab\tab end else if(en_up) begin\par
\tab\tab\tab if(stop) begin\par
\tab\tab\tab\tab door <= 2'b10;\par
\tab\tab\tab\tab ql <= 3'b000;\par
\tab\tab\tab end else if(close) begin\par
\tab\tab\tab\tab ql <= 3'b011;\par
\tab\tab\tab end else if(ql==3'b110) begin\par
\tab\tab\tab\tab door <= 2'b00;\par
\tab\tab\tab\tab updown <= 1'b1;\par
\tab\tab\tab\tab up <= 1'b1;\par
\tab\tab\tab\tab down <= 1'b0;\par
\tab\tab\tab end else if(ql>3'b011) begin\par
\tab\tab\tab\tab door <= 2'b01;\par
\tab\tab\tab\tab ql <= ql +1;\par
\tab\tab\tab end else begin\par
\tab\tab\tab\tab ql <= ql +1;\par
\tab\tab\tab\tab door <= 2'b10;\par
\tab\tab\tab end\par
\tab\tab end else if(en_down) begin\par
\tab\tab\tab if(stop) begin\par
\tab\tab\tab\tab door <= 2'b10;\par
\tab\tab\tab\tab ql <= 3'b000;\par
\tab\tab\tab end else if(close) begin\par
\tab\tab\tab\tab ql <= 3'b011;\par
\tab\tab\tab end else if(ql==3'b110) begin\par
\tab\tab\tab\tab door <= 2'b00;\par
\tab\tab\tab\tab updown <= 1'b0;\par
\tab\tab\tab\tab up <= 1'b0;\par
\tab\tab\tab\tab down <= 1'b1;\par
\tab\tab\tab end else if(ql>3'b011) begin\par
\tab\tab\tab\tab door <= 2'b01;\par
\tab\tab\tab\tab ql <= ql +1;\par
\tab\tab\tab end else begin\par
\tab\tab\tab\tab ql <= ql +1;\par
\tab\tab\tab\tab door <= 2'b10;\par
\tab\tab\tab end\par
\tab\tab end\par
\tab end\par
\tab if(g1) begin\par
\tab\tab led = 4'b0001;\par
\tab\tab if(k11 || up11)\tab begin\par
\tab\tab\tab k11 = 1'b0;\par
\tab\tab\tab up11 = 1'b0;\par
\tab\tab\tab opendoor = 1'b1;\par
\tab\tab end else if(uu_dd>4'b0001) begin\par
\tab\tab\tab en_up  = 1'b1;\par
\tab\tab\tab opendoor = 1'b0;\par
\tab\tab end else if(uu_dd==4'b0000) begin\par
\tab\tab\tab opendoor = 1'b0;\par
\tab\tab end\par
\tab end else if(g2) begin\par
\tab\tab led = 4'b0010;\par
\tab\tab if(updown) begin\par
\tab\tab\tab if(k22 || up22)\tab begin\par
\tab\tab\tab\tab k22 = 1'b0;\par
\tab\tab\tab\tab up22 = 1'b0;\par
\tab\tab\tab\tab opendoor = 1'b1;\par
\tab\tab\tab end else if(uu_dd>4'b0011) begin\par
\tab\tab\tab\tab en_up = 1'b1;\par
\tab\tab\tab\tab opendoor = 1'b0;\par
\tab\tab\tab end else if(uu_dd<4'b0010)begin\par
\tab\tab\tab\tab en_down = 1'b1;\par
\tab\tab\tab\tab opendoor = 1'b0;\par
\tab\tab\tab end\par
\tab\tab end else begin\par
\tab\tab\tab if(k22 || down22) begin\par
\tab\tab\tab\tab k22 = 1'b0;\par
\tab\tab\tab\tab down22 = 1'b0;\par
\tab\tab\tab\tab opendoor = 1'b1;\par
\tab\tab\tab end else if(uu_dd<4'b0010) begin\par
\tab\tab\tab\tab en_down = 1'b1;\par
\tab\tab\tab\tab opendoor = 1'b0;\par
\tab\tab\tab end else if(uu_dd>4'b0011) begin\par
\tab\tab\tab\tab en_up = 1'b1;\par
\tab\tab\tab\tab opendoor = 1'b0;\tab\par
\tab\tab\tab end\par
\tab\tab end\par
\tab end else if(g3) begin\par
\tab\tab led = 4'b0100;\par
\tab\tab if(updown) begin\par
\tab\tab\tab if(k33 || up33)\tab begin\par
\tab\tab\tab\tab k33 = 1'b0;\par
\tab\tab\tab\tab up33 = 1'b0;\par
\tab\tab\tab\tab opendoor = 1'b1;\par
\tab\tab\tab end else if(uu_dd>4'b0111) begin\par
\tab\tab\tab\tab en_up = 1'b1;\par
\tab\tab\tab\tab opendoor = 1'b0;\par
\tab\tab\tab end else if(uu_dd<4'b0100)begin\par
\tab\tab\tab\tab en_down = 1'b1;\par
\tab\tab\tab\tab opendoor = 1'b0;\par
\tab\tab\tab end\par
\tab\tab end else begin\par
\tab\tab\tab if(k33 || down33) begin\par
\tab\tab\tab\tab k33 = 1'b0;\par
\tab\tab\tab\tab down33 = 1'b0;\par
\tab\tab\tab\tab opendoor = 1'b1;\par
\tab\tab\tab end else if(uu_dd<4'b0100) begin\par
\tab\tab\tab\tab en_down = 1'b1;\par
\tab\tab\tab\tab opendoor = 1'b0;\par
\tab\tab\tab end else if(uu_dd>4'b0111) begin\par
\tab\tab\tab\tab en_up = 1'b1;\par
\tab\tab\tab\tab opendoor = 1'b0;\tab\par
\tab\tab\tab end\par
\tab\tab end\par
\tab end else if(g4) begin\par
\tab\tab led = 4'b1000;\par
\tab\tab if(k44 || down44) begin\par
\tab\tab\tab k44 = 1'b0;\par
\tab\tab\tab down44 = 1'b0;\par
\tab\tab\tab opendoor = 1'b1;\par
\tab\tab end else if(uu_dd<4'b1000) begin\par
\tab\tab\tab en_down = 1'b1;\par
\tab\tab\tab opendoor = 1'b0;\par
\tab\tab end\par
\tab end else begin\par
\tab\tab en_up = 1'b0;\par
\tab\tab en_down = 1'b0;\par
\tab end\par
end\par
endmodule\par
}
 