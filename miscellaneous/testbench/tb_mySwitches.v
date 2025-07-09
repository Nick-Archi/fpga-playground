`timescale 1ns/1ns

`define assert(act, exp) \
	if(act != exp) begin \
		$display("%m ASSERT FAILED, Expected: %h, Actual: %h", exp, act); \
		$finish; \
		end

module tb_mySwitches();

	parameter WIDTH = 4;
	reg[WIDTH-1:0] SW;
	wire[WIDTH-1:0] LEDR;

	mySwitches #(.WIDTH(WIDTH)) UUT
	(
		.SW (SW),
		.LEDR (LEDR)
	);
	
	initial begin
		$monitor($time, " SW = %b, LEDR = %b", SW, LEDR);
		#1 SW = 4'b0000;
		#0 `assert(SW, 4'b0000)
		#1 SW = 4'b0001;
		#0 `assert(SW, 4'b0001)
		#1 SW = 4'b0011;
		#0 `assert(SW, 4'b0011)
		#1 SW = 4'b0111;
		#0 `assert(SW, 4'b0111)
		#1 SW = 4'b1111;	
		#0 `assert(SW, 4'b1111)
	end

endmodule
