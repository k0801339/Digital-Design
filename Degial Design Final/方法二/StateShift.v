{\rtf1\ansi\ansicpg950\deff0\nouicompat\deflang1033\deflangfe1028{\fonttbl{\f0\fnil\fcharset136 \'b7\'73\'b2\'d3\'a9\'fa\'c5\'e9;}}
{\*\generator Riched20 10.0.10240}\viewkind4\uc1 
\pard\nowidctlpar\qj\kerning2\f0\fs21 module StateShift(PosOut, DoorFlag, UpDnFlag, LiftState, clk, reset, F1Up, F2Up, F3Up, F2Dn, F3Dn, F4Dn, F1Stop, F2Stop, F3Stop, F4Stop);\par
    output [3:0] PosOut;\par
    output DoorFlag;\par
    output [1:0] UpDnFlag;\par
    output [6:0] LiftState;\par
    input clk, reset,F1Up,F2Up,F3Up,F2Dn,F3Dn,F4Dn,F1Stop,F2Stop,F3Stop,F4Stop;\par
\tab //pos\'bb\'50Posout\'aa\'ba\'c3\'f6\'ab\'59:\'b7\'ed\'ab\'65\'aa\'ac\'ba\'41\'a4\'40\'a7\'ef\'c5\'dc,pos\'a5\'df\'a7\'59\'a7\'40\'ac\'db\'c0\'b3\'a7\'ef\'c5\'dc,\'a6\'d3PosOut\'ab\'68\'ac\'4f\'b7\'ed\'ab\'65\'aa\'ac\'ba\'41\'a6\'62\'ad\'6e\'c5\'dc\'a8\'ec\'a4\'55\'a4\'40\'aa\'ac\'ba\'41\'aa\'ba\'c0\'fe\'b6\'a1\par
\tab //,\'b1\'4ePosOut\'a7\'40\'ac\'db\'c0\'b3\'a7\'ef\'c5\'dc\'a1\'43\'a6\'70\'b1\'71WAIT\'a4\'c1\'b4\'ab\'a8\'ec\'b2\'c4\'a4\'40\'ad\'d3UP\'ae\'c9\'a1\'41pos\'a5\'df\'a7\'59\'a5\'5b\'a4\'40\'a1\'41\'a6\'d3PosOut\'ab\'68\'ad\'6e\'b5\'a5\'a8\'ec\'b2\'c4\'a4\'40\'ad\'d3UP\par
\tab //\'a7\'59\'b1\'4e\'a4\'c1\'b4\'ab\'a8\'ec\'b2\'c4\'a4\'47\'ad\'d3UP\'ae\'c9\'a1\'41\'a4\'7e\'a5\'5b\'a4\'40\'a1\'43\par
    reg [3:0] pos, PosOut;\par
    reg[2:0] count;//\'aa\'f9\'b6\'7d\'ab\'e1\'ad\'6e\'ab\'f9\'c4\'f25\'ad\'d3\'ae\'c9\'c4\'c1\'b6\'67\'b4\'c1,\'a5\'cecount\'a8\'d3\'ad\'70\'bc\'c6\par
    reg DoorFlag;\par
    reg [1:0] UpDnFlag;\par
    reg [6:0] LiftState, NextState;//\'a4\'c0\'a7\'4f\'aa\'ed\'a5\'dc\'b9\'71\'b1\'e8\'aa\'ba\'b7\'ed\'ab\'65\'aa\'ac\'ba\'41\'a9\'4d\'a4\'55\'a4\'40\'aa\'ac\'ba\'41\par
\par
\tab //UpReq,DownReq,StopReq\'a4\'c0\'a7\'4f\'a5\'ce\'a8\'d3\'a6\'58\'a8\'d6\'a6\'56\'a4\'57\'bd\'d0\'a8\'44\'aa\'ba\'a6\'55\'ab\'48\'b8\'b9\'a1\'41\'a6\'56\'a4\'55\'bd\'d0\'a8\'44\'aa\'ba\'a6\'55\'ab\'48\'b8\'b9\'a9\'4d\'b0\'b1\'be\'61\'bd\'d0\'a8\'44\'aa\'ba\'a6\'55\'ab\'48\'b8\'b9\par
\tab //\'a5\'48\'ab\'4b\'a7\'50\'c2\'5f\'b9\'71\'b1\'e8\'a6\'62\'aa\'ac\'ba\'41\'b6\'a1\'a6\'70\'a6\'f3\'c2\'e0\'b2\'be\'ae\'c9\'a7\'f3\'c2\'b2\'bc\'e4\par
   \tab reg [3:0] UpReq, DownReq, StopReq;\par
\tab //\'a9\'77\'b8\'71\'b9\'71\'b1\'e87\'ba\'d8\'aa\'ac\'ba\'41\'aa\'ba\'b2\'c5\'b8\'b9\'b1\'60\'b6\'71\par
    parameter WAIT=7'b0000001, UP=7'b0000010, DOWN=7'b0000100, UPSTOP=7'b0001000\par
    , DOWNSTOP=7'b0010000, OPENDOOR=7'b0100000, CLOSEDOOR=7'b1000000;\par
\tab //\'a9\'77\'b8\'71\'bc\'d3\'bc\'68\'aa\'ba\'b2\'c5\'b8\'b9\'b1\'60\'b6\'71\par
    parameter FLOOR1=4'b0001, FLOOR2=4'b0010, FLOOR3=4'b0100, FLOOR4=4'b1000;\par
    parameter TRUE=1'b1, FALSE=1'b0;\par
\tab //\'a9\'77\'b8\'71\'aa\'f9\'a5\'b4\'b6\'7d\'a9\'4d\'aa\'f9\'c3\'f6\'b3\'ac\'aa\'ba\'b2\'c5\'b8\'b9\'b1\'60\'b6\'71\par
    parameter OPEN=1'b1, CLOSED=1'b0;\par
\tab //\'a9\'77\'b8\'71\'b9\'71\'b1\'e8\'a4\'57\'a4\'c9\'a1\'41\'a4\'55\'ad\'b0\'a9\'4d\'c0\'52\'a4\'ee\'aa\'ba\'b2\'c5\'b8\'b9\'b1\'60\'b6\'71\par
    parameter UPFLAG=2'b\lang1028 10\lang1033 , DNFLAG=2'b\lang1028 01\lang1033 , STATIC=2'b\lang1028 00\lang1033 ;\par
    \par
\tab //\'b1\'4e\'a6\'55\'a4\'57\'a4\'c9\'bd\'d0\'a8\'44\'ab\'48\'b8\'b9\'a7\'59\'ae\'c9\'a6\'61\'a6\'58\'a8\'d6(4\'bc\'d3\'ac\'b0\'b3\'bb\'bc\'68,\'b5\'4c\'a4\'57\'a4\'c9\'bd\'d0\'a8\'44\'a1\'41\'a6\'d2\'bc\'7b\'a8\'ec\'b3\'71\'a5\'ce\'a9\'ca\'a1\'41\'b1\'4e\'b2\'c44\'a6\'ec\'b6\'f1\'b9\'73)\par
    always @(F1Up or F2Up or F3Up )\par
        UpReq=\{1'b0, F3Up, F2Up, F1Up\};          \par
\tab //\'b1\'4e\'a6\'55\'a4\'55\'ad\'b0\'bd\'d0\'a8\'44\'ab\'48\'b8\'b9\'a7\'59\'ae\'c9\'a6\'61\'a6\'58\'a8\'d6(1\'bc\'d3\'ac\'b0\'a9\'b3\'bc\'68,\'b5\'4c\'a4\'55\'ad\'b0\'bd\'d0\'a8\'44,\'a6\'d2\'bc\'7b\'a8\'ec\'b3\'71\'a5\'ce\'a9\'ca,\'b1\'4e\'b2\'c41\'a6\'ec\'b6\'f1\'b9\'73)\par
    always @(F2Dn or F3Dn or F4Dn)\par
        DownReq=\{F4Dn, F3Dn, F2Dn, 1'b0\};\par
\tab //\'b1\'4e\'a6\'55\'b0\'b1\'be\'61\'bd\'d0\'a8\'44\'ab\'48\'b8\'b9\'a7\'59\'ae\'c9\'a6\'61\'a6\'58\'a8\'d6   \par
    always @(F1Stop or F2Stop or F3Stop or F4Stop)\par
         StopReq=\{F4Stop, F3Stop, F2Stop, F1Stop\};\par
\par
\tab //1st StateShift always block,sequential state transition\par
    always @(posedge clk or negedge reset) begin\tab //\'ab\'dd\'ad\'d7\'a7\'ef: reset \'c5\'dc\'a6\'a8 negedge\par
        if(!reset)\par
            begin\par
                LiftState <= WAIT;  \par
            end\par
        else\par
            LiftState <= NextState;\par
    end\par
\tab //2nd StateShift always block,combinational condition judgement\par
    always @(LiftState or UpReq or DownReq or StopReq or pos or count or UpDnFlag) begin\par
        case(LiftState)\par
            WAIT: begin\par
               \tab if(StopReq>0)\tab begin\tab //\'a6\'b3\'b0\'b1\'be\'61\'bd\'d0\'a8\'44\'a7\'5f\par
                   \tab    if((StopReq & pos)>0)//\'b0\'b1\'be\'61\'bd\'d0\'a8\'44\'a4\'a4\'a6\'b3\'b7\'ed\'ab\'65\'bc\'d3\'bc\'68\'b0\'b1\'be\'61\'bd\'d0\'a8\'44\'a7\'5f\par
                        \tab\tab NextState = OPENDOOR;//\'a6\'b3\'b7\'ed\'ab\'65\'bc\'d3\'bc\'68\'bd\'d0\'a8\'44\'a1\'41\'ab\'68\'a4\'55\'a4\'40\'aa\'ac\'ba\'41\'c2\'e0\'b6\'7d\'aa\'f9\par
                   \tab    else if(StopReq>pos)//\'a6\'b3\'b7\'ed\'ab\'65\'bc\'d3\'bc\'68\'a4\'a7\'a4\'57\'aa\'ba\'b0\'b1\'be\'61\'bd\'d0\'a8\'44\'a7\'5f\'a1\'5d\'c0\'75\'a5\'fd\'a6\'56\'a4\'57\'aa\'ba\'bd\'d0\'a8\'44\'a1\'5e    \par
                        \tab\tab NextState = UP;//\'a6\'b3\'ab\'68\'a1\'41\'a4\'55\'a4\'40\'aa\'ac\'ba\'41\'c2\'e0\'a4\'57\'a4\'c9\par
                         \tab    else\par
                        \tab\tab NextState = DOWN;//\'a5\'75\'a6\'b3\'b7\'ed\'ab\'65\'bc\'d3\'bc\'68\'a4\'a7\'a4\'55\'aa\'ba\'b0\'b1\'be\'61\'bd\'d0\'a8\'44\'a1\'41\'a4\'55\'a4\'40\'aa\'ac\'ba\'41\'c2\'e0\'a4\'55\'ad\'b0\par
                \tab end\par
                \tab else if((UpReq&pos) || (DownReq&pos)) begin //\'a4\'57\'a4\'55\'bd\'d0\'a8\'44\'a4\'a4\'a6\'b3\'b7\'ed\'ab\'65\'bc\'d3\'bc\'68\'bd\'d0\'a8\'44\'a7\'5f\par
                       \tab\tab NextState=OPENDOOR;\par
                \tab end else if((UpReq>pos) || (DownReq>pos))//\'a4\'57\'a4\'55\'bd\'d0\'a8\'44\'a4\'a4\'a6\'b3\'b7\'ed\'ab\'65\'bc\'d3\'bc\'68\'a4\'a7\'a4\'57\'aa\'ba\'bd\'d0\'a8\'44\'a7\'5f\par
                       \tab\tab NextState=UP;\par
                \tab else if(UpReq || DownReq)//\'a4\'57\'a4\'55\'bd\'d0\'a8\'44\'a4\'a4\'a6\'b3\'b7\'ed\'ab\'65\'bc\'d3\'bc\'68\'a4\'a7\'a4\'55\'aa\'ba\'bd\'d0\'a8\'44\'a7\'5f\par
                       \tab\tab NextState = DOWN;\par
                \tab else\par
                       \tab\tab NextState = WAIT;//\'b5\'4c\'a5\'f4\'a6\'f3\'bd\'d0\'a8\'44\'a1\'41\'c4\'7e\'c4\'f2\'b3\'42\'a9\'f3WAIT\'bc\'d2\'a6\'a1\par
                                        \par
            end\par
            UP: begin\par
                if((StopReq&pos) || (UpReq&pos))//\'b0\'b1\'be\'61\'a9\'ce\'a4\'57\'a4\'c9\'bd\'d0\'a8\'44\'a4\'a4\'a6\'b3\'b7\'ed\'ab\'65\'bc\'d3\'bc\'68\'aa\'ba\'bd\'d0\'a8\'44\'a7\'5f\par
                       NextState = UPSTOP;//\'a6\'b3\'a1\'41\'a4\'55\'a4\'40\'aa\'ac\'ba\'41\'c2\'e0\'ac\'b0UPSTOP(\'b0\'b1\'be\'61\'ab\'e1\'ad\'6e1s\'a4\'7e\'b6\'7d\'aa\'f9,UPSTOP\'a7\'59\'ac\'b0\'b3\'6f1s\'aa\'ba\'b9\'4c\'b4\'e7\'b4\'c1)\par
                else if((StopReq>pos) || (UpReq>pos))//\'b0\'b1\'be\'61\'a9\'ce\'a4\'57\'a4\'c9\'bd\'d0\'a8\'44\'a4\'a4\'a6\'b3\'b7\'ed\'ab\'65\'bc\'d3\'bc\'68\'a4\'a7\'a4\'57\'aa\'ba\'bd\'d0\'a8\'44\'a7\'5f\par
                       NextState = UP;\par
                else if(DownReq>0) begin //\'a6\'b3\'a4\'55\'ad\'b0\'bd\'d0\'a8\'44\'a7\'5f\par
                       if((DownReq>pos) && ((DownReq^pos)>pos))//\'a4\'55\'ad\'b0\'bd\'d0\'a8\'44\'a4\'a4\'a6\'b3\'b7\'ed\'ab\'65\'bc\'d3\'bc\'68\'aa\'ba\'bd\'d0\'a8\'44\'a7\'5f\par
                              NextState=UP;\par
                       else if((DownReq&pos)||(pos<FLOOR4)) //\'a8\'e4\'b9\'ea\'b3\'6f\'bc\'cb\'b0\'b5\'b7\'4e\'b8\'71\'a4\'a3\'a4\'6a\'a1\'41\'a5\'75\'ac\'4f\'a8\'cf\'a4\'57\'a4\'55\'bc\'d0\'bb\'78\'b4\'a3\'ab\'65\'c5\'dc\'a4\'c6\par
                              NextState=UPSTOP;\par
                       else if((DownReq&pos)&&(pos==FLOOR4))//\'a8\'c6\'b9\'ea\'a4\'57\'a4\'a3\'ba\'a1\'a8\'ac\'b2\'c4\'a4\'40\'b1\'f8\'a5\'f3\'aa\'ba\'b8\'dc\'a1\'41\'b9\'71\'b1\'e8\'ae\'da\'a5\'bb\'a4\'a3\'b7\'7c\'a8\'ec\'b9\'46\'b2\'c4\'a5\'7c\'bc\'68\par
                              NextState=DOWNSTOP;\par
                       else//\'a4\'55\'ad\'b0\'bd\'d0\'a8\'44\'a4\'a4\'a5\'75\'a6\'b3\'b7\'ed\'ab\'65\'bc\'d3\'bc\'68\'a4\'a7\'a4\'55\'aa\'ba\'bd\'d0\'a8\'44\par
                              NextState=DOWN;\par
                end else if(StopReq || UpReq)//\'a5\'75\'a6\'b3\'b7\'ed\'ab\'65\'bc\'d3\'bc\'68\'a4\'a7\'a4\'57\'aa\'ba\'b0\'b1\'be\'61\'a9\'ce\'a4\'57\'a4\'c9\'bd\'d0\'a8\'44\'a7\'5f\par
                       NextState=DOWN;\par
                else\par
                       NextState=WAIT;//\'b5\'4c\'a5\'f4\'a6\'f3\'bd\'d0\'a8\'44\'a1\'41\'c2\'e0\'ac\'b0WAIT\'bc\'d2\'a6\'a1\par
            end\par
\tab\tab\tab //DOWN\'aa\'ba\'aa\'ac\'ba\'41\'c2\'e0\'b2\'be\'bd\'d0\'b0\'d1\'a8\'a3UP\'aa\'ba\'aa\'ac\'ba\'41\'c2\'e0\'b2\'be\par
            DOWN: begin\par
             \tab if((StopReq&pos)||(DownReq&pos))\par
                        NextState=DOWNSTOP;\par
                else  if(((StopReq&FLOOR1)<pos&&(StopReq&FLOOR1))||((StopReq&FLOOR2)<pos&&(StopReq&FLOOR2))||((StopReq&FLOOR3)<pos&&(StopReq&FLOOR3))||((StopReq&FLOOR4)<pos&&(StopReq&FLOOR4)))\par
                        NextState=DOWN;\par
                   else  if(((DownReq&FLOOR1)<pos&&(DownReq&FLOOR1))||((DownReq&FLOOR2)<pos&&(DownReq&FLOOR2))||((DownReq&FLOOR3)<pos&&(DownReq&FLOOR3))||((DownReq&FLOOR4)<pos&&(DownReq&FLOOR4)))\par
                           NextState=DOWN;\par
                   else if(UpReq>0) begin \par
if(((UpReq&FLOOR1)<pos&&(UpReq&FLOOR1))||((UpReq&FLOOR2)<pos&&(UpReq&FLOOR2))||((UpReq&FLOOR3)<pos&&(UpReq&FLOOR3))||((UpReq&FLOOR4)<pos&&(UpReq&FLOOR4)))\par
                                NextState=DOWN;\par
                   \tab\tab else if((UpReq&pos)&&(pos>FLOOR1)) \par
                                NextState=DOWNSTOP;\par
                   \tab\tab else if((UpReq&pos)&&(pos==FLOOR1))\par
                                NextState=UPSTOP;\par
                   \tab\tab else\par
                                NextState=UP;\par
                   end else if(StopReq||DownReq)\par
                          NextState=UP;\par
                   else\par
                        NextState=WAIT;\par
            end\par
\par
            UPSTOP: begin\par
             \tab\tab NextState = OPENDOOR;//\'b0\'b1\'be\'611\'ae\'c9\'c4\'c1\'b6\'67\'b4\'c1\'ab\'e1\'b6\'7d\'aa\'f9\par
            end\par
            DOWNSTOP: begin\par
                \tab NextState=OPENDOOR;//\'b0\'b1\'be\'611\'ae\'c9\'c4\'c1\'b6\'67\'b4\'c1\'ab\'e1\'b6\'7d\'aa\'f9\par
            end\par
            OPENDOOR: begin\par
                    if(count<5)//\'b6\'7d\'aa\'f9\'a4\'a3\'a8\'ac4\'b6\'67\'b4\'c1\'a1\'41\'ab\'68\'c4\'7e\'c4\'f2\'c2\'e0\'b2\'be\'a8\'ec\'b6\'7d\'aa\'f9\'aa\'ac\'ba\'41\par
                        NextState = OPENDOOR;\par
                    else\par
                        NextState = CLOSEDOOR;//\'b6\'7d\'aa\'f94\'b6\'67\'b4\'c1\'ab\'e1\'a1\'41\'c3\'f6\'aa\'f9\par
            end\par
            CLOSEDOOR: begin\par
                    if(UpDnFlag==UPFLAG) begin //\'b6\'7d\'aa\'f9\'c3\'f6\'aa\'f9\'ab\'65\'b9\'71\'b1\'e8\'ac\'4f\'b3\'42\'a9\'f3\'a4\'57\'a4\'c9\'aa\'ac\'ba\'41\'b6\'dc\par
                        if((StopReq&pos) || (UpReq&pos))//\'a4\'57\'a4\'c9\'a9\'ce\'b0\'b1\'be\'61\'bd\'d0\'a8\'44\'a4\'a4\'a6\'b3\'b7\'ed\'ab\'65\'bc\'d3\'bc\'68\'aa\'ba\'bd\'d0\'a8\'44\'a7\'5f\'a1\'41\'a6\'b3\'a5\'69\'af\'e0\'c3\'f6\'aa\'f9\'aa\'ba\'c0\'fe\'b6\'a1\'a4\'53\'a6\'b3\'b7\'73\'aa\'ba\'bd\'d0\'a8\'44\par
                                NextState=OPENDOOR;\par
                        else if((StopReq>pos) || (UpReq>pos))//\'a4\'57\'a4\'c9\'a9\'ce\'b0\'b1\'be\'61\'bd\'d0\'a8\'44\'a4\'a4\'a6\'b3\'b7\'ed\'ab\'65\'bc\'d3\'bc\'68\'a4\'a7\'a4\'57\'aa\'ba\'bd\'d0\'a8\'44\'a7\'5f\par
                                NextState=UP;\par
                         else if(DownReq>0) begin //\'a6\'b3\'a4\'55\'ad\'b0\'bd\'d0\'a8\'44\'a7\'5f\par
                                if((DownReq>pos)&&((DownReq^pos)>pos))\par
                                       NextState = UP;//\'a6\'b3\'b7\'ed\'ab\'65\'bc\'d3\'bc\'68\'a4\'a7\'a4\'57\'aa\'ba\'a4\'55\'ad\'b0\'bd\'d0\'a8\'44\'a1\'41\'ab\'68\'a4\'55\'a4\'40\'aa\'ac\'ba\'41\'c2\'e0\'b2\'be\'a4\'57\'a4\'c9\par
                                else if((DownReq&pos)>0)//\'a6\'b3\'b7\'ed\'ab\'65\'bc\'d3\'bc\'68\'aa\'ba\'a4\'55\'ad\'b0\'bd\'d0\'a8\'44\'ab\'48\'b8\'b9\'a1\'41\'a5\'42\'a7\'f3\'a4\'57\'bc\'68\'b5\'4c\'a4\'55\'ad\'b0\'bd\'d0\'a8\'44\par
                                        NextState = OPENDOOR;\par
                                else//\'a5\'75\'a6\'b3\'a7\'43\'a9\'f3\'b7\'ed\'ab\'65\'bc\'68\'aa\'ba\'a4\'55\'ad\'b0\'bd\'d0\'a8\'44\par
                                        NextState=DOWN;\par
                         end else if(StopReq||UpReq)//\'a4\'57\'a4\'c9\'a9\'4d\'b0\'b1\'be\'61\'bd\'d0\'a8\'44\'a4\'a4\'a6\'b3\'b7\'ed\'ab\'65\'bc\'68\'aa\'ba\'bd\'d0\'a8\'44\'a5\'42\'a5\'75\'a6\'b3\'b7\'ed\'ab\'65\'bc\'68\'a4\'55\'aa\'ba\'bd\'d0\'a8\'44\par
                                NextState=DOWN;\par
                         else\par
                                NextState=WAIT;//\'b5\'4c\'a5\'f4\'a6\'f3\'bd\'d0\'a8\'44\'a1\'41\'c2\'e0\'ac\'b0WAIT\'bc\'d2\'a6\'a1\par
                    end else if(UpDnFlag==DNFLAG) begin //\'bd\'d0\'b0\'d1\'a6\'d2UpDnFlag=UPFLAG\'aa\'ba\'aa\'60\'c4\'c0\tab\tab\tab\tab\tab\par
                         if((StopReq&pos)||(DownReq&pos))\par
                                NextState=OPENDOOR;\par
                         else  if(((StopReq&FLOOR1)<pos&&(StopReq&FLOOR1))||((StopReq&FLOOR2)<pos&&(StopReq&FLOOR2))||((StopReq&FLOOR3)<pos&&(StopReq&FLOOR3))||((StopReq&FLOOR4)<pos&&(StopReq&FLOOR4)))\par
                                NextState=DOWN;\par
                         else  if(((DownReq&FLOOR1)<pos&&(DownReq&FLOOR1))||((DownReq&FLOOR2)<pos&&(DownReq&FLOOR2))||((DownReq&FLOOR3)<pos&&(DownReq&FLOOR3))||((DownReq&FLOOR4)<pos&&(DownReq&FLOOR4)))\par
                                NextState=DOWN;\par
                         else if(UpReq>0) begin \par
if(((UpReq&FLOOR1)<pos&&(UpReq&FLOOR1))||((UpReq&FLOOR2)<pos&&(UpReq&FLOOR2))||((UpReq&FLOOR3)<pos&&(UpReq&FLOOR3))||((UpReq&FLOOR4)<pos&&(UpReq&FLOOR4)))\par
                                \tab\tab NextState=DOWN;\par
                         \tab\tab else if((UpReq&pos)>0)\par
                                        NextState=OPENDOOR;\par
                                else\par
                                        NextState=UP;//\par
                          end else if(StopReq||DownReq)\par
                                   NextState=UP;\par
                          else\par
                                NextState=WAIT;//\par
                    end\par
\par
\tab\tab\tab\tab\tab //\'bd\'d0\'b0\'d1\'a6\'d2WAIT\'bc\'d2\'a6\'a1\'aa\'ba\'aa\'60\'c4\'c0\par
                    else begin\par
                            if(StopReq>0) begin\par
                                    if((StopReq&pos)>0)\par
                                        NextState=OPENDOOR;\par
                                    else if(StopReq>pos)\par
                                        NextState=UP;\par
                                    else \par
                                        NextState=DOWN;\par
                            end else if begin ((UpReq&pos)||(DownReq&pos))\par
                                    NextState=OPENDOOR;\par
                            end else if((UpReq>pos)||(DownReq>pos))\par
                                NextState=UP;\par
                            else if(UpReq||DownReq)\par
                                NextState=DOWN;                           \par
                            else begin\par
                                    NextState=WAIT;\par
                            end\par
                                        \par
                    end\par
\par
                end\par
                default:\par
                    NextState=WAIT;\par
\par
        endcase\par
    end       \par
\tab //3rd StateShift always block,the sequential FSM output\par
    always @(posedge clk or negedge reset) begin//output\par
        if(!reset) //\'b4\'5f\'a6\'ec\'ab\'e1\'aa\'ec\'a9\'6c\'a4\'c6\'b7\'ed\'ab\'65\'bc\'d3\'bc\'68\'ac\'b0\'b2\'c4\'a4\'40\'bc\'68,\'aa\'f9\'ac\'4f\'c3\'f6\'b3\'ac\'aa\'ba,\'b9\'71\'b1\'e8\'ac\'4f\'c0\'52\'a4\'ee\'aa\'ba\par
            begin\par
                pos<=FLOOR1;\par
                DoorFlag<=CLOSED;\par
                UpDnFlag<=STATIC;\par
            end\par
        else        \par
            begin\par
                PosOut<=pos;//PosOut\'aa\'ba\'bf\'e9\'a5\'58\'ba\'43pos\'a4\'40\'ad\'d3\'ae\'c9\'c4\'c1\'b6\'67\'b4\'c1\par
            case(NextState)\par
                WAIT:\par
\tab\tab\tab\tab\tab //\'aa\'ac\'ba\'41\'ac\'b0WAIT\'ae\'c9,\'bc\'d3\'bc\'68\'a4\'a3\'c5\'dc,\'aa\'f9\'ac\'4f\'c3\'f6\'b3\'ac\'aa\'ba,\'b9\'71\'b1\'e8\'ac\'4f\'c0\'52\'a4\'ee\'aa\'ba,\'a8\'e4\'a5\'4c\'bc\'d2\'a6\'a1\'aa\'ba\'b1\'a1\'aa\'70\'bd\'d0\'a4\'6a\'ae\'61\'a6\'db\'a4\'76\'b1\'c0\'be\'c9\par
                    begin\par
                        pos<=pos;\par
                        DoorFlag<=CLOSED;\par
                        UpDnFlag<=STATIC;\par
                     end\par
                UP:\par
                    begin\par
                        pos <= pos<<1;\par
                        DoorFlag<=CLOSED;\par
                        UpDnFlag<=UPFLAG;\par
                    end\par
                DOWN:\par
                    begin\par
                        pos <= pos>>1;\par
                        DoorFlag<=CLOSED;\par
                        UpDnFlag<=DNFLAG;\par
                    end\par
                UPSTOP:\par
                    begin\par
                        pos<=pos;\par
                        DoorFlag<=CLOSED;\par
                        UpDnFlag<=UPFLAG;\par
                    end\par
                DOWNSTOP:\par
                   begin\par
                        pos<=pos;\par
                        DoorFlag<=CLOSED;\par
                        UpDnFlag<=DNFLAG;\par
                   end\par
                OPENDOOR:\par
                    begin\par
                        pos<=pos;\par
                        DoorFlag<=OPEN;\par
                        UpDnFlag<=UpDnFlag;\par
                  \tab end\par
                CLOSEDOOR:\par
                    begin\par
                        pos<=pos;\par
                        DoorFlag<=CLOSED;\par
                        UpDnFlag<=UpDnFlag;\par
                end\par
                default:\par
\tab\tab\tab\tab\tab //\'b9\'77\'b3\'5d\'b1\'a1\'aa\'70\par
                    begin\par
                        pos<=FLOOR1;\par
                       \tab DoorFlag<=CLOSED;\par
                     \tab UpDnFlag<=STATIC;\par
                    end\par
            endcase\par
        end\par
\tab end\par
\par
    always @(posedge clk or negedge reset) begin\par
        if(!reset)\par
            count<=0;\par
        else if((NextState==OPENDOOR)&&(count<5))//or else if(NextState==OPENDOOR)\par
            count<=count+1;//\'a6\'70\'aa\'47\'ad\'70\'bc\'c6\'a4\'a3\'a8\'ec4\'a5\'42\'a4\'55\'a4\'40\'aa\'ac\'ba\'41\'ac\'b0OPENDOOR\'aa\'ba\'b8\'dc,\'c4\'7e\'c4\'f2\'ad\'70\'bc\'c6\par
        else\par
            count<=0;//\'b2\'4d\'b9\'73,\'a5\'48\'b3\'c6\'a4\'55\'a6\'b8\'ad\'70\'bc\'c6\par
\tab end\par

\pard\sa200\sl276\slmult1 endmodule\kerning0\fs22\lang1028\par
}
 