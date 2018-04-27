module BCD_Add2(A1, A0, B1, B0, S0, S1, S2);
	input [3:0] A0, A1, B0, B1;
	output [3:0] S0, S1, S2;
	reg C0, C1, C2;
	logic [3:0] Z0, Z1;
	reg [4:0]T0, T1;
	
	assign T0 = A0 + B0;
	always @(T0) begin
		if(T0 > 9) begin
			Z0 = 10;
			C1 = 1;
		end else begin
			Z0 = 0;
			C1 = 0;
		end
	end	
	assign S0 = T0 - Z0;
	assign T1 = A1 + B1 + C1;
	always @(T1) begin
		if (T1 > 9) begin
			Z1 = 10;
			C2 = 1;
		end else begin
			Z1 = 0;
			C2 = 0;
		end
	end
	assign S1 = T1 - Z1;
	assign S2 = C2;
endmodule

module BCD_Add2_testbench;
	logic [3:0] A0, A1, B0, B1;
	logic [3:0] S0, S1, S2;
	BCD_Add2 dut(A1, A0, B1, B0, S2, S1, S0);
	integer i, j, k, l;
	initial begin
	
		for (i = 0; i < 10; i++) begin
		A0 = i;
		#10;
			for (j = 0; j < 10; j++) begin
			A1 = j;
			#10;
				for (k = 0; k < 10; k++) begin
				B0 = k;
				#10;
					for (l = 0; l < 10; l++) begin
					B1 = l;
					#10;
						$display("A1, A0, B1, B0, S0, S1, S2");
						$monitor("%d, %d, %d, %d, %d, %d, %d",A1, A0, B1, B0, S0, S1, S2);
						#10;
					end
				end
			end
		end
	end	
	
endmodule	
	
