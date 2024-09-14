`timescale 1ns/1ps

module Adder_8bits(
IN1,
IN2,
IN3,
OUT
);

input wire [7:0] IN1;
input wire [7:0] IN2;
input wire [7:0] IN3;
output reg [7:0] OUT;

always @(IN1 or IN2 or IN3) begin
	OUT = IN1 + IN2 + IN3;
end

endmodule

module Adder_8bits_Tb;
   reg [7:0] IN1, IN2, IN3;
   wire[7:0] OUT;

initial begin
   #0 IN1 = 8'd10;
   #10 IN1 = 8'd20;
   #20 IN1 = 8'd30;
end

initial begin
   #0 IN2 = 8'd11;
   #10 IN2 = 8'd21;
   #20 IN2 = 8'd31;
end

initial begin
   #0 IN3 = 8'd12;
   #10 IN3 = 8'd22;
   #20 IN3 = 8'd32;
end

Adder_8bits I0(.IN1(IN1), .IN2(IN2), .IN3(IN3) ,.OUT(OUT));
endmodule
