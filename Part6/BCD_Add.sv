//Matthew Skipworth
//TCES 330, Friday Lab
module BCD_Add(A, B, Cin, S0, S1);
	input[3:0] A, B;
	input Cin;
	output [3:0] S0, S1;
	logic [3:0]  Sum;
	logic [4:0] V;
	logic Cout;
	
	
	FourBitAdder A1(A, B, Cin, Cout, Sum);
	
	assign V[4] = Cout;
	assign V[3:0] = Sum;
		reg [3:0] tens, ones;
	
	always @(V) begin
		if(V > 9) begin
			tens = 4'd1;
			ones = V - 4'd10;
		end else begin
			tens = 4'd0;
			ones = V;	
		end
	end
	
	assign S1[3:1] = 0;
	assign S1[0] = tens;
	//assign S1 = tens;
	assign S0 = ones;

endmodule

module BCD_Add_testbench;

	logic[3:0] A, B;
	logic Cin;
	logic [3:0] S0, S1;

	
	
	
	integer i, j;
	
	BCD_Add dut(A, B, Cin, S0, S1);
	
	initial begin
		for(i = 0; i < 10; i++) begin
			A = i;
			for(j = 0; j < 10; j++) begin
				B = j;
				Cin = 0;
				$display("A,   B,   Cin, S1,  S0");
				$monitor("%4b %4b %b    %d   %d", A, B, Cin, S1, S0);
				#10;
				Cin = 1;
				$display("A,   B,   Cin, S1,  S0");
				$monitor("%4b %4b %b    %d   %d", A, B, Cin, S1, S0);				
				#10;
			end	
		end	
	end	
endmodule	