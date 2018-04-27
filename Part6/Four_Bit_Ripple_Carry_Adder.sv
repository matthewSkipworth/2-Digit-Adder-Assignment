module Four_Bit_Ripple_Carry_Adder(A, B, Ci, Cout, Sum);

	input [3:0] A, B;
	input Ci;
	output [3:0] Sum;
	output Cout;
	wire C1, C2, C3, b0, b1, b2, b3;
	//module Full_Adder(A, B, Ci, Cout, Sum);
	//xor = (a & ~b) | (~a & b)
	/*assign b0 = (Ci & ~B[0]) | (~Ci & B[0]);
	assign b1 = (Ci & ~B[1]) | (~Ci & B[1]);
	assign b2 = (Ci & ~B[2]) | (~Ci & B[2]);
	assign b3 = (Ci & ~B[3]) | (~Ci & B[3]);*/
	
	Full_Adder U0(A[0], B[0], Ci, C1, Sum[0]);
	Full_Adder U1(A[1], B[1], C1, C2, Sum[1]);
	Full_Adder U2(A[2], B[2], C2, C3, Sum[2]);
	Full_Adder U3(A[3], B[3], C3, Cout, Sum[3]);

endmodule