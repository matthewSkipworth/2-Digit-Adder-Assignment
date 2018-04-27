//Matthew Skipworth
//TCES 330, Friday Section
module Two_digit_BCD_Add(A1, A0, B1, B0, Sum0, Sum1, Sum2);
	input [3:0] A1, A0, B0, B1;
	output [3:0] Sum0, Sum1, Sum2;
	logic [3:0]Carry; 
	reg Cin;
	//assign temp = Carry[0];
	assign Cin = 0;
	BCD_Add ADD1(A0, B0, Cin, Sum0, Sum2);
	BCD_Add ADD2(A1, B1, Sum2[0], Sum1, Sum2);
endmodule

module Two_digit_BCD_Add_testbench;

	logic [3:0] A1, A0, B0, B1;
	logic [3:0] Sum0, Sum1, Sum2;
	
	Two_digit_BCD_Add dut(A1, A0, B1, B0, Sum0, Sum1, Sum2);
	integer i, j, k, l;
	initial begin 
	
		for (i = 0; i < 10; i++) begin
			A1 = i;
			#10;
			for (j = 0; j < 10; j++) begin
				A0 = j;
				#10;
				for (k = 0; k < 10; k++) begin
					B1 = k;
					#10;
					for (l = 0; l < 10; l++) begin
						B0 = l;
						#10;

						$display("A1, A0, B1, B0, Sum2, Sum1, Sum0");
						$monitor("%d, %d, %d, %d, %d, %d, %d",A1, A0, B1, B0, Sum2, Sum1, Sum0);
						#10;
					end	
				end	
			end	
		end	
	end
endmodule	