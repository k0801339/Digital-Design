{\rtf1\ansi\ansicpg950\deff0\nouicompat\deflang1033\deflangfe1028{\fonttbl{\f0\fnil\fcharset0 Calibri;}}
{\*\generator Riched20 10.0.10240}\viewkind4\uc1 
\pard\nowidctlpar\sl360\slmult1\qj\kerning2\f0\fs24\lang1024 module outdoor_call( set_call, rst, cur_Floor, ok, get_call );\par
\tab input [5:0] set_call;\par
\tab input [2:0] cur_Floor;\par
\tab input rst,ok;\par
\tab output [5:0] get_call;\par
\tab reg [5:0] get_call;\par
\tab always @ (rst or ok or set_call[0] or cur_Floor) begin\tab //U1\par
\tab\tab if(rst==1)\par
\tab\tab\tab get_call[0]=0;\par
\tab\tab else if(set_call[0]==0) begin\par
\tab\tab    if(ok==0 || cur_Floor!=1)\par
\tab\tab\tab get_call[0]=1;\par
\tab\tab else\par
\tab\tab    get_call[0]=0;\par
\tab\tab end else begin\par
\tab\tab    if(ok==1 && cur_Floor==1)\par
\tab\tab\tab get_call[0]=0;\par
\tab\tab end\par
\tab end\par
\tab always @ (rst or ok or set_call[1] or cur_Floor) begin\par
\tab\tab if(rst==1)\par
\tab\tab\tab get_call[1]=0;\par
\tab\tab else if (set_call[1]==0) begin\par
\tab\tab    if(ok==0||cur_Floor!=2)\par
\tab\tab\tab get_call[1]=1;\par
\tab\tab    else\par
\tab\tab\tab get_call[1]=0;\par
\tab\tab end else begin\par
\tab\tab    if(ok==1&&cur_Floor==2)\par
\tab\tab\tab get_call[1]=0;\par
\tab\tab end\par
\tab end\par
\tab always @ (rst or ok or set_call[2] or cur_Floor) begin\par
\tab\tab if(rst==1)\par
\tab\tab\tab get_call[2]=0;\par
\tab\tab else if (set_call[2]==0) begin\par
\tab\tab    if(ok==0 || cur_Floor!=2)\par
\tab\tab\tab get_call[2]=1;\par
\tab\tab    else\par
\tab\tab\tab get_call[2]=0;\par
\tab\tab end else begin\par
\tab\tab    if(ok==1 && cur_Floor==2)\par
\tab\tab\tab get_call[2]=0;\par
\tab\tab end\par
\tab end\par
\tab always @ ( rst or ok or  set_call[3] or cur_Floor) begin\par
\tab\tab if(rst==1)\par
\tab\tab\tab get_call[3]=0;\par
\tab\tab else if (set_call[3]==0) begin\par
\tab\tab    if(ok==0 || cur_Floor!=3)\par
\tab\tab\tab get_call[3]=1;\par
\tab\tab    else\par
\tab\tab\tab get_call[3]=0;\par
\tab\tab end else begin\par
\tab\tab    if(ok==1 && cur_Floor==3)\par
\tab\tab\tab get_call[3]=0;\par
\tab\tab end\par
\tab end\tab\par
\tab always @ ( rst or ok or set_call[4] or cur_Floor) begin\par
\tab\tab if(rst==1)\par
\tab\tab\tab get_call[4]=0;\par
\tab\tab else if (set_call[4]==0) begin\par
\tab\tab    if(ok==0||cur_Floor!=3)\par
\tab\tab\tab get_call[4]=1;\par
\tab\tab    else\par
\tab\tab\tab get_call[4]=0;\par
\tab\tab end else begin\par
\tab\tab    if(ok==1&&cur_Floor==3)\par
\tab\tab\tab get_call[4]=0;\par
\tab\tab end\par
\tab end\tab\par
\tab always @ ( rst or ok or set_call[5] or cur_Floor) begin\tab //D4\par
\tab\tab if(rst==1)\par
\tab\tab\tab get_call[5]=0;\par
\tab\tab else if (set_call[5]==0) begin\par
\tab\tab    if(ok==0||cur_Floor!=4)\par
\tab\tab\tab get_call[5]=1;\par
\tab\tab    else\par
\tab\tab\tab get_call[5]=0;\par
\tab\tab end else begin\par
\tab\tab    if(ok==1&&cur_Floor==4)\par
\tab\tab\tab get_call[5]=0;\par
\tab\tab end\par
\tab end\tab\par
\tab /*always @ ( rst or ok or set_call[6] or cur_Floor)\par
\tab begin\par
\tab\tab if(rst==1)\par
\tab\tab\tab get_call[6]=0;\par
\tab\tab else if(set_call[6]==0)\par
\tab\tab begin\par
\tab\tab if(ok==0||cur_Floor!=4)\par
\tab\tab\tab get_call[6]=1;\par
\tab\tab else\par
\tab\tab\tab get_call[6]=0;\par
\tab\tab end\par
\tab\tab else \par
\tab\tab begin\par
\tab\tab\tab if(ok==1&&cur_Floor==4)\par
\tab\tab\tab get_call[6]=0;\par
\tab\tab end\par
\tab end\tab\par
\tab always @ ( rst or ok or set_call[7] or cur_Floor)\par
\tab begin\par
\tab\tab if(rst==1)\par
\tab\tab\tab get_call[7]=0;\par
\tab\tab else if(set_call[7]==0)\par
\tab\tab begin\par
\tab\tab if(ok==0||cur_Floor!=5)\par
\tab\tab\tab get_call[7]=1;\par
\tab\tab else\par
\tab\tab\tab get_call[7]=0;\par
\tab\tab end\par
\tab\tab else \par
\tab\tab begin\par
\tab\tab\tab if(ok==1&&cur_Floor==5)\par
\tab\tab\tab get_call[7]=0;\par
\tab\tab end\par
\tab end*/\tab\par

\pard\sa200\sl276\slmult1 endmodule\kerning0\fs22\lang1028\par
}
 