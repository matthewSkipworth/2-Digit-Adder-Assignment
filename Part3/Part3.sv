module Part3(SW, LEDR, HEX0, HEX1);
input [17:0] SW;
output [17:0] LEDR;
output [0:6] HEX0, HEX1;
assign LEDR = SW;
logic C;
logic [3:0]Sum;
Four_Bit_Ripple_Carry_Adder M1(SW[7:4], SW[3:0], SW[8], C, Sum);
logic [3:0]Carry;
assign Carry[0] = C;
	//	Bin_to_BCD G0(Y, X, Sum);
		HexHEXI G1(HEX0, Sum);
		HexHEXI G2(HEX1, C);
endmodule