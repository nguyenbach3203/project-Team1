module WriRed (
  input logic [1:0] ADDR,
  input logic IN,
  input logic RW,
  input logic CLK,
  output logic OUT
);
  wire [1:0] Q;
  logic [1:0] D;
always @(posedge CLK) begin
    if (RW) begin
         D[ADDR] <= IN;
    end else begin
         OUT <= D[ADDR];
    end
  end
    LatchD Latch0 (
    .D(D[ADDR]),
    .CLK(CLK),
    .Q(Q[0])
  );

  LatchD Latch1 (
    .D(D[ADDR]),
    .CLK(CLK),
    .Q(Q[1])
  );

endmodule
