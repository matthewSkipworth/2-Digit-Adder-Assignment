module BCD_Add2(A0, A1, B0, B1, T0, T1, Z0, Z1, C0, C1, S0, S1, S2);
	input A0, A1, B0, B1;
	output S0, S1, S2;
	wire Z0, Z1;
	reg T0, T1;
	
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