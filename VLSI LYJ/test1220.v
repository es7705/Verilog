`timescale 1ns/1ps
module FulAdder(x,y,z,S,C);
	input wire x,y,z;
	output reg S,C;

always @(x or y or z)
	{C, S} = x + y + z;
endmodule

module FullAdder_Tb;
reg x,y,z;
wire S,C;

initial begin
	#0 x = 1'b0;
end

initial begin
	#0 y = 1'b0;
end

initial begin
	#0 z = 1'b0;
end

FullAdder U0(.x(x), .y(y), .z(z), .S(S), .C(C));

endmodule


