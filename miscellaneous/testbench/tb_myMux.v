`timescale 1ns/1ns

`define assert(act, exp) \
	if(act != exp) begin \
		$display("ASSERT FAILED: expected = %h, actual = %h\n", exp, act); \
		$finish; \
		end

module tb_myMux();

	parameter WIDTH = 2;
	reg[WIDTH-1:0] SWa;
	reg[WIDTH-1:0] SWb;
	reg[WIDTH-1:0] SWc;
	reg[WIDTH-1:0] SWd;
	reg[WIDTH-1:0] Sel;
	
	wire[WIDTH-1:0] out;
	
	integer i;
	
	myMux #(.WIDTH(WIDTH)) UUT
	(
		.SWa (SWa),
		.SWb (SWb),
		.SWc (SWc),
		.SWd (SWd),
		.Sel (Sel),
		.out (out)
	);
	
	initial begin
		$monitor($time, " SWa = %d, SWb = %d, SWc = %d, SWd = %d, Sel = %d, out = %d\n", SWa, SWb, SWc, SWd, Sel, out);
		#1; Sel = 0; SWa = 0; SWb = 0; SWc = 0; SWd = 0; 
		for(i = 0; i < 10; i = i + 1) begin
			#1; Sel = $urandom; SWa = $urandom; SWb = $urandom; SWc = $urandom; SWd = $urandom;
		end
	end

endmodule