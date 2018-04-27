//Matthew Skipworth
//TCES330
//Friday Section
module Bin_to_BCD(E, F, V);
	input [3:0] V; //binary input.
	output reg [3:0] E, F;
 //BCD output.
 
 //Double Dabble implementation.
	
	
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
	
	assign E[3:1] = 0;
	assign E[0] = tens;
	assign F = ones;
	
endmodule

module Bin_to_BCD_testbench();
	logic [3:0] V; //binary input.
	reg [3:0] E, F;

	Bin_to_BCD dut(E, F, V);
	
	integer i;
	initial begin
		for (i = 0; i < 16; i++) begin
		V = i;
		$display("V    E    F");
		$monitor("%d    %4b    %4b", V, E, F);
		#10;
		end
	end	
endmodule	
	

//y = A'B'C' + A'C'D' + AB'C + ACD' hex0,0
//y = A'BC + BCD + A'B'C'D' + AB'CD' hex0,1
//y = A'B'D' + B'CD' + ABC'D' hex0,2
//y = A'B'C' + A'C'D' + AB'C + ACD' + A'BCD hex0,3
//y = D + A'C' + AC hex0,4
//y = A'B' + B'C + A'CD + ABC' hex0,5
//y = A'B'C' + AB'C + A'BCD
//y = AC + AB hex1,0
//y = 0 hex1,1
//y = 0 hex1,2
//y = AC + AB hex1,3
//y = AC + AB hex1,4
//y = AC + AB hex1,5
//y = AC + AB hex1,6
