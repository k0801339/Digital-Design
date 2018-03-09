module GCD (
  input wire CLK,
  input wire RST_N,
  input wire [7:0] A,
  input wire [7:0] B,
  input wire START,
  output reg [7:0] Y,
  output reg DONE,
  output reg ERROR
);

  reg found, swap;
  reg [7:0] reg_a, reg_b, data_a, data_b, next_a, next_b;
  reg [7:0] diff;
  reg error_next;
  reg [1:0] state, state_next;

  parameter [1:0] IDLE = 2'b00;
  parameter [1:0] CALC = 2'b01;
  parameter [1:0] FINISH = 2'b10;

  // ////////////////
  // HW TODO: Complete the GCD module
  // ////////////////
  //
  // Note: You may calculate theose signals by using either
  //       assign statement or always block. Just remember to use
  //       the proper signal type (namely, wire or reg) as well.
  //
  always @(posedge CLK or negedge RST_N) begin
	if(!RST_N) state <= IDLE;
	else state <= state_next;
  end
  always @(*) begin
	state_next = IDLE;
	error_next = 1'b0;
	DONE = 1'b0;
	case (state)
		IDLE: begin
		  if(!START) begin
			state_next = IDLE;
			error_next = 1'b0;
		  end else begin
			state_next = CALC;
			error_next = (A==0 || B==0);
		  end
		end
		CALC: begin
		  if(!found && !ERROR) begin
			state_next = CALC;
			error_next = ERROR;
		  end else if(found || ERROR) begin
			state_next = FINISH;
			error_next = ERROR;
		  end
		end
		FINISH: begin
		  state_next = IDLE;
		  error_next = 1'b0;
		  DONE = 1'b1;
		end
	endcase
  end
  always @(posedge CLK or negedge RST_N) begin
	if(!RST_N) ERROR <= 1'b0;
	else ERROR <= error_next;
  end
  always @(posedge CLK or negedge RST_N) begin
	if(!RST_N) Y <= 0;
	else Y <= data_a;
  end
  always @(posedge CLK or negedge RST_N) begin
	if(!RST_N) begin
	  reg_a = 0;
	  reg_b = 0;
	end else begin
	  reg_a = next_a;
	  reg_b = next_b;
	end
  end
  always @(*) begin
	if(START==1) begin
	  next_a = A;
	  next_b = B;
	end else begin
	  next_a = diff;
	  next_b = data_b;
	end
  end
  always @(*) begin
	swap = (reg_b>reg_a)? 1'b1 : 1'b0;
	if(swap==1) begin
	  data_a = reg_b;
	  data_b = reg_a;
	end else begin
	  data_a = reg_a;
	  data_b = reg_b;
	end
	diff = data_a - data_b;
	found = (reg_a==reg_b || A==B)? 1'b1 : 1'b0;
  end

endmodule
