module Fulladd_tb;
	reg a, b, cin;
	wire s, cout;
	
	Fulladd A0(.a(a), .b(b), .cin(cin), .sum(s), .cout(cout));

	initial begin
		a = 0;
		b = 1;
		cin = 0;
		#100;
		cin = 1;
		#100;
		a = 1;
		b = 0;
		#100;
	end
	
endmodule
