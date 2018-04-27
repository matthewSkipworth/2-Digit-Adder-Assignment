module Part2(SW, HEX0, HEX1);
	input [3:0] SW;
	output [0:6] HEX0, HEX1;
	
	logic [3:0] X, Y;
	//always @(SW) begin
	//	if (SW > 9) begin
		
			Bin_to_BCD G0(Y, X, SW);
			HexHEXI G1(HEX0, X);
			HexHEXI G2(HEX1, Y);
	//	end
	
	//	else begin
	//		HexHEXI G3(HEX0, SW);
	//	end
//	end
endmodule
	//module HexHEXI(Hex, S);
