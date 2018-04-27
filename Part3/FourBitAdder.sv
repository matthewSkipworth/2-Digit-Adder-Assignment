//Matthew Skipworth
//TCES 330, Friday Section
module FourBitAdder(A, B, Ci, Cout, Sum);

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
	
	FullAdder U0(A[0], B[0], Ci, C1, Sum[0]);
	FullAdder U1(A[1], B[1], C1, C2, Sum[1]);
	FullAdder U2(A[2], B[2], C2, C3, Sum[2]);
	FullAdder U3(A[3], B[3], C3, Cout, Sum[3]);

endmodule
//testbench
module FourBitAdder_testbench;
	logic [3:0] A, B;
	logic Ci;
	logic [3:0] Sum;
	logic Cout;

	FourBitAdder dut(A, B, Ci, Cout, Sum);
	initial begin
		integer i, j;
		for (i = 0; i < 16; i++) begin
			A = i;
			for (j = 0; j < 16; j++) begin
				B = j;
				Ci = 0;
				$display("A,     B,     Ci, Cout,  Sum");
				$monitor("%4b,  %4b,  %1b,   %1b,    %4b", A, B, Ci, Cout, Sum);
				#10;
				Ci = 1;
				$display("A,     B,     Ci, Cout,  Sum");
				$monitor("%4b,  %4b,  %1b,   %1b,    %4b", A, B, Ci, Cout, Sum);				
				#10;
			end
		end	
	end	
endmodule	