module elevator (clk,rst,U1,U2,D2,U3,D3,D4,F1,F2,F3,F4,U1_led,U2_led,D2_led,U3_led,D3_led,D4_led,F1_led,F2_led,F3_led,F4_led,door_open,Dir,Floor
);
 	input clk,rst;
  	input U1,U2,D2,U3,D3,D4;	//outdoor_call
	input F1,F2,F3,F4;	//indoor_call
	output reg U1_led,U2_led,D2_led,U3_led,D3_led,D4_led;	//outdoor_LED
	output reg F1_led,F2_led,F3_led,F4_led;	//indoor_LED
	output wire door_open;
	output reg [1:0] Dir;	// 10:up ; 01:down ; 00:hold
	output wire [1:0] Floor;	// 11:4F ; 10:3F ; 01:2F ; 00:1F
	parameter [2:0] S_F1 = 3'd0; 	//	below are state for 4F~1F
	parameter [2:0] S_F2 = 3'd1;
	parameter [2:0] S_F3 = 3'd2;
	parameter [2:0] S_F4 = 3'd3;
	parameter [2:0] MOVE = 3'd4;
	parameter [2:0] OPEN = 3'd5;
	
	reg [2:0] state, state_n, state_p;
	reg [1:0] n_Dir;
	assign door_open=(state==OPEN)?1'b1:1'b0;	//judge: door open or not

	always @(posedge clk or negedge rst) begin	//direction
		if(!rst) begin
			Dir = 2'b00;
		end else begin
			Dir = n_Dir;
		end
	end
	always @ (posedge clk or negedge rst) begin	//state
		if(!rst) begin
			state = S_F1;
		end
		else begin
			state_p = state;
			state = state_n;
		end
	end

	assign Floor=(state==S_F1)?2'b00:(state==S_F2)?2'b01:(state==S_F3)?2'b10:(state==S_F4)?2'b11:(state==OPEN)?state_n:(state==MOVE)?state_p:0;	//floor
	always @* begin
		if(rst) begin
			U1_led = 0;
     	    U2_led = 0;
    	 	D2_led = 0;
    	 	U3_led = 0;
     		D3_led = 0;
    	 	D4_led = 0;
     	 	F1_led = 0;
    	  	F2_led = 0;
     	 	F3_led = 0;
     	 	F4_led = 0;
	end
