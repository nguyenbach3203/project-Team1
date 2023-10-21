module count4bit2 (
	input jk_clk,
	input jk_rs, 
	output[3:0] jk_q
);
wire [3:0] intermediate_q;
wire [3:0] intermediate_vq = ~intermediate_q;
jk_ff u1 (
	.j(intermediate_vq[3]),
	.k(intermediate_q[3]),
	.clk(jk_clk),
	.rs(jk_rs),
	.q(intermediate_q[0])
);
jk_ff u2 (
	.j(intermediate_q[0]),
	.k(intermediate_vq[0]),
	.clk(jk_clk),
	.rs(jk_rs),
	.q(intermediate_q[1])
);
jk_ff u3 (
	.j(intermediate_q[1]),
	.k(intermediate_vq[1]),
	.clk(jk_clk),
	.rs(jk_rs),
	.q(intermediate_q[2])
);
jk_ff u4 (
	.j(intermediate_q[2]),
	.k(intermediate_vq[2]),
	.clk(jk_clk),
	.rs(jk_rs),
	.q(intermediate_q[3])
);
assign jk_q = intermediate_q;
endmodule