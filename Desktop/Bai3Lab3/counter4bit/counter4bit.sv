module count4bit (
    input jk_clk,
    input jk_j,
    input jk_k,
    input jk_rs,
    input jk_set,
    output[3:0] jk_q
);

wire [3:0] intermediate_q;

jk_ff u1 (
    .j(jk_j),
    .k(jk_k),
    .clk(jk_clk),
    .rs(jk_rs),
    .set(jk_set),
    .q(intermediate_q[0])
);

jk_ff u2 (
    .j(jk_j),
    .k(jk_k),
    .clk(intermediate_q[0]),
    .rs(jk_rs),
    .set(jk_set),
    .q(intermediate_q[1])
);
jk_ff u3 (
    .j(jk_j),
    .k(jk_k),
    .clk(intermediate_q[1]),
    .rs(jk_rs),
    .set(jk_set),
    .q(intermediate_q[2])
);
jk_ff u4 (
    .j(jk_j),
    .k(jk_k),
    .clk(intermediate_q[2]),
    .rs(jk_rs),
    .set(jk_set),
    .q(intermediate_q[3])
);
assign jk_q = intermediate_q;
endmodule
