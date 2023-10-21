module countern (
    input wire [8-1:0] IN,
	 input logic clk,
	 input logic rs,
    output wire OUT        
);

reg [8-1:0] count;         
always @(posedge clk) begin
    if (rs) begin
        count <= IN;
    end else if (count > 0) begin
            count <= count - 1'b1;
    end
end
assign OUT = (count ==0);
endmodule
