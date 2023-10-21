module LatchD (
  input logic D,
  input logic CLK,
  output logic Q
);
  logic DATA = 0;

  always_ff @(posedge CLK) begin
    if (DATA != D) begin
      DATA <= D;
    end
  end

  assign Q = DATA;
endmodule

