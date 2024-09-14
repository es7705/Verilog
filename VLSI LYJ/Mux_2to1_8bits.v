`timescale 1ns/1ps

module Mux_2to1_8bits_IF(IN1, IN2, SEL, OUT);

input wire [7:0] IN1;
input wire [7:0] IN2;
input wire       SEL;
output reg [7:0] OUT;

always @(*) begin
	if(SEL == 0) OUT <= IN1;
	else         OUT <= IN2;
end
endmodule

module Mux_2to1_8bits_CASE(IN1, IN2, SEL, OUT);

input wire [7:0] IN1;
input wire [7:0] IN2;
input wire       SEL;
output reg [7:0] OUT;

always @(*) begin
   case(SEL)
	1'b0: OUT <= IN1;
 	1'b1: OUT <= IN2;
	default : OUT <= 8'd0;
   endcase
end
endmodule

module Mux_2to1_8bits_COND(IN1, IN2, SEL, OUT);

input wire [7:0] IN1;
input wire [7:0] IN2;
input wire       SEL;
output wire [7:0] OUT;

assign OUT = (SEL == 1'b0) ? IN1 : IN2;
endmodule

module Mux_2to1_8bits_Tb;
   reg [7:0] IN1, IN2;
   reg       SEL;
   wire[7:0] OUT_IF, OUT_CASE, OUT_COND;

initial begin
   #0 IN1 = 8'd1;
   #0 IN2 = 8'd2;
   #0 SEL = 1'b0;
   #10 SEL = 1'b1;
end

Mux_2to1_8bits_IF U0(.IN1(IN1), .IN2(IN2), .SEL(SEL) ,.OUT(OUT_IF));
Mux_2to1_8bits_CASE U1(.IN1(IN1), .IN2(IN2), .SEL(SEL) ,.OUT(OUT_CASE));
Mux_2to1_8bits_COND U2(.IN1(IN1), .IN2(IN2), .SEL(SEL) ,.OUT(OUT_COND));

endmodule
