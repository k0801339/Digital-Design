module stimulus;
  parameter cyc = 10;
  parameter delay = 2;

  reg clk, rst_n, start;
  reg [7:0] a, b;
  wire done, error;
  wire [7:0] y;

  GCD gcd01(
    .CLK(clk),
    .RST_N(rst_n),
    .A(a),
    .B(b),
    .START(start),
    .Y(y),
    .DONE(done),
    .ERROR(error)
  );

  always #(cyc/2) clk = ~clk;

  initial begin
    $fsdbDumpfile("gcd.fsdb");
    $fsdbDumpvars;
    $monitor($time,
        " CLK=%b RST_N=%b START=%b A=%3d B=%3d | DONE=%b Y=%3d ERROR=%b",
        clk, rst_n, start, a, b, done, y, error);
  end

  initial begin
    clk = 1;
    rst_n = 1;
    start = 0;

    #(cyc);
    #(delay) rst_n = 0;
    #(cyc*4) rst_n = 1;
    #(cyc*2);

    #(cyc) start = 0;

    // 1st pattern	21, 6	
    #(cyc)	//delay at reset
      start = 1;
      a = 8'd21;
      b = 8'd6;
    #(cyc)
      start = 0;

    @(posedge done);

    // 2nd pattern 75, 60
    #(cyc + delay)
      start = 1;
      a = 8'd75;
      b = 8'd60;
    #(cyc) 
      start = 0;
    @(posedge done);

    // 3rd pattern	0, 75
    #(cyc + delay) 
      start = 1;
      a = 8'd0;
      b = 8'd75;
    #(cyc)
      start = 0;
    @(posedge done);
		
    // 4th pattern	0, 0
    #(cyc + delay) 
      start = 1;
      a = 8'd0;
      b = 8'd0;
    #(cyc)
      start = 0;
    @(posedge done);

    // ////////////////
    // HW TODO: Add more patterns by your own
    // ////////////////

    //(Extra) 5th pattern	10, 0
    #(cyc + delay) 
      start = 1;
      a = 8'd10;
      b = 8'd0;
    #(cyc)
      start = 0;
    @(posedge done);

    //(Extra) 6th pattern	14, 35
    #(cyc + delay) 
      start = 1;
      a = 8'd14;
      b = 8'd35;
    #(cyc)
      start = 0;
    @(posedge done);

    #(cyc*8);
    $finish;
		
  end
endmodule
