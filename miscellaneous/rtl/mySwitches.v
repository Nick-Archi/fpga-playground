/*
* Objective:
* Module to interface switches with corresponding LED
*/

module mySwitches
# (parameter WIDTH = 4)
(
	SW,
	LEDR
);

input[WIDTH-1:0] SW;
output[WIDTH-1:0] LEDR;

assign LEDR = SW;

endmodule