end	
	//press outside button
	always @*  begin
		if(U1) U1_led = 1;
		if(U2) U2_led = 1;
		if(D2) D2_led = 1;
		if(U3) U3_led = 1;
		if(D3) D3_led = 1;
		if(D4) D4_led = 1;
	end
	//press inside button
	always @* begin
		if(F1) F1_led = 1;
		if(F2) F2_led = 1;
		if(F3) F3_led = 1;
		if(F4) F4_led = 1;	
	end

	//state 
	always @ (posedge clk or negedge rst) begin
		if(!rst)begin
			state_n <= S_F1;
			state_p <= S_F1;
		end
		case(state)
		S_F1 : begin
			if(U1_led || F1_led) begin
				//door_open = 1'b1;
				n_Dir = 2'b00; 
				state_n = OPEN;
			end else if(U2_led||D2_led||F2_led||U3_led||D3_led||F3_led||D4_led||F4_led)begin	//if up_floor has signal call ->keep moving up
				n_Dir = 2'b10;
				state_n = MOVE;
      		end
			else 
				state_n <= S_F1;
		end
		S_F2 : begin
			if(U2_led || D2_led || F2_led) begin
				//door_open = 1'b1;
				n_Dir = 2'b00;
				state_n <= OPEN;
			end else if(U1_led||F1_led||U3_led||D3_led||F3_led||D4_led||F4_led)begin
				state_n <= MOVE;
				if(Dir==2'b10 && (U3_led||D3_led||F3_led||D4_led||F4_led)) begin
					n_Dir = 2'b10;
				end else if(Dir==2'b10 && (U1_led||F1_led)) begin
					n_Dir = 2'b01;
				end else if(Dir==2'b01 && (U1_led||F1_led)) begin
					n_Dir = 2'b01;
				end else if(Dir==2'b01 && (U3_led||D3_led||F3_led||D4_led||F4_led)) begin
					n_Dir = 2'b10;
				end
			end
			else
        		state_n <= S_F2;
		end
  	    S_F3 : begin
			if(U3_led || D3_led || F3_led) begin
				//door_open = 1'b1;
				n_Dir = 2'b00;
				state_n <= OPEN;
			end else if(U2_led||D2_led||F2_led||U1_led||F1_led||D4_led||F4_led)begin
				state_n <= MOVE;
				if(Dir==2'b10 && (D4_led||F4_led)) begin
                     n_Dir = 2'b10;
                 end else if(Dir==2'b10 && (U1_led||F1_led||U2_led||D2_led||F2_led)) begin
                     n_Dir = 2'b01;
                 end else if(Dir==2'b01 && (U1_led||F1_led||U2_led||D2_led||F2_led)) begin
                     n_Dir = 2'b01;
                 end else if(Dir==2'b01 && (D4_led||F4_led)) begin
                     n_Dir = 2'b10;
                 end
			end
			else 
       			state_n <= S_F3;
		end
		S_F4 : begin
			if(D4_led || F4_led) begin
				//door_open = 1'b1;
				n_Dir = 2'b00;
				state_n <= OPEN;
			end else if(U2_led||D2_led||F2_led||U3_led||D3_led||F3_led||U1_led||F1_led)begin
				n_Dir = 2'b01;
				state_n <= MOVE;
			end
     		else 
       			state_n <= S_F4;
		end
		OPEN : begin	//when open, floor's led turn 0
			case(state_p)
				S_F1:begin
					U1_led = 0;
					F1_led = 0;
					state_n = S_F1;
				end
				S_F2:begin
					U2_led = 0;
					F2_led = 0;
					D2_led = 0;
					state_n = S_F2;
				end
				S_F3:begin
					U3_led = 0;
					F3_led = 0;
					D3_led = 0;
					state_n = S_F3;
				end
				S_F4:begin
					D4_led = 0;
					F4_led = 0;
					state_n = S_F4;
				end
			endcase
		end
		MOVE : begin	//set the moving direction and next state
			case(state_p)
			S_F1 : begin
				if(F1_led || U1_led) begin
					n_Dir = 0;
					state_n <= S_F1;
				end
				else if(F2_led || U2_led || D2_led) begin
					n_Dir = 2'b10;
					state_n <= S_F2;
				end	
				else if(F3_led || U3_led || D3_led) begin
					n_Dir = 2'b10;
					state_n <= S_F2;
				end
				else if(F4_led || D4_led) begin
					n_Dir = 2'b10;
					state_n <= S_F2;
				end
			end
			S_F2 : begin
				if(F1_led || U1_led) begin
					n_Dir = 2'b01;
					state_n <= S_F1;					
				end
				else if(F2_led || U2_led || D2_led) begin
					n_Dir = 0;
					state_n <= S_F2;
				end
				else if(F3_led || U3_led || D3_led) begin
					n_Dir = 2'b10;
					state_n <= S_F3;
				end
				else if(F4_led || D4_led) begin
					n_Dir = 2'b10;
					state_n <= S_F3;
				end
			end
			S_F3 : begin
				if(F1_led || U1_led) begin
					n_Dir = 2'b01;
					state_n <= S_F2;
				end
				else if(F2_led || U2_led || D2_led) begin
					n_Dir = 2'b01;
					state_n <= S_F2;
				end
				else if(F3_led || U3_led || D3_led) begin
					n_Dir = 0;
					state_n <= S_F3;
				end
				else if(F4_led || D4_led) begin
					n_Dir = 2'b10;
					state_n <= S_F4;
				end
			end
			S_F4 : begin
				if(F1_led || U1_led) begin
					n_Dir = 2'b01;
					state_n <= S_F3;
				end
				else if(F2_led || U2_led || D2_led) begin
					n_Dir = 2'b01;
					state_n <= S_F3;
				end
				else if(F3_led || U3_led || D3_led) begin
					n_Dir = 2'b01;
					state_n <= S_F3;
				end
				else if(F4_led || D4_led) begin
					n_Dir = 0;
					state_n <= S_F4;
				end
			end
		endcase
		end
	endcase
	end
endmodule	
