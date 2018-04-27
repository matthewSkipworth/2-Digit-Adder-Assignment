//Matthew Skipworth
//TCES 330, Friday Section
module FullAdder(A, B, Ci, Cout, Sum);
	input A, B, Ci;
	output Sum, Cout;
	
	wire X;
	
	xnor(X, A, B);
	assign Cout = (~X & Ci) | (X & B);
	xnor(Sum, Ci, X);
	
endmodule

module FullAdder_testbench;

	logic A, B, Ci;
	logic Sum, Cout;
	
	FullAdder dut(A, B, Ci, Cout, Sum);
	initial begin
	A = 0; B = 0; Ci = 0; #10;
	A = 0; B = 0; Ci = 1; #10;
	A = 0; B = 1; Ci = 0; #10;
	A = 0; B = 1; Ci = 1; #10;
	A = 1; B = 0; Ci = 0; #10;
	A = 1; B = 0; Ci = 1; #10;
	A = 1; B = 1; Ci = 0; #10;
	A = 1; B = 1; Ci = 1; #10;
	end
endmodule	