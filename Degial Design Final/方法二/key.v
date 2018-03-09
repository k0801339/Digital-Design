{\rtf1\ansi\ansicpg950\deff0\nouicompat\deflang1033\deflangfe1028{\fonttbl{\f0\fnil\fcharset0 Calibri;}{\f1\fnil\fcharset136 \'b7\'73\'b2\'d3\'a9\'fa\'c5\'e9;}}
{\*\generator Riched20 10.0.10240}\viewkind4\uc1 
\pard\sa200\sl276\slmult1\kerning2\f0\fs24 module KeyProcess(k1,k2,k3,k4,k5,k6,k7,k8,up1,up2,up3,up4,down1,down2,down3,down4\par
                    ,StopFloor,person,KeyValue,confirm,reset);\par
\par
\tab //\f1\'a6\'55\'b0\'f0\'aa\'ba\'b7\'4e\'b8\'71\'a1\'41\'bd\'d0\'b0\'d1\'a8\'a3\'b3\'cc\'ab\'65\'ad\'b1\'aa\'ba\'bc\'d2\'b2\'d5\'c2\'b2\'a4\'b6\'a4\'a4\'aa\'ba\'ac\'db\'c3\'f6\'bb\'a1\'a9\'fa\f0\par
    output up1,up2,up3,up4,down1,down2,down3,down4,reset;\par
    output[2:0] StopFloor;\par
    output[3:0] person,KeyValue;\par
    output confirm;\par
   \par
    input k1,k2,k3,k4,k5,k6,k7,k8;//k7:reset,k8:confirm\par
\par
    reg up1,up2,up3,up4,down1,down2,down3,down4,confirm;\par
\tab reg[2:0] StopFloor;\par
    reg[3:0] person,KeyValue;\par
\tab wire reset;\par
\tab //\f1\'a5\'48\'a4\'55\'ac\'b0\f0 1-6\f1\'b8\'b9\'c1\'e4\'c1\'e4\'ad\'c8\'aa\'ba\'a9\'77\'b8\'71\f0\par
    reg[1:0] K1Out,K2Out,K3Out,K4Out;\par
    reg[2:0] K5Out;\par
    reg[3:0] K6Out;\par
    \par
     \par
    //\f1\'a6\'55\'b1\'60\'b6\'71\'aa\'ba\'a9\'77\'b8\'71\f0\par
    parameter TRUE=1'b1,FALSE=1'b0;\par
\tab //1-4\f1\'b8\'b9\'c1\'e4\'c1\'e4\'ad\'c8\'aa\'ba\'b1\'60\'b6\'71\'a9\'77\'b8\'71\'a1\'41\f0 IDLE1\f1\'a5\'4e\'aa\'ed\'b5\'4c\'bd\'d0\'a8\'44\'a1\'41\f0 UP\f1\'a1\'41\f0 DOWN\f1\'a4\'c0\'a7\'4f\'a5\'4e\'aa\'ed\'a6\'b3\'a4\'57\'a4\'c9\'a9\'4d\'a4\'55\'ad\'b0\'aa\'ba\'bd\'d0\'a8\'44\f0\par
    parameter IDLE1=2'b00,UP=2'b01,DOWN=2'b10;\par
\tab //5\f1\'b8\'b9\'c1\'e4\'c1\'e4\'ad\'c8\'aa\'ba\'a9\'77\'b8\'71\f0 ,IDLE2\f1\'a5\'4e\'aa\'ed\'b5\'4c\'bd\'d0\'a8\'44\'a1\'41\f0 FLOORi\f1\'a1\'5d\f0 i=1-4\f1\'a1\'5e\'a4\'c0\'a7\'4f\'a5\'4e\'aa\'ed\'a6\'b3\'a8\'ec\'b2\'c4\f0 i\f1\'bc\'68\'b0\'b1\'be\'61\'aa\'ba\'bd\'d0\'a8\'44\f0\par
    parameter IDLE2=3'b000,FLOOR1=3'b001,FLOOR2=3'b010,FLOOR3=3'b011,FLOOR4=3'b100;\par
    \par
\tab //\f1\'b4\'5f\'a6\'ec\'c1\'e4\'ac\'b0\'b2\'c4\f0 7\f1\'b8\'b9\'c1\'e4\'a1\'41\'c1\'f6\'b5\'4d\'ad\'6e\'c0\'f2\'b1\'6f\'ad\'ab\'a9\'77\'ab\'48\'b8\'b9\'a1\'41\'aa\'bd\'b1\'b5\'b1\'b5\f0 7\f1\'b8\'b9\'c1\'e4\'a7\'59\'a5\'69\'a1\'41\'a6\'fd\'a6\'d2\'bc\'7b\'a8\'ec\'bc\'d2\'b2\'d5\'a4\'c6\'a1\'41\f0\par
\tab //\f1\'b1\'4e\'a6\'55\'c1\'e4\'bb\'50\'aa\'ac\'ba\'41\'c2\'e0\'b2\'be\'bc\'d2\'b2\'d5\'aa\'ba\'a4\'b6\'ad\'b1\'b3\'a3\'b0\'b5\'a6\'a8\f0 KeyProcess\f1\'aa\'ba\'bf\'e9\'a5\'58\'b0\'f0\f0 (\f1\'a5\'5d\'ac\'41\f0 7\f1\'b8\'b9\'c1\'e4\f0 )\par
    assign reset=k7;\par
 \par
\tab //1\f1\'b8\'b9\'c1\'e4\'a9\'ce\f0 7\f1\'b8\'b9\'c1\'e4\'b3\'51\'ab\'f6\'a4\'55\f0\par
     always @(posedge k1 or posedge k7 )\par
        begin\par
            if(k7)\par
                K1Out<=IDLE1;//\f1\'ad\'59\'ac\'b0\'ad\'ab\'a9\'77\'c1\'e4\'a1\'5d\'ab\'44\'a6\'50\'a8\'42\'ad\'ab\'a9\'77\'a1\'5e\'ab\'f6\'a4\'55\'a1\'41\'b1\'4e\f0 1\f1\'b8\'b9\'c1\'e4\'aa\'ba\'c1\'e4\'ad\'c8\'b8\'6d\'ac\'b0\f0 0\par
            else\par
            \tab if(K1Out==DOWN)//\f1\'ad\'59\f0 1\f1\'b8\'b9\'c1\'e4\'c1\'e4\'ad\'c8\'ac\'b0\f0 DOWN\f1\'a1\'41\'b1\'4e\'c1\'e4\'ad\'c8\'b8\'6d\'ac\'b0\f0 0\f1\'a1\'5d\'bc\'d2\f0 3\f1\'a5\'5b\'a1\'5e\f0\par
                    K1Out<=IDLE1;\par
                else//\f1\'a7\'5f\'ab\'68\'b1\'4e\'c1\'e4\'ad\'c8\'a5\'5b\f0 1\par
                    K1Out<=K1Out+1;\par
         end\par
\par
   \tab //\f1\'bd\'d0\'b0\'d1\'a6\'d2\f0 1\f1\'b8\'b9\'c1\'e4\'a9\'ce\f0 7\f1\'b8\'b9\'c1\'e4\'b3\'51\'ab\'f6\'a4\'55\'aa\'ba\'aa\'60\'c4\'c0\f0    \par
    always @(posedge k2 or posedge k7)\par
         begin\par
             if(k7)\par
                K2Out<=IDLE1; \par
             else\par
                if(K2Out==DOWN)\par
                    K2Out<=IDLE1;\par
                else\par
                    K2Out<=K2Out+1;\par
\par
         end\par
\par
\tab //\f1\'bd\'d0\'b0\'d1\'a6\'d2\f0 1\f1\'b8\'b9\'c1\'e4\'a9\'ce\f0 7\f1\'b8\'b9\'c1\'e4\'b3\'51\'ab\'f6\'a4\'55\'aa\'ba\'aa\'60\'c4\'c0\f0   \par
    always @(posedge k3 or posedge k7)\par
         begin\par
             if(k7)\par
                K3Out<=IDLE1; \par
             else \par
                 if(K3Out==DOWN)\par
                    K3Out<=IDLE1;\par
                else\par
                    K3Out<=K3Out+1;\par
         end\par
\par
\tab //\f1\'bd\'d0\'b0\'d1\'a6\'d2\f0 1\f1\'b8\'b9\'c1\'e4\'a9\'ce\f0 7\f1\'b8\'b9\'c1\'e4\'b3\'51\'ab\'f6\'a4\'55\'aa\'ba\'aa\'60\'c4\'c0\f0   \par
    always @(posedge k4 or posedge k7)\par
        begin\par
            if(k7)\par
                K4Out<=IDLE1; \par
            else\par
                if(K4Out==DOWN)\par
                    K4Out<=IDLE1;\par
                else\par
                    K4Out<=K4Out+1;\par
        end\par
\par
\tab //\f1\'bd\'d0\'b0\'d1\'a6\'d2\f0 1\f1\'b8\'b9\'c1\'e4\'a9\'ce\f0 7\f1\'b8\'b9\'c1\'e4\'b3\'51\'ab\'f6\'a4\'55\'aa\'ba\'aa\'60\'c4\'c0\'a1\'41\'a6\'b3\'a4\'40\'c2\'49\'a4\'a3\'a6\'50\'ac\'4f\'a1\'41\f0 5\f1\'b8\'b9\'c1\'e4\'ac\'4f\'bc\'d2\f0 5\f1\'a5\'5b\f0   \par
    always @(posedge k5 or posedge k7)\par
         begin\par
             if(k7)\par
                K5Out<=IDLE2; \par
             else\par
                if(K5Out==3'b100)\par
                    K5Out<=IDLE2;\par
                else\par
                    K5Out<=K5Out+1;\par
\par
        end\par
\par
\tab //\f1\'bd\'d0\'b0\'d1\'a6\'d2\f0 1\f1\'b8\'b9\'c1\'e4\'a9\'ce\f0 7\f1\'b8\'b9\'c1\'e4\'b3\'51\'ab\'f6\'a4\'55\'aa\'ba\'aa\'60\'c4\'c0\'a1\'41\'a6\'b3\'a4\'40\'c2\'49\'a4\'a3\'a6\'50\'ac\'4f\'a1\'41\f0 6\f1\'b8\'b9\'c1\'e4\'ac\'4f\'bc\'d2\f0 16\f1\'a5\'5b\f0\par
    always @(posedge k6 or posedge k7)\par
        begin\par
             if(k7)\par
                K6Out<=4'b0000; \par
             else\par
                if(K6Out==4'b1111)\par
                    K6Out<=4'b0000;\par
                else\par
                    K6Out<=K6Out+1;\par
        end\par
\par
\tab //8\f1\'b8\'b9\'c1\'e4\'a9\'ce\f0 7\f1\'b8\'b9\'c1\'e4\'b3\'51\'ab\'f6\'a4\'55\f0\par
    always @(posedge k8 or posedge k7)\par
        if(k7)\par
\tab\tab\tab //7\f1\'b8\'b9\'c1\'e4\'ab\'f6\'a4\'55\'a1\'41\'a6\'55\'bf\'e9\'a5\'58\'ab\'48\'b8\'b9\'a7\'a1\'ad\'ab\'a9\'77\'ac\'b0\f0 0\par
            begin\par
                 up1<=0;up2<=0;up3<=0;\par
                down1<=0;down2<=0;down3<=0;\par
                StopFloor<=3'b000;person<=4'b0000;\par
                confirm<=FALSE;//confirm\f1\'b4\'5f\'a6\'ec\'ac\'b0\f0 FALSE\par
            end\par
        else if(!confirm)//confirm\f1\'ac\'b0\f0 FALSE\f1\'a7\'5f\f0\par
            begin\par
                confirm<=TRUE;\par
\par
                if(K1Out!=IDLE1)//\f1\'a6\'70\'aa\'47\f0 K1Out\f1\'ab\'44\f0 0\par
                begin\par
                    up1<=(K1Out==UP)?1:0;//\f1\'ad\'59\f0 K1Out\f1\'ac\'b0\f0 Up\f1\'a1\'41\'b1\'4e\f0 up1\f1\'b8\'6d\'ac\'b0\'b0\'aa\'b9\'71\'a5\'ad\'a1\'41\'a7\'5f\'ab\'68\'ac\'b0\'a7\'43\'b9\'71\'a5\'ad\f0\par
                    down1<=(K1Out==UP)?0:1;//\f1\'ad\'59\f0 K1Out\f1\'ac\'b0\f0 DOWN\f1\'a1\'41\'b1\'4e\f0 down1\f1\'b8\'6d\'ac\'b0\'b0\'aa\'b9\'71\'a5\'ad\'a1\'41\'a7\'5f\'ab\'68\'ac\'b0\'a7\'43\'b9\'71\'a5\'ad\f0\par
                end\par
\tab\tab\tab\tab //\f1\'bb\'50\'a4\'57\'ad\'b1\'aa\'ba\f0 if\f1\'aa\'ba\'ab\'e4\'b8\'f4\'c3\'fe\'a6\'fc\'a1\'41\'a5\'75\'ac\'4f\'bb\'dd\'aa\'60\'b7\'4e\'aa\'ba\'ac\'4f\'c4\'d2\f0 K1Out\f1\'ab\'44\f0 0\f1\'ae\'c9\'a1\'41\f0 else if\f1\'b8\'cc\'aa\'ba\'bb\'79\'a5\'79\'a4\'a3\'b7\'7c\'b0\'f5\'a6\'e6\f0\par
\tab\tab\tab\tab //\f1\'a9\'d2\'a5\'48\'bb\'dd\'b1\'4e\f0 K1Out\f1\'b8\'6d\f0 0\f1\'ab\'e1\'a1\'41\'a6\'b9\'bb\'79\'a5\'79\'a4\'7e\'b7\'7c\'a6\'b3\'a7\'40\'a5\'ce\f0\par
                else if(K2Out!=IDLE1)\par
                begin\par
                    up2<=(K2Out==UP)?1:0;\par
                    down2<=(K2Out==UP)?0:1;\par
                end\par
\tab\tab\tab\tab //\f1\'bb\'50\'a4\'57\'ad\'b1\f0 else if\f1\'aa\'ba\'ab\'e4\'b8\'f4\'c3\'fe\'a6\'fc\'a1\'41\'aa\'60\'b7\'4e\'c2\'49\'c3\'fe\'a6\'fc\'a1\'41\'a7\'59\'a5\'cd\'ae\'c4\'ab\'65\'a1\'41\'bb\'dd\'b8\'6d\f0 K1Out\f1\'a9\'4d\f0 K2Out\f1\'b3\'a3\'ac\'b0\f0 0\par
                else if(K3Out!=IDLE1)\par
                begin\par
                    up3<=(K3Out==UP)?1:0;\par
                    down3<=(K3Out==UP)?0:1;\par
                end\par
                else if(K4Out!=IDLE1)\par
                begin\par
                    up4<=(K4Out==UP)?1:0;\par
                    down4<=(K4Out==UP)?0:1;\par
                end\par
                else if(K5Out!=IDLE2)\par
                begin\par
                    StopFloor<=K5Out;//\f1\'bf\'e9\'a5\'58\'b0\'b1\'be\'61\'bd\'d0\'a8\'44\f0\par
                end\par
                else if(K6Out!=0)\par
                begin\par
                    person<=K6Out;//\f1\'bf\'e9\'a5\'58\'ad\'bc\'ab\'c8\'bc\'c6\f0\par
                end\par
            end\par
        else if(confirm)//confirm\f1\'ac\'b0\f0 TRUE\f1\'a7\'5f\f0\par
\tab\tab\tab //\f1\'ad\'59\f0 confirm\f1\'ac\'b0\f0 TRUE\f1\'a1\'41\'ab\'68\'b1\'4e\'a6\'55\'bf\'e9\'a5\'58\'ab\'48\'b8\'b9\'b8\'6d\f0 0\par
\tab\tab\tab //\f1\'b3\'6f\'bc\'cb\'b7\'ed\'a7\'da\'ad\'cc\'b2\'c4\'a4\'40\'a6\'b8\'ab\'f6\'a4\'55\f0 K8\f1\'ae\'c9\'a1\'41\f0 confirm\f1\'ac\'b0\f0 FALSE,\f1\'bc\'d2\'b2\'d5\'b1\'4e\'bd\'d0\'a8\'44\'ab\'48\'b8\'b9\'bf\'e9\'a5\'58\'a1\'5d\'b0\'aa\'b9\'71\'a5\'ad\'ac\'b0\'a6\'b3\'bd\'d0\'a8\'44\'a1\'5e\f0\par
\tab\tab\tab //\f1\'b7\'ed\'a6\'41\'a6\'b8\'ab\'f6\'a4\'55\f0 k8\f1\'ae\'c9\'a1\'41\f0 confirm\f1\'ac\'b0\f0 TRUE\f1\'a1\'41\'bc\'d2\'b2\'d5\'b1\'4e\'a6\'55\'bf\'e9\'a5\'58\'ab\'48\'b8\'b9\'b8\'6d\f0 0\f1\'bf\'e9\'a5\'58\f0\par
\tab\tab\tab //\f1\'b3\'6f\'bc\'cb\'b7\'ed\'a8\'cf\'a5\'ce\'aa\'cc\'a6\'b3\'bd\'d0\'a8\'44\'ab\'48\'b8\'b9\'ae\'c9\'a1\'41\'b3\'73\'c4\'f2\'a8\'e2\'a6\'b8\'ab\'f6\'a4\'55\f0 k8\f1\'c1\'e4\'ab\'e1\'a1\'41\'bc\'d2\'b2\'d5\'a5\'69\'b9\'ef\'a5\'7e\'bf\'e9\'a5\'58\'a4\'40\'ad\'d3\'bd\'d0\'a8\'44\'af\'df\'bd\'c4\f0\par
            begin\par
                 up1<=0;up2<=0;up3<=0;up4<=0;\par
                down1<=0;down2<=0;down3<=0;down4<=0;\par
                StopFloor<=3'b000;person<=4'b0000;\par
                confirm<=FALSE;\par
            end\par
\par
\par
\tab //KeyValue\f1\'b0\'65\'a5\'58\'aa\'ba\'ac\'4f\'ab\'f6\'c1\'e4\'aa\'ba\'c1\'e4\'ad\'c8\'a1\'5d\'a5\'7e\'b1\'b5\'bc\'c6\'bd\'58\'ba\'de\'c5\'e3\'a5\'dc\'a1\'5e\'a1\'41\'a6\'5d\'a6\'b9\'b7\'ed\'a6\'b3\'c1\'e4\'ad\'c8\'b5\'6f\'a5\'cd\'c5\'dc\'a4\'c6\'ae\'c9\'a1\'41\'c0\'b3\'b8\'d3\'a6\'b3\'a6\'70\'a4\'55\'aa\'ba\'b3\'42\'b2\'7a\f0\par
 \tab always @(K1Out or K2Out or K3Out or K4Out or K5Out or K6Out)\par
        if(K1Out!=IDLE1)\par
            begin\par
                KeyValue<=\{1'b0,1'b0,K1Out\};//\f1\'b7\'ed\f0 K1Out\f1\'ac\'b0\'ab\'44\f0 0\f1\'ae\'c9\'a1\'41\'b1\'4e\f0 K1Out\f1\'bd\'e1\'b5\'b9\f0 KeyValue\par
            end\par
        else if(K2Out!=IDLE1)\par
            begin\par
                KeyValue<=\{1'b0,1'b0,K2Out\};//\f1\'b7\'ed\f0 K2Out\f1\'ac\'b0\'ab\'44\f0 0\f1\'ae\'c9\'a1\'41\'b1\'4e\f0 K2Out\f1\'bd\'e1\'b5\'b9\f0 KeyValue\f1\'a1\'41\'a6\'fd\'ab\'65\'b4\'a3\'ac\'4f\f0 K1Out\f1\'a4\'77\'ac\'b0\f0 0\par
            end\par
        else if(K3Out!=IDLE1)\par
            begin\par
                KeyValue<=\{1'b0,1'b0,K3Out\};//\f1\'b0\'d1\'a6\'d2\f0 K2Out\par
            end\par
        else if(K4Out!=IDLE1)\par
            begin\par
                KeyValue<=\{1'b0,1'b0,K4Out\};\par
            end\par
        else if(K5Out!=IDLE2)\par
            begin\par
                KeyValue<=\{1'b0,K5Out\};\par
            end\par
        else if(K6Out!=0)\par
            begin\par
                KeyValue<=K6Out;\par
             end\par
        else\par
            KeyValue<=4'b0000;//\f1\'a6\'70\'aa\'47\'a6\'55\'ab\'f6\'c1\'e4\'c1\'e4\'ad\'c8\'a7\'a1\'ac\'b0\f0 0\f1\'a1\'41\'b8\'6d\f0 KeyOut\f1\'ac\'b0\f0 0\par
\par
\par
endmodule\par
}
 