{\rtf1\ansi\ansicpg950\deff0\nouicompat\deflang1033\deflangfe1028{\fonttbl{\f0\fnil\fcharset0 Calibri;}{\f1\fnil\fcharset136 \'b7\'73\'b2\'d3\'a9\'fa\'c5\'e9;}}
{\*\generator Riched20 10.0.10240}\viewkind4\uc1 
\pard\sa200\sl276\slmult1\kerning2\f0\fs24 module display(reset,KeyValue,up1,up2,up3,down1,down2,down3,StopFloor,DoorFlag,pos,UpDnFlag\par
\tab\tab\tab\tab ,Up1Dis,Up2Dis,Up3Dis,Dn1Dis,Dn2Dis,Dn3Dis,Stop1Dis,Stop2Dis,Stop3Dis,Stop4Dis\par
\tab\tab\tab\tab\tab ,PosDis,UpDnDis,DoorDis,SelDis,StopReq1,StopReq2,StopReq3,StopReq4);\par
\tab\tab\par
\tab //\f1\'a6\'55\'b0\'f0\'aa\'ba\'b7\'4e\'b8\'71\'a1\'41\'bd\'d0\'b0\'d1\'a8\'a3\'b3\'cc\'ab\'65\'ad\'b1\'aa\'ba\'bc\'d2\'b2\'d5\'c2\'b2\'a4\'b6\'a4\'a4\'aa\'ba\'ac\'db\'c3\'f6\'bb\'a1\'a9\'fa\f0\par
\tab output StopReq1,StopReq2,StopReq3,StopReq4;\par
\tab output Up1Dis,Up2Dis,Up3Dis,Dn1Dis,Dn2Dis,Dn3Dis,DoorDis;\par
\tab output[3:0]Stop1Dis,Stop2Dis,Stop3Dis,Stop4Dis,PosDis,UpDnDis,SelDis;\par
\tab\par
\tab input up1,up2,up3,down1,down2,down3,DoorFlag;\par
\tab input [2:0] StopFloor;\par
\tab input [1:0] UpDnFlag;\par
\tab input[3:0] pos,KeyValue;\par
\tab input reset;\par
\tab\par
\tab\par
\tab\tab\par
\tab reg Up1Dis,Up2Dis,Up3Dis,Dn1Dis,Dn2Dis,Dn3Dis,DoorDis;\par
\tab reg StopReq1,StopReq2,StopReq3,StopReq4;\par
\tab reg [3:0] Stop1Dis,Stop2Dis,Stop3Dis,Stop4Dis,PosDis,UpDnDis;\par
\tab\par
\tab wire [3:0] SelDis;\par
\tab\par
\tab //\f1\'a9\'77\'b8\'71\'a6\'55\'b1\'60\'b6\'71\'a1\'41\'a6\'55\'b1\'60\'b6\'71\'aa\'ba\'b7\'4e\'ab\'e4\'a8\'e4\'a6\'57\'a4\'77\'b2\'7b\'a1\'41\'a4\'a3\'a6\'41\'b2\'d6\'ad\'7a\f0\par
\tab parameter FLOOR1=4'b0001,FLOOR2=4'b0010,FLOOR3=4'b0100,FLOOR4=4'b1000;\par
\tab parameter OPEN=1'b1, CLOSED=1'b0;\par
\tab parameter TRUE=1'b1, FALSE=1'b0;\par
    parameter UPFLAG=2'b01,DNFLAG=2'b10,STATIC=2'b00;\par
\par
\tab assign SelDis=KeyValue;//\f1\'c5\'e3\'a5\'dc\'c1\'e4\'ad\'c8\f0\par
\tab\par
\tab always @(pos or reset)//\f1\'b9\'71\'b1\'e8\'a6\'ec\'b8\'6d\'c5\'dc\'a4\'46\'a9\'ce\'a6\'b3\'ad\'ab\'a9\'77\'ab\'48\'b8\'b9\f0\par
\tab\tab if(reset)\par
\tab\tab\tab PosDis=4'b0001;//\f1\'ad\'ab\'a9\'77\'ab\'e1\'a1\'41\'aa\'ec\'a9\'6c\'a4\'c6\'b7\'ed\'ab\'65\'ab\'48\'b8\'b9\'ac\'b0\f0 1\f1\'bc\'d3\f0\par
\tab\tab else\par
\tab\tab begin\par
\tab\tab\tab case(pos)//\f1\'b9\'71\'b1\'e8\'a6\'62\'b2\'c4\f0 i\f1\'bc\'d3\'a1\'41\f0 BCD\f1\'bc\'c6\'bd\'58\'ba\'de\'c5\'e3\'a5\'dc\f0 i\par
\tab\tab\tab\tab FLOOR1:\par
\tab\tab\tab\tab\tab PosDis=4'b0001;\par
\tab\tab\tab\tab FLOOR2:\par
\tab\tab\tab\tab\tab PosDis=4'b0010;\par
\tab\tab\tab\tab FLOOR3:\par
\tab\tab\tab\tab\tab PosDis=4'b0011;\par
\tab\tab\tab\tab FLOOR4:\par
\tab\tab\tab\tab\tab PosDis=4'b0100;\par
\tab\tab\tab\tab default:\par
\tab\tab\tab\tab\tab PosDis=4'b0001;\par
\tab\tab\tab endcase\par
\tab\tab end\par
\tab\tab\par
\tab always @(DoorFlag or reset)\par
\tab\tab if(reset)\par
\tab\tab\tab DoorDis=CLOSED;\par
\tab\tab else if(DoorFlag==OPEN)\tab\par
\tab\tab\tab DoorDis=OPEN;//DoorFlag\f1\'ac\'b0\f0 OPEN\f1\'a1\'41\'c2\'49\'ab\'47\'b5\'6f\'a5\'fa\'a4\'47\'b7\'a5\'c5\'e9\f0\par
\tab\tab else\par
\tab\tab\tab DoorDis=CLOSED;//\f1\'a7\'5f\'ab\'68\'ba\'b6\'b7\'c0\'b5\'6f\'a5\'fa\'a4\'47\'b7\'a5\'c5\'e9\f0\par
\tab\tab\tab\par
\tab always @(UpDnFlag or reset)\par
\tab\tab if(reset)\par
\tab\tab\tab UpDnDis=4'b0000;\par
\tab\tab else\par
\tab\tab begin\par
\tab\tab case(UpDnFlag)\par
\tab\tab\tab STATIC://\f1\'b9\'71\'b1\'e8\'c0\'52\'a4\'ee\f0 ,\f1\'bc\'c6\'bd\'58\'ba\'de\'c5\'e3\'a5\'dc\f0 0\par
\tab\tab\tab\tab UpDnDis=4'b0000;\par
\tab\tab\tab UPFLAG://\f1\'b9\'71\'b1\'e8\'a6\'56\'a4\'57\'b9\'42\'a6\'e6\f0 ,\f1\'bc\'c6\'bd\'58\'ba\'de\'c5\'e3\'a5\'dc\f0 1\par
\tab\tab\tab\tab UpDnDis=4'b0001;\par
\tab\tab\tab DNFLAG://\f1\'b9\'71\'b1\'e8\'a6\'56\'a4\'55\'b9\'42\'a6\'e6\f0 ,\f1\'bc\'c6\'bd\'58\'ba\'de\'c5\'e3\'a5\'dc\f0 2\par
\tab\tab\tab\tab UpDnDis=4'b0010;\par
\tab\tab\tab default://\f1\'b9\'77\'b3\'5d\'c5\'e3\'a5\'dc\f0\par
\tab\tab\tab\tab UpDnDis=4'b0000;\par
\tab\tab endcase\par
\tab\tab end\par
\tab\par
\tab //Up1Dis\f1\'aa\'ba\'bf\'e9\'a5\'58\f0 ,\f1\'ad\'ba\'a5\'fd\'b7\'ed\'b5\'4d\'ac\'4f\'ad\'ab\'a9\'77\'ab\'48\'b8\'b9\f0 ,\f1\'b5\'4d\'ab\'e1\'ac\'4f\f0 up1\f1\'bd\'d0\'a8\'44\f0 ,\f1\'c1\'d9\'a6\'b3\'ab\'68\'ac\'4f\f0\par
\tab //DoorFlag\f1\'a9\'4d\f0 UpDnFlag,\f1\'b7\'ed\f0 DoorFlag\f1\'ac\'b0\f0 1\f1\'aa\'ba\'c0\'fe\'b6\'a1\f0 ,\f1\'a6\'b9\'ae\'c9\f0 UpDnFlag\f1\'ac\'b0\f0 UPFLAG\par
\tab //\f1\'b9\'71\'b1\'e8\'a5\'69\'ac\'db\'c0\'b3\'b7\'ed\'ab\'65\'bc\'68\'aa\'ba\'ab\'48\'b8\'b9\f0 ,\f1\'a9\'d2\'a5\'48\'b7\'ed\'ab\'65\'bc\'68\'aa\'ba\'a4\'57\'a4\'c9\'bd\'d0\'a8\'44\'ad\'6e\'b2\'4d\'b1\'bc\f0 ,\f1\'a6\'5d\'a6\'b9\'a6\'b3\'a6\'70\'a4\'55\'aa\'ba\'b3\'42\'b2\'7a\f0\tab\par
\tab always @(DoorFlag or up1 or reset or UpDnFlag)\par
\tab\tab if(reset)\par
\tab\tab\tab Up1Dis=FALSE;\par
\tab\tab else if(DoorFlag && (pos==FLOOR1)&&(UpDnFlag==UPFLAG))\par
\tab\tab\tab Up1Dis=FALSE;//\f1\'b9\'71\'b1\'e8\'ac\'db\'c0\'b3\'a4\'46\'bd\'d0\'a8\'44\'ab\'48\'b8\'b9\'a1\'41\'c0\'b3\'b1\'4e\'bd\'d0\'a8\'44\'ab\'48\'b8\'b9\'b2\'4d\'b1\'bc\f0\par
\tab\tab else if(up1)\par
\tab\tab\tab Up1Dis=TRUE;//\f1\'a4\'53\'a6\'b3\'b7\'73\'aa\'ba\'bd\'d0\'a8\'44\'ab\'48\'b8\'b9\'a1\'41\'b8\'6d\'bd\'d0\'a8\'44\'ab\'48\'b8\'b9\'ac\'b0\f0 1\par
\tab\tab\tab\par
\tab //\f1\'b0\'d1\'a8\'a3\f0 Up1Dis\f1\'b3\'a1\'a4\'c0\'aa\'ba\'aa\'60\'c4\'c0\f0\tab\tab\tab\par
\tab always @(DoorFlag or up2 or reset or UpDnFlag)\par
\tab\tab if(reset)\par
\tab\tab\tab Up2Dis=FALSE;\par
\tab\tab else if(DoorFlag && (pos==FLOOR2)&&(UpDnFlag==UPFLAG))\par
\tab\tab\tab Up2Dis=FALSE;\par
\tab\tab else if(up2)\par
\tab\tab\tab Up2Dis=TRUE;\par
\tab\par
\tab //\f1\'b0\'d1\'a8\'a3\f0 Up1Dis\f1\'b3\'a1\'a4\'c0\'aa\'ba\'aa\'60\'c4\'c0\f0\tab\par
\tab always @(DoorFlag or up3 or reset or UpDnFlag)\par
\tab\tab if(reset)\par
\tab\tab\tab Up3Dis=FALSE;\par
\tab\tab else if(DoorFlag && (pos==FLOOR3)&&(UpDnFlag==UPFLAG))\par
\tab\tab\tab Up3Dis=FALSE;\par
\tab\tab else if(up3)\par
\tab\tab\tab Up3Dis=TRUE;\par
\tab\tab\tab\par
\tab //\f1\'b0\'d1\'a8\'a3\f0 Up1Dis\f1\'b3\'a1\'a4\'c0\'aa\'ba\'aa\'60\'c4\'c0\f0\par
\tab always @(DoorFlag or down1 or reset or UpDnFlag)\par
\tab\tab if(reset)\par
\tab\tab\tab Dn1Dis=FALSE;\par
\tab\tab else if(DoorFlag && (pos==FLOOR2)&&(UpDnFlag==DNFLAG))\par
\tab\tab\tab Dn1Dis=FALSE;\par
\tab\tab else if(down1)\par
\tab\tab\tab Dn1Dis=TRUE;\par
\tab\tab\par
\tab //\f1\'b0\'d1\'a8\'a3\f0 Up1Dis\f1\'b3\'a1\'a4\'c0\'aa\'ba\'aa\'60\'c4\'c0\f0\par
\tab always @(DoorFlag or down2 or reset or UpDnFlag)\par
\tab\tab if(reset)\par
\tab\tab\tab Dn2Dis=FALSE;\par
\tab\tab else if(DoorFlag && (pos==FLOOR3)&&(UpDnFlag==DNFLAG))\par
\tab\tab\tab Dn2Dis=FALSE;\par
\tab\tab else if(down2)\par
\tab\tab\tab Dn2Dis=TRUE;\par
\tab\tab\par
\tab //\f1\'b0\'d1\'a8\'a3\f0 Up1Dis\f1\'b3\'a1\'a4\'c0\'aa\'ba\'aa\'60\'c4\'c0\f0\par
\tab always @(DoorFlag or down3 or reset or UpDnFlag)\par
\tab\tab if(reset)\par
\tab\tab\tab Dn3Dis=FALSE;\par
\tab\tab else if(DoorFlag && (pos==FLOOR4)&&(UpDnFlag==DNFLAG))\par
\tab\tab\tab Dn3Dis=FALSE;\par
\tab\tab else if(down3)\par
\tab\tab\tab Dn3Dis=TRUE;\par
\tab\tab\par
\tab //\f1\'b0\'d1\'a6\'d2\f0 Up1Dis\f1\'b3\'a1\'a4\'c0\'aa\'ba\'aa\'60\'c4\'c0\f0\tab\par
\tab always @(DoorFlag or StopFloor or reset)\par
\tab\tab begin\par
\tab\tab if(reset)//\f1\'b4\'5f\'a6\'ec\f0\par
\tab\tab\tab begin\par
\tab\tab\tab\tab //\f1\'bf\'e9\'a5\'58\'a6\'dc\'bc\'c6\'bd\'58\'ba\'de\f0\par
\tab\tab\tab\tab Stop1Dis=4'b0000;\par
\tab\tab\tab\tab Stop2Dis=4'b0000;\par
\tab\tab\tab\tab Stop3Dis=4'b0000;\par
\tab\tab\tab\tab Stop4Dis=4'b0000;\par
\tab\tab\tab\tab //\f1\'bf\'e9\'a5\'58\'a6\'dc\f0 StateShift\f1\'aa\'ba\'ac\'db\'c0\'b3\'aa\'ba\'a4\'57\'a4\'c9\'bd\'d0\'a8\'44\'ba\'dd\f0\par
\tab\tab\tab\tab StopReq1=FALSE;\par
\tab\tab\tab\tab StopReq2=FALSE;\par
\tab\tab\tab\tab StopReq3=FALSE;\par
\tab\tab\tab\tab StopReq4=FALSE;\par
\tab\tab\tab end\par
\tab\tab\tab\par
\tab\tab else if(DoorFlag)\par
\tab\tab\tab begin\par
\tab\tab\tab\tab case(pos)\par
\tab\tab\tab\tab\tab FLOOR1:\par
\tab\tab\tab\tab\tab\tab //\f1\'bd\'d0\'a8\'44\'ab\'48\'b8\'b9\'b3\'51\'a6\'5e\'c0\'b3\'a1\'41\'c0\'b3\'a4\'a9\'b2\'4d\'b0\'a3\'a1\'41\'a4\'55\'a6\'50\f0\par
\tab\tab\tab\tab\tab\tab begin\par
\tab\tab\tab\tab\tab\tab Stop1Dis=4'b0000;\par
\tab\tab\tab\tab\tab\tab StopReq1=FALSE;\par
\tab\tab\tab\tab\tab\tab end\par
\tab\tab\tab\tab\tab FLOOR2:\par
\tab\tab\tab\tab\tab\tab begin\par
\tab\tab\tab\tab\tab\tab Stop2Dis=4'b0000;\par
\tab\tab\tab\tab\tab\tab StopReq2=FALSE;\par
\tab\tab\tab\tab\tab\tab end\par
\tab\tab\tab\tab\tab FLOOR3:\par
\tab\tab\tab\tab\tab\tab begin\par
\tab\tab\tab\tab\tab\tab Stop3Dis=4'b0000;\par
\tab\tab\tab\tab\tab\tab StopReq3=FALSE;\par
\tab\tab\tab\tab\tab\tab end\par
\tab\tab\tab\tab\tab FLOOR4:\par
\tab\tab\tab\tab\tab\tab begin\par
\tab\tab\tab\tab\tab\tab Stop3Dis=4'b0000;\par
\tab\tab\tab\tab\tab\tab StopReq4=FALSE;\par
\tab\tab\tab\tab\tab\tab end\par
\par
\tab\tab\tab\tab endcase\par
\par
\tab\tab\tab end\par
\tab\tab else \tab\tab\tab\par
\tab\tab\tab begin\par
\tab\tab\tab\tab case(StopFloor)\par
\tab\tab\tab\tab\tab 3'b001:\par
\tab\tab\tab\tab\tab\tab //\f1\'a6\'b3\'b7\'73\'aa\'ba\'bd\'d0\'a8\'44\'ab\'48\'b8\'b9\'a1\'41\'ac\'db\'c0\'b3\'aa\'ba\'bc\'c6\'bd\'58\'ba\'de\'c5\'e3\'a5\'dc\f0 1\f1\'a1\'41\'b0\'b1\'be\'61\'ab\'48\'b8\'b9\'bf\'e9\'a5\'58\'ba\'dd\'b8\'6d\'ac\'b0\f0 TRUE\f1\'a1\'41\'a4\'55\'a6\'50\f0\par
\tab\tab\tab\tab\tab\tab begin\par
\tab\tab\tab\tab\tab\tab Stop1Dis=4'b0001;\par
\tab\tab\tab\tab\tab\tab StopReq1=TRUE;\par
\tab\tab\tab\tab\tab\tab end\par
\tab\tab\tab\tab\tab 3'b010:\par
\tab\tab\tab\tab\tab\tab begin\par
\tab\tab\tab\tab\tab\tab Stop2Dis=4'b0001;\par
\tab\tab\tab\tab\tab\tab StopReq2=TRUE;\par
\tab\tab\tab\tab\tab\tab end\par
\tab\tab\tab\tab\tab 3'b011:\par
\tab\tab\tab\tab\tab\tab begin\par
\tab\tab\tab\tab\tab\tab Stop3Dis=4'b0001;\par
\tab\tab\tab\tab\tab\tab StopReq3=TRUE;\par
\tab\tab\tab\tab\tab\tab end\par
\tab\tab\tab\tab\tab 3'b100:\par
\tab\tab\tab\tab\tab\tab begin\par
\tab\tab\tab\tab\tab\tab Stop4Dis=4'b0001;\par
\tab\tab\tab\tab\tab\tab StopReq4=TRUE;\par
\tab\tab\tab\tab\tab\tab end\par
\tab\tab\tab\tab     \par
\par
\tab\tab\tab\tab endcase\par
\tab\tab\tab end\tab\tab\par
\tab\tab end\par
\tab\par
endmodule\par
}
 