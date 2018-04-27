module Two_digit_BCD_Add(A1, A0, B1, B0, Sum0, Sum1, Sum2);
	input [3:0] A1, A0, B0, B1;
	output [3:0] Sum0, Sum1, Sum2;
	reg [3:0]Carry; 
	reg Cin;
	assign Cin = 0;
	module BCD_Add(A0, B0, Cin, Sum0, Carry);
	module BCD_Add(A1, B1, Carry[0], Sum1, Sum2);
endmodule

module Two_digit_BCD_Add_testbench;

	logic [3:0] A1, A0, B0, B1;
	logic [3:0] Sum0, Sum1, Sum2;
	
	integer i, j, k, l;
	
	module Two_digit_BCD_Add dut(A1, A0, B1, B0, Sum0, Sum1, Sum2);
	
	initial begin 
		for (i = 0; i < 4; i++) begin
			A1 = i;
			#10;
			for (j = 0; j < 4; j++) begin
				A0 = j;
				#10;
				for (k = 0; k < 4; k++) begin
					B1 = k;
					#10;
					for (l = 0; l < 4; l++) begin
						B0 = l;
						#10;
						$display("A1, A0, B1, B0, Sum0, Sum1, Sum2");
						$monitor("%d, %d, %d, %d, %d, %d, %d",A1, A0, B1, B0, Sum0, Sum1, Sum2);
					end	
				end	
			end	
		end	
	end	
endmodule	