{\rtf1\ansi\ansicpg950\deff0\nouicompat\deflang1033\deflangfe1028{\fonttbl{\f0\fnil\fcharset0 Calibri;}}
{\*\generator Riched20 10.0.10240}\viewkind4\uc1 
\pard\nowidctlpar\sl360\slmult1\qj\kerning2\f0\fs24 module stop_run (rst, stop_r, out_state_run);\par
\tab input rst, stop_r;\par
\tab output out_state_run;\par
\tab reg out_state_run;\par
\tab always @(stop_r or rst) begin\par
\tab    \tab if(rst==1 || stop_r==0)\par
\tab\tab\tab out_state_run=0;\par
\tab\tab else \par
\tab\tab\tab out_state_run=1;\par
\tab end\par

\pard\sa200\sl276\slmult1 endmodule\kerning0\fs22\lang1028\par
}
 