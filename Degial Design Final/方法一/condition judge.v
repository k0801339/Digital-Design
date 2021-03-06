{\rtf1\ansi\ansicpg950\deff0\nouicompat\deflang1033\deflangfe1028{\fonttbl{\f0\fnil\fcharset0 Calibri;}{\f1\fnil\fcharset136 Calibri;}}
{\*\generator Riched20 10.0.10240}\viewkind4\uc1 
\pard\nowidctlpar\sl360\slmult1\qj\kerning2\f0\fs24 module condition_judge( get_goal, get_call, cur_Floor, sel_condition, clk, result );\par
input [4:0] get_goal;\par
input [7:0] get_call;\par
input [1:0] sel_condition;\par
input clk;\par
input [2:0] cur_Floor;\par
output result;\par
reg result;\par
integer flag,i;\par
always @(negedge clk) begin\par
\tab case(sel_condition)\par
//judge the condition K1\par
\tab 2'b00: begin\par
\tab\tab case(cur_Floor)\par
\tab\tab\tab 3'b001: begin\par
\tab if(get_goal[1]||get_goal[2]||get_goal[3]||get_goal[4]||get_call[1]||get_call[2]||get_call[3]||get_call[4]||get_call[5]||get_call[6]||get_call[7])\par
\tab\tab\tab\tab result=1;\par
\tab\tab\tab else\par
\tab\tab\tab\tab result=0;\par
\tab\tab\tab end\par
\tab\tab\tab 3'b010: begin\par
\tab if(get_goal[2]||get_goal[3]||get_goal[4]||get_call[3]||get_call[4]||get_call[5]||get_call[6]||get_call[7])\par
\tab\tab\tab\tab result=1;\par
\tab\tab\tab else\par
\tab\tab\tab\tab result=0;\par
\tab\tab\tab end\par
\tab\tab\tab 3'b011: begin\par
\tab\tab\tab if(get_goal[3]||get_goal[4]||get_call[5]||get_call[6]||get_call[7])\par
\tab\tab\tab\tab result=1;\par
\tab\tab\tab else\par
\tab\tab\tab\tab result=0;\par
\tab\tab\tab end\par
\tab\tab\tab 3'b100: begin\par
\tab\tab\tab    if(get_goal[4]||get_call[7])\par
\tab\tab\tab\tab result=1;\par
\tab\tab\tab    else\par
\tab\tab\tab\tab result=0;\par
\tab\tab\tab end\tab\par
\tab\tab\tab default:\tab result=0;\par
\tab\tab endcase\par
\tab end\par
//judge the condition K2\par
\tab 2'b01: begin\par
\tab\tab case(cur_Floor)\par
\tab\tab\tab 3'b101: begin\par
\tab if(get_goal[0]||get_goal[1]||get_goal[2]||get_goal[3]||get_call[0]||get_call[1]||get_call[2]||get_call[3]||get_call[4]||get_call[5]||get_call[6])\par
\tab\tab\tab\tab result=1;\par
\tab\tab\tab else\par
\tab\tab\tab\tab result=0;\par
\tab\tab\tab end\par
\tab\tab\tab 3'b100:begin\par
\tab if(get_goal[0]||get_goal[1]||get_goal[2]||get_call[0]||get_call[1]||get_call[2]||get_call[3]||get_call[4])\par
\tab\tab\tab\tab result=1;\par
\tab\tab\tab else\par
\tab\tab\tab\tab result=0;\par
\tab\tab\tab end\par
\tab\tab\tab 3'b011: begin\par
\tab\tab if(get_goal[0]||get_goal[1]||get_call[0]||get_call[1]||get_call[2])\par
\tab\tab\tab\tab result=1;\par
\tab\tab\tab else\par
\tab\tab\tab\tab result=0;\par
\tab\tab\tab end\par
\tab\tab\tab 3'b010: begin\par
\tab\tab\tab    if(get_goal[0]||get_call[0])\par
\tab\tab\tab\tab result=1;\par
\tab\tab\tab    else\par
\tab\tab\tab\tab result=0;\par
\tab\tab\tab end\tab\tab\par
\tab\tab\tab default:\tab result=0;\par
\tab\tab endcase\par
\tab end\par
//judge the condition K3\par
\tab 2'b10: begin\par
\tab\tab if(cur_Floor==5)\par
\tab\tab\tab result=1;\tab\par
\tab\tab else begin\par
\tab\tab    if(get_call[2*cur_Floor-2]||get_goal[cur_Floor-1])\par
\tab\tab\tab result=1;\par
\tab\tab    else\par
\tab\tab\tab result=0;\par
\tab\tab end\par
\tab end\par
//judge the condition K4\par
\tab 2'b11: begin\par
\tab\tab if(cur_Floor==0)\par
\tab\tab result=1;\tab\par
\tab\tab else begin\par
\tab\tab    if(get_call[2*cur_Floor-3]||get_goal[cur_Floor-1])\par
\tab\tab\tab result=1;\par
        \tab\tab    else\par
\tab\tab\tab result=0;\par
\tab\tab end\par
\tab end  \par
\tab endcase      \par
end\par

\pard\sa200\sl276\slmult1 endmodule\kerning0\f1\fs22\lang1028\par
}
 