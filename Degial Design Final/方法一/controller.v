{\rtf1\ansi\ansicpg950\deff0\nouicompat\deflang1033\deflangfe1028{\fonttbl{\f0\fnil\fcharset0 Calibri;}{\f1\fnil\fcharset136 Calibri;}}
{\*\generator Riched20 10.0.10240}\viewkind4\uc1 
\pard\nowidctlpar\sl360\slmult1\qj\kerning2\f0\fs24 module control(\par
clk, reset, result_Con, consignal, sel_Con, up_Floor, down_Floor, ok, up_d, stop_r, rst, ok_Count);\par
parameter S0=4'b0000, S1=4'b0001, S2=4'b0010, S3=4'b0011, S4=4'b0100, S5=4'b0101, S6=4'b0110, S7=4'b0111, S8=4'b1000, S9=4'b1001, S10=4'b1010, S11=4'b1011, S12=4'b1100, S13=4'b1101, S14=4'b1110;\par
input clk, reset, result_Con, consignal;\par
output [1:0] sel_Con;\par
output up_Floor, down_Floor, ok, up_d, stop_r, rst, ok_Count;\par
reg [1:0] sel_Con;\par
reg up_Floor, down_Floor, ok, up_d, stop_r, rst, ok_Count;\par
reg[3:0] state;\par
always @ (posedge clk or negedge reset) begin\par
\tab if(!reset)\par
\tab\tab state<=S0;\par
\tab else  begin\par
\tab\tab case(state)\par
\tab\tab S0:state<=S1;\par
\tab\tab S1: \par
\tab\tab    if (result_Con)\par
\tab\tab\tab state<=S3;\par
\tab\tab    else\par
\tab\tab\tab state<=S2;\par
\tab\tab S2:\par
\tab\tab    if(result_Con)\par
\tab\tab\tab state<=S9;\par
\tab\tab    else\par
\tab\tab\tab state<=S1;\par
\tab\tab S3:\par
\tab\tab\tab state<=S4;\par
\tab\tab S4:\par
\tab\tab    if(consignal) begin\par
\tab\tab\tab state<=S5;\par
\tab\tab    end else\par
\tab\tab\tab state<=S4;\par
\tab\tab S5:\par
\tab\tab\tab state<=S6;\par
\tab\tab S6:\par
\tab\tab    if(result_Con)\par
\tab\tab\tab state<=S8;\par
\tab\tab    else\par
\tab\tab\tab state<=S7;\par
\tab\tab S7:\par
\tab\tab    if(result_Con)\par
\tab\tab\tab state<=S4;\par
\tab\tab    else\par
\tab\tab\tab state<=S8;\par
\tab\tab S8:\par
\tab\tab    if(consignal) begin\par
\tab\tab\tab state<=S1;\par
\tab    \tab    end else\par
\tab\tab    \tab state<=S8;\par
\tab\tab S9:\par
\tab\tab\tab state<=S10;\par
\tab\tab S10:\par
\tab\tab    if(consignal) begin\par
\tab\tab\tab state<=S11;\par
\tab\tab    end else\par
\tab\tab\tab state<=S10;\par
\tab\tab S11:\par
\tab\tab\tab state<=S12;\par
\tab\tab S12:\par
\tab\tab    if(result_Con)\par
\tab\tab\tab state<=S14;\par
\tab\tab    else\par
\tab\tab\tab state<=S13;\par
\tab\tab S13:\par
\tab\tab    if(result_Con)\par
\tab\tab\tab state<=S10;\par
\tab\tab    else\par
\tab\tab\tab state<=S14;\par
\tab\tab S14:\par
\tab\tab    if(consignal) begin\par
\tab\tab\tab state<=S2;\par
\tab\tab    end else\par
\tab\tab    \tab state<=S14;\par
\tab\tab endcase\par
\tab end\par
end\par
always @ (state) begin\par
\tab case(state)\par
\tab S0: begin\par
\tab\tab rst<=1;\par
\tab end\par
\tab S1: begin\par
\tab\tab ok<=1;\par
\tab\tab rst<=0;\par
\tab\tab ok_Count<=0;\par
\tab\tab sel_Con<=2'b00;\par
\tab end\par
\tab S2: begin\par
\tab     \tab ok<=1;\par
\tab\tab ok_Count<=0;\par
\tab\tab sel_Con<=2'b01;\par
\tab end\par
\tab S3: begin\par
\tab\tab up_d<=0;\par
\tab\tab stop_r<=1;\par
\tab\tab ok<=0;\par
\tab end\par
\tab S4: begin\par
\tab\tab ok_Count<=1;\par
\tab end\par
\tab S5: begin\par
\tab\tab ok_Count<=0;\par
\tab\tab up_Floor<=1;\par
\tab end\par
\tab S6: begin\par
\tab\tab up_Floor<=0;\par
\tab\tab sel_Con<=2'b10;\par
\tab end\par
\tab S7: begin\par
\tab\tab sel_Con<=2'b00;\par
\tab end\par
\tab S8: begin\par
\tab\tab ok<=1;\par
\tab\tab stop_r<=0;\par
\tab\tab ok_Count<=1;\par
\tab end\par
\tab S9: begin\par
\tab\tab up_d<=1;\par
\tab\tab stop_r<=1;\par
\tab\tab ok<=0;\par
\tab end\par
\tab S10: begin\par
\tab\tab ok_Count<=1;\par
\tab end\par
\tab S11: begin\par
\tab\tab ok_Count<=0;\tab\par
\tab\tab down_Floor<=1;\par
\tab end\tab\par
\tab S12: begin\par
\tab\tab down_Floor<=0;\par
\tab\tab sel_Con<=2'b11;\par
\tab end\par
\tab S13: begin\par
\tab\tab sel_Con<=2'b01;\tab\par
\tab end\par
\tab S14: begin\par
\tab\tab ok<=1;\par
\tab\tab stop_r<=0;\par
\tab\tab ok_Count<=1;\par
\tab end\par
\tab endcase\tab\par
end\par

\pard\sa200\sl276\slmult1 endmodule\kerning0\f1\fs22\lang1028\par
}
 