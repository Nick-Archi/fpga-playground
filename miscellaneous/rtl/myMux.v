/*
* Objective:
* Simple 4:1 multiplexer. 
*/

module myMux
	#(parameter WIDTH = 2)
(
	input[WIDTH-1:0] SWa,
	input[WIDTH-1:0] SWb,
	input[WIDTH-1:0] SWc,
	input[WIDTH-1:0] SWd,
	input[WIDTH-1:0] Sel,
	
	output reg[WIDTH-1:0] out
);

always@(SWa, SWb, SWc, SWd, Sel) begin
	case(Sel) 
	
		2'b00: begin
			out = SWa;
		end
		
		2'b01: begin
			out = SWb;
		end
	
		2'b10: begin
			out = SWc;
		end
		
		2'b11: begin
			out = SWd;
		end
		
		default: begin
			out = 0;
		end
	
	endcase
end

endmodule