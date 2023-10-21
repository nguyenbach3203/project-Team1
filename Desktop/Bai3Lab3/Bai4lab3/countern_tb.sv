module countern_tb;
    reg [7:0] IN;  // Input signal
    reg clk;      // Clock signal
    reg rs;       // Reset signal
    wire OUT;     // Output signal

    // Instantiate the countern module
    countern uut (
        .IN(IN),
        .clk(clk),
        .rs(rs),
        .OUT(OUT)
    );

    // Clock generation
    always begin
        #5 clk = ~clk; // Create a clock signal with a period of 10 time units
    end

    initial begin
        // Initialize signals
        IN = 8'b00001111; // Initial count value
        clk = 0;
        rs = 0;

        // Apply reset and wait for a few clock cycles
        rs = 1;
        #20 rs = 0;


        // Simulate for a while
        #100;

    end
endmodule
