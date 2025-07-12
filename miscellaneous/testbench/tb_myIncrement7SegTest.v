`timescale 1ns/1ns

`define assert(act, exp) \
	if(act != exp) begin \
		$display("ASSERT FAILED: Actual = %d, Expect = %d\n", act, exp); \
		$finish; \
		end
		
		
module tb_myIncrement7SegTest();

	reg clk, rst, SW;
	wire[27:0] HEX;

	myIncrement7SegTest UUT
	(
		.clk(clk),
		.rst(rst),
		.SW0(SW),
		.HEX_arr(HEX)
	);
	
	always begin
		clk <= 0;
		#1;
		clk <= 1;
		#1;
	end
	
	initial begin
		rst <= 0;
		SW <= 0;
		#5; // delay 5 cycles
		@(posedge clk)
		
		rst <= 0;
	end

endmodule