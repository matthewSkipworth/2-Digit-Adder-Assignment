module Part4(SW, LEDR, HEX7, HEX6, HEX5, HEX4, HEX1, HEX0, LEDG);

	input [17:0] SW;
	output logic [8:8] LEDG;
	output [17:0] LEDR;
	output [0:6] HEX0, HEX1, HEX4, HEX5, HEX6, HEX7;
	reg [1:0] X, Y;
	reg [3:0] P, Q;
	assign P = SW[7:4];
	assign Q = SW[3:0];
	assign LEDR = SW;
	logic [3:0] S0, S1;
	
	BCD_Add B1(SW[7:4], SW[3:0], SW[8], S0, S1);
	

		HexHEXI H0(HEX0, S0);
		HexHEXI H1(HEX1, S1);
		
		Bin_to_BCD G0(Y[0], X[0], SW);
		HexHEXI H2(HEX4, Y[0]);
		HexHEXI H3(HEX5, X[0]);
		
		Bin_to_BCD G1(Y[1], X[1], SW);
		HexHEXI H4(HEX6, X[1]);
		HexHEXI H5(HEX7, Y[1]);
		
		always @(P, Q) begin
		
			if ((P > 9) | (Q > 9)) begin
				LEDG = 1;
			//	HEX5 = 1;
			//	HEX7 = 7'b1111111;
			end else begin
				LEDG = 0; 
			end
		end	
endmodule
