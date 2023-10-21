module Fulladd(input a,b, cin, output sum, cout);
	wire n1, n2, n3;

	xor x1(n1, a, b); // n1 = a XOR b
	xor x2(sum, n1, cin); // sum = n1 XOR cin
	and a1(n2, a, b); // n2 = a & b
	and a2(n3, n1, cin); // n3 = n1 & cin
	or o1(cout, n2, n3); // cout = n2 | n3
	
endmodule