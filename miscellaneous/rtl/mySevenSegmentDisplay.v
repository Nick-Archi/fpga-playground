/*
*
* Description:
* 7 segment display on De1-SoC is common anode (0 to turn on, 1 to turn off)
*
* Objective:
* [] Update on my ECE 5440 code to provide input to the 7 segment display
* [] Add hexadecimal values
*
*/

/*
	Description:
	My own code for a seven segment display module

	numbers correspond to bit on the display
	
        -----0-----
       |           |
       |           |
       5           1
       |           |
       |           |
        -----6-----
       |           |
       |           |
       4           2
       |           |
       |           |
        -----3-----

	Documentation from the DE2-115 User manual
	Low voltage = Turn on, High voltage = turn off
*/

module mySevenSegmentDisplay(sevenIn, sevenOut);

// declarations
input [3:0] sevenIn; // 4bit input
output [6:0] sevenOut; // 7bit output 
reg [6:0] sevenOut; // reg type b/c sevenOut changes

// implementation
always@(sevenIn) 
	begin
		case(sevenIn)
// turn on 0
			4'b0000:	begin
				sevenOut = 7'b1000000;
				end

// turn on 1
			4'b0001:	begin
				sevenOut = 7'b1111001;
				end
				
// turn on 2
			4'b0010:	begin
				sevenOut = 7'b0100100;
				end
				
// turn on 3
			4'b0011:	begin
				sevenOut = 7'b0110000;
				end
				
// turn on 4
			4'b0100:	begin
				sevenOut = 7'b0011001;
				end
				
// turn on 5
			4'b0101:	begin
				sevenOut = 7'b0010010;
				end
				
// turn on 6
			4'b0110:	begin
				sevenOut = 7'b0000010;
				end
				
// turn on 7
			4'b0111:	begin
				sevenOut = 7'b1111000;
				end
				
// turn on 8
			4'b1000:	begin
				sevenOut = 7'b0000000;
				end
				
// turn on 9
			4'b1001:	begin
				sevenOut = 7'b0011000;
				end
				
// uppercase A				
			4'b1010: begin
				sevenOut = 7'b0001000;
			end
			
// lowercase b
			4'b1011: begin
				sevenOut = 7'b0000011;
			end			

// uppercase C				
			4'b1100: begin
				sevenOut = 7'b1000110;
			end			
			
// lowercase d				
			4'b1101: begin
				sevenOut = 7'b0100001;
			end			
			
// uppercase E				
			4'b1110: begin
				sevenOut = 7'b0000110;
			end			
			
// uppercase F				
			4'b1111: begin
				sevenOut = 7'b0001110;
			end			
						
// default -> Something...
			default:	begin
				sevenOut = 7'b0010100;
				end
		endcase 
	end // end of always

endmodule


