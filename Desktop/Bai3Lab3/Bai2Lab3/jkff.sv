module jk_ff (
	input j,
	input k,
	input clk,
	input rs,
	output reg q
);

always @(posedge clk or posedge rs)
begin
	if (rs)
		q <= 1'b0;
	else 
		case({j,k})
			2'b00: q <= q;
			2'b01: q <= 1'b0;
			2'b10: q <= 1'b1;
			2'b11: q<= ~q;
		endcase
end
endmodule
