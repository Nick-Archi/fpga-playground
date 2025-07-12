/*
* Description:
* That will take a 32 bit number and split it between 4 7 segment displays
* Eg) 1011 (11) => 0 0 1 1
*
* TODO: 
* Maybe extend to other 7 segments on the De1-Soc. Or at least add capability to keep it dynamic (using parameter)
*/
module mySegmentSplitter
(
	count,
	out1,
	out2,
	out3,
	out4
);

	input[31:0] count;
	output[3:0] out1, out2, out3, out4;
	
	assign out1 = count % 10;
	assign out2 = (count / 10) % 10;
	assign out3 = (count / 100) % 10;
	assign out4 = (count / 1000) % 10;

endmodule