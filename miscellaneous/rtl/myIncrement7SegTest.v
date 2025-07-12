/*
* Description:
* Module to test incrementing the 7 segment display with capabilities of getting up to 9999
* 
* Acting as an extra test for switch debouncing
*
*/

module myIncrement7SegTest
(
	clk,
	rst,
	SW0,
	HEX_arr
);

	input clk, rst, SW0;
	output[27:0] HEX_arr; // flattened array for accessing each individual 7 bit HEX value (4 of them)
	
	reg[31:0] count = 0;
	
	wire[3:0] split_out[3:0];
	wire[6:0] HEX[3:0];
	
	// could possibly use a generate loop here? Or create an always@ block looking at count changing specifically (convet to reg though..)
	assign HEX_arr = {HEX[3], HEX[2], HEX[1], HEX[0]}; // MSB -> LSB
	
	mySegmentSplitter splitter
	(
		.count(count),
		.out1(split_out[0]),
		.out2(split_out[1]),
		.out3(split_out[2]),
		.out4(split_out[3])
	);
	
	generate
		genvar i;
		for(i = 0; i < 4; i = i + 1) begin : SevenSegment
			mySevenSegmentDisplay seg
			(
				.sevenIn(split_out[i]),
				.sevenOut(HEX[i])
			);
		end
	endgenerate	
	
	always@(posedge clk) begin
		if(!rst) begin
			count <= 0;
		end
		else begin
			if(SW0 == 1) begin
				count <= count + 1;
			end
		end
	end

endmodule