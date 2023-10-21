module WriRed_tb;

  // Inputs
  reg [1:0] ADDR;
  reg IN;
  reg RW;
  reg CLK;

  // Outputs
  wire OUT;

  // Instantiate the module under test
  WriRed uut (
    .ADDR(ADDR),
    .IN(IN),
    .RW(RW),
    .CLK(CLK),
    .OUT(OUT)
  );

  // Clock generation
  reg clock = 0;
  always begin
    #5 CLK = ~clock;
    clock = ~clock;
  end

  // Test stimulus
  initial begin
    // Initialize inputs
    ADDR = 2'b00;
    IN = 1'b0;
    RW = 1'b0;
    CLK = 1'b0;

    // Write data to register 0
    RW = 1'b1;
    IN = 1'b1;
    #10;

    // Read data from register 0
    RW = 1'b0;
    #10;

    // Write data to register 1
    ADDR = 2'b01;
    IN = 1'b0;
    RW = 1'b1;
    #10;

    // Read data from register 1
    RW = 1'b0;
    #10;

    $finish;
  end

  // Monitor the signals
  always @(posedge CLK) begin
    $display("ADDR = %b, IN = %b, RW = %b, CLK = %b, OUT = %b", ADDR, IN, RW, CLK, OUT);
  end

endmodule