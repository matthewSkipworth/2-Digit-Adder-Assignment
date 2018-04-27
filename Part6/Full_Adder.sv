module Full_Adder(A, B, Ci, Cout, Sum);
	input A, B, Ci;
	output Sum, Cout;
	
	wire X;
	
	xnor(X, A, B);
	assign Cout = (~X & Ci) | (X & B);
	xnor(Sum, Ci, X);
	
endmodule