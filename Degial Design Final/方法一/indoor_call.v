{\rtf1\ansi\ansicpg950\deff0\nouicompat\deflang1033\deflangfe1028{\fonttbl{\f0\fnil\fcharset0 Calibri;}{\f1\fnil\fcharset136 Calibri;}{\f2\fnil\fcharset136 \'b7\'73\'b2\'d3\'a9\'fa\'c5\'e9;}}
{\*\generator Riched20 10.0.10240}\viewkind4\uc1 
\pard\nowidctlpar\sl360\slmult1\qj\kerning2\f0\fs24 module indoor_call( set_goal, rst, ok, cur_Floor, get_goal );\par
\tab input [3:0] set_goal;\f1\lang1028  \lang1033\par
\tab input [2:0] cur_Floor;\par
\tab input rst, ok;\par
\tab output [3:0] get_goal;\par
\tab reg [3:0] get_goal;\par
\tab always @ (rst or ok or set_goal[0] or cur_Floor)\f2\lang1028  \f1\lang1033 begin\par
\tab\tab if(rst==1)\par
\tab\tab\tab get_\f2\lang1028 goal\f1\lang1033 [0]=0;    \par
\tab\tab else begin\par
\tab\tab    if(set_\f2\lang1028 goal\f1\lang1033 [0]==0)\f2\lang1028  \f1\lang1033 begin\par
\tab\tab        if(\f2\lang1028 ok\f1\lang1033 ==0\f2\lang1028  \f1\lang1033 ||\f2\lang1028  \f1\lang1033 cur_Floor!=1)  \par
\tab\tab\tab      get_\f2\lang1028 goal\f1\lang1033 [0]=1;\tab\tab\par
\tab\tab        else\par
\tab\tab\tab      get_\f2\lang1028 goal\f1\lang1033 [0]=0; \tab\tab\par
\tab\tab   \f2\lang1028  \f1\lang1033 end\f2\lang1028  \f1\lang1033 else begin\par
\tab\tab\f2\lang1028        \f1\lang1033 if(\f2\lang1028 ok\f1\lang1033 ==1\f2\lang1028  \f1\lang1033 &&\f2\lang1028  \f1\lang1033 cur_Floor==1) \par
\tab\tab\tab      get_\f2\lang1028 goal\f1\lang1033 [0]=0;  \par
\tab\tab    end\par
\tab     \f2\lang1028\tab\f1\lang1033 end\par
\tab end\par
\tab always @ (rst or \f2\lang1028 ok\f1\lang1033  or set_\f2\lang1028 goal\f1\lang1033 [1] or cur_Floor)\f2\lang1028  \f1\lang1033 begin\par
\tab\tab if(rst==1)\par
\tab\tab\tab get_\f2\lang1028 goal\f1\lang1033 [1]=0;\par
\tab\tab else if\f2\lang1028  \f1\lang1033 (set_\f2\lang1028 goal\f1\lang1033 [1]==0)\f2\lang1028  \f1\lang1033 begin\par
\tab\tab\f2\lang1028    \f1\lang1033 if(\f2\lang1028 ok\f1\lang1033 ==0\f2\lang1028  \f1\lang1033 ||\f2\lang1028  \f1\lang1033 cur_Floor!=2)\par
\tab\tab\tab get_\f2\lang1028 goal\f1\lang1033 [1]=1;\par
\tab\tab\f2\lang1028    \f1\lang1033 else\par
\tab\tab\tab get_\f2\lang1028 goal\f1\lang1033 [1]=0;\par
\tab\tab end\f2\lang1028  \f1\lang1033 else\f2\lang1028  \f1\lang1033 begin\par
\tab\f2\lang1028\tab    i\f1\lang1033 f(\f2\lang1028 ok\f1\lang1033 ==1\f2\lang1028  \f1\lang1033 &&\f2\lang1028  \f1\lang1033 cur_Floor==2) \par
\tab\tab\tab get_\f2\lang1028 goal\f1\lang1033 [1]=0;   \par
\tab\tab end\par
\tab end\tab\par
\tab always @ (rst or \f2\lang1028 ok\f1\lang1033  or set_\f2\lang1028 goal\f1\lang1033 [2] or cur_Floor)\f2\lang1028  \f1\lang1033 begin\par
\tab\tab if(rst==1)\par
\tab\tab\tab get_\f2\lang1028 goal\f1\lang1033 [2]=0;\par
\tab\tab else if(set_\f2\lang1028 goal\f1\lang1033 [2]==0)\f2\lang1028  \f1\lang1033 begin\par
\tab\tab\f2\lang1028    \f1\lang1033 if(\f2\lang1028 ok\f1\lang1033 ==0\f2\lang1028  \f1\lang1033 ||\f2\lang1028  \f1\lang1033 cur_Floor!=3)\par
\tab\tab\tab get_\f2\lang1028 goal\f1\lang1033 [2]=1;\par
\tab\tab\f2\lang1028    \f1\lang1033 else\par
\tab\tab\tab get_\f2\lang1028 goal\f1\lang1033 [2]=0;\par
\tab\tab end\f2\lang1028  \f1\lang1033 else begin\par
\tab\tab\f2\lang1028    \f1\lang1033 if(\f2\lang1028 ok\f1\lang1033 ==1&&cur_Floor==3)\par
\tab\tab\tab get_\f2\lang1028 goal\f1\lang1033 [2]=0;\par
\tab\tab end\par
\tab end\par
\tab always @ (rst or \f2\lang1028 ok\f1\lang1033  or set_\f2\lang1028 goal\f1\lang1033 [3] or cur_Floor)\f2\lang1028  \f1\lang1033 begin\par
\tab\tab if(rst==1)\par
\tab\tab\tab get_\f2\lang1028 goal\f1\lang1033 [3]=0;\par
\tab\tab else if\f2\lang1028  \f1\lang1033 (set_\f2\lang1028 goal\f1\lang1033 [3]==0)\f2\lang1028  \f1\lang1033 begin\par
\tab\tab\f2\lang1028    \f1\lang1033 if(\f2\lang1028 ok\f1\lang1033 ==0\f2\lang1028  \f1\lang1033 ||\f2\lang1028  \f1\lang1033 cur_Floor!=4)\par
\tab\tab\tab get_\f2\lang1028 goal\f1\lang1033 [3]=1;\par
\tab\tab\f2\lang1028    \f1\lang1033 else\par
\tab\tab\tab get_\f2\lang1028 goal\f1\lang1033 [3]=0;\par
\tab\tab end\f2\lang1028  \f1\lang1033 else begin\par
\tab\tab\f2\lang1028    \f1\lang1033 if(\f2\lang1028 ok\f1\lang1033 ==1\f2\lang1028  \f1\lang1033 &&\f2\lang1028  \f1\lang1033 cur_Floor==4)\par
\tab\tab\tab get_\f2\lang1028 goal\f1\lang1033 [3]=0;\par
\tab\tab end\par
\tab end\par
\tab\f2\lang1028 /*\f1\lang1033 always @ (rst or ce or set_dest[4] or cur_Floor)\f2\lang1028  \f1\lang1033 begin\par
\tab\tab if(rst==1)\par
\tab\tab\tab get_dest[4]=0;\par
\tab\tab else if\f2\lang1028  \f1\lang1033 (set_dest[4]==0)\f2\lang1028  \f1\lang1033 begin\par
\tab\tab\f2\lang1028    \f1\lang1033 if(ce==0||cur_Floor!=5)\par
\tab\tab\tab get_dest[4]=1;\par
\tab\tab\f2\lang1028    \f1\lang1033 else\par
\tab\tab\tab get_dest[4]=0;\par
\tab\tab end\f2\lang1028  \f1\lang1033 else begin\par
\tab\tab\f2\lang1028    \f1\lang1033 if(ce==1&&cur_Floor==5)\par
\tab\tab\tab get_dest[4]=0;\par
\tab\tab end\par
\tab end\f2\lang1028 */\f1\lang1033\par

\pard\sa200\sl276\slmult1 endmodule\kerning0\fs22\lang1028\par
}
 