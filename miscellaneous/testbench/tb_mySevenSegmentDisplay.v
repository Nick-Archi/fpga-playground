`timescale 1ns/1ns

`define assert(exp, act) \
	if(exp != act) begin \
		$display("ASSERT FAILED: Expected = %h, Actual = %h", exp, act); \
		$finish; \
		end
		
module tb_mySevenSegmentDisplay();
	
	reg[3:0] in;
	wire[6:0] out;
	
	mySevenSegmenetDisplay UUT
	(
		.sevenIn(in),
		.sevenOut(out)
	);
	
	// test setup
	integer i;
	reg[6:0] test[15:0]; // this part was weird. reg[# of indices] test[# of bits in each index]

	initial begin
		// test setup
		test[0] 	= 7'b1000000;
		test[1] 	= 7'b1111001;
		test[2] 	= 7'b0100100;
		test[3] 	= 7'b0110000;
		test[4] 	= 7'b0011001;
		test[5] 	= 7'b0010010;
		test[6] 	= 7'b0000010;
		test[7] 	= 7'b1111000;
		test[8] 	= 7'b0000000;
		test[9] 	= 7'b0011000;
		test[10] 	= 7'b0001000;
		test[11] 	= 7'b0000011;		
		test[12] 	= 7'b1000110;
		test[13] 	= 7'b0100001;
		test[14] 	= 7'b0000110;
		test[15] 	= 7'b0001110;		
	
		$monitor($time, " Input = %h, Output = %h", in, out);
		for(i = 0; i < 16; i = i + 1) begin
			in = i;
			#1 `assert(test[i], out)
		end
		
	end

endmodule