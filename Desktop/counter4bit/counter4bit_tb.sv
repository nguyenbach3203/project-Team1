
module counter4bit_tb;

reg jk_clk;
reg jk_j;
reg jk_k;
reg jk_rs;
reg jk_set;
wire [3:0] jk_q;

// Instantiate the count4bit module
count4bit uut (
    .jk_clk(jk_clk),
    .jk_j(jk_j),
    .jk_k(jk_k),
    .jk_rs(jk_rs),
    .jk_set(jk_set),
    .jk_q(jk_q)
);

// Clock generation
always begin
    #5 jk_clk = ~jk_clk; // Toggle the clock every 5 time units
end

// Initialize inputs
initial begin
    jk_clk = 0;
    jk_j = 0;
    jk_k = 0;
    jk_rs = 0;
    jk_set = 0;

    // Test case 1
    #10 jk_j = 0;
    #10 jk_k = 0;
    #10 jk_rs = 0;
    #10 jk_set = 1;

    // Test case 2
    #10 jk_j = 0;
    #10 jk_k = 0;
    #10 jk_rs = 1;
    #10 jk_set = 0;
    // Test case 3
    #10 jk_j = 1;
    #10 jk_k = 1;
    #10 jk_rs = 0;
    #10 jk_set = 0;
	 // Test case 4
    #10 jk_j = 1;
    #10 jk_k = 1;
    #10 jk_rs = 0;
    #10 jk_set = 0;
    // Add more test cases as needed

    // Finish simulation
    #1000 $finish;
end


endmodule
