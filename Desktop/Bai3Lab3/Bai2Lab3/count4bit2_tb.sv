module count4bit2_tb;

reg jk_clk;
reg jk_rs;
wire [3:0] jk_q;

// Instantiate the count4bit module
count4bit2 uut (
    .jk_clk(jk_clk),
    .jk_rs(jk_rs),
    .jk_q(jk_q)
);

// Clock generation
always begin
    #5 jk_clk = ~jk_clk; // Toggle the clock every 5 time units
end

// Initialize inputs
initial begin
    jk_clk = 0;
    jk_rs = 0;

    // Test case 1
    #10 jk_rs = 0;

    // Test case 2
    #10 jk_rs = 1;
    // Test case 3
    #10 jk_rs = 0;

	 // Test case 4
    #10 jk_rs = 0;
    // Add more test cases as needed

    // Finish simulation
    #1000 $finish;
end


endmodule
