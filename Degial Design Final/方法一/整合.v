{\rtf1\ansi\ansicpg950\deff0\nouicompat\deflang1033\deflangfe1028{\fonttbl{\f0\fnil\fcharset0 Calibri;}{\f1\fnil\fcharset136 Calibri;}}
{\*\generator Riched20 10.0.10240}\viewkind4\uc1 
\pard\nowidctlpar\sl360\slmult1\qj\kerning2\f0\fs24 module main(clk, reset, set_goal, set_call, cur_Floor, state_dir, get_goal, get_call, state_run);\par
input clk, reset;\par
input [3:0] set_goal;\par
input [7:0] set_call;\par
output reg state_dir;\par
output reg [2:0] cur_Floor;\par
output reg [3:0] get_goal;\par
output reg [7:0] get_call;\par
output reg state_Run;\par
\par
wire ok;\par
always@(posedge clk or posedge reset) begin\par
\tab\par
end\par
\par

\pard\sa200\sl276\slmult1 endmodule\kerning0\f1\fs22\lang1028\par
}
 