module Part1(SW, HEX0, HEX1, HEX2, HEX3);

	input [15:0] SW;
	output reg [0:6] HEX0, HEX1, HEX2, HEX3;

	HexHEXI G0(HEX0, SW[3:0]);
	HexHEXI G1(HEX1, SW[7:4]);
	HexHEXI G2(HEX2, SW[11:8]);
	HexHEXI G3(HEX3, SW[15:12]);
	
endmodule