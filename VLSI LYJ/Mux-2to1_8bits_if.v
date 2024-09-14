`timescale 1ns/1ps

module Mux_2to1_8bits_if(IN1, IN2, SEL, OUT);

input wire [7:0] IN1;
input wire [7:0] IN2;
input wire       SEL;
output reg [7:0] OUT;

always @(*) begin
	if(SEL == 0) OUT <= IN1;
	else         OUT <= IN2;
end
endmodule

module Mux_2to1_8bits_if_Tb;
   reg [7:0] IN1, IN2;
   reg       SEL;
   wire[7:0] OUT;

initial begin
   #0 IN1 = 8'd1;
   #10 IN1 = 8'd2;
end

initial begin
   #0 IN2 = 8'd3;
   #10 IN2 = 8'd4;
end

initial begin
   #0 SEL = 8'b00;
   #10 SEL = 8'b01;
end

Mux_2to1_8bits_if I0(.IN1(IN1), .IN2(IN2), .SEL(SEL) ,.OUT(OUT));
endmodule