module Part5(SW, HEX7, HEX6, HEX5, HEX4, HEX2, HEX1, HEX0, LEDR);
	input [17:0] SW;
	output [17:0] LEDR;
	output [0:6]  HEX7, HEX6, HEX5, HEX4, HEX2, HEX1, HEX0;
	wire [3:0] red, green, blue, violet;
	assign red = SW[15:12];
	assign green = SW[11:8];
	assign blue = SW[7:4];
	assign violet = SW[3:0];
	assign LEDR = SW;
	reg [3:0] Sum0, Sum1, Sum2, F0, F1, F2, F3, F4, F5, F6, E0, E1, E2, E3, E4, E5, E6;
	
	Two_digit_BCD_Add A1(red, green, blue, violet, Sum0, Sum1, Sum2);
	
		Bin_to_BCD B0(E0, F0, Sum0);
		HexHEXI H0(HEX0, F0);			//S0
		
		Bin_to_BCD B1(E1, F1, Sum1);
		HexHEXI H1(HEX1, F1);			//S1
		
		Bin_to_BCD B2(E2, F2, Sum2);
		HexHEXI H2(HEX2, F2);			//S2
		
		Bin_to_BCD B3(E3, F3, violet);
		HexHEXI H4(HEX4, F3);			//B0
		
		Bin_to_BCD B4(E4, F4, blue);
		HexHEXI H5(HEX5, (F4 + E3));	//B1
		
		Bin_to_BCD B5(E5, F5, green);
		HexHEXI H6(HEX6, F5);			//A0
		
		Bin_to_BCD B6(E6, F6, red);
		HexHEXI H7(HEX7, (F6 + E5));	//A1	
endmodule
		
		