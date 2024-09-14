`timescale 1ns/1ps

module Add_8bits(
   input wire [7:0] IN1,
   input wire [7:0] IN2,
   output wire [7:0] OUT);

assign OUT = IN1 + IN2;

endmodule

module Sub_8bits(
   input wire [7:0] IN1,
   input wire [7:0] IN2,
   output wire [7:0] OUT);

assign OUT = IN1 - IN2;

endmodule

module Mul_8bits(
   input wire [7:0] IN1,
   input wire [7:0] IN2,
   output wire [7:0] OUT);

assign OUT = IN1 * IN2;

endmodule

module Div_8bits(
   input wire [7:0] IN1,
   input wire [7:0] IN2,
   output wire [7:0] OUT);

assign OUT = IN1 / IN2;

endmodule

module Mux_4to1_8bits(
   output reg [7:0] OUT,
   input wire [1:0] SEL,
   input wire [7:0] IN1,
   input wire [7:0] IN2,
   input wire [7:0] IN3,
   input wire [7:0] IN4
);

always @(*) begin
   case(SEL)
	2'b00: OUT <= IN1;
 	2'b01: OUT <= IN2;
	2'b10: OUT <= IN3;
 	2'b11: OUT <= IN4;
	default : OUT <= 8'd0;
   endcase
end

endmodule

module Alu_8bits(
   output wire [7:0] RESULT,
   input  wire [1:0] OPERATION, //0:ADD, 1:SUM, 2:MUL, 3:DIV
   input  wire [7:0] OPERAND1,
   input  wire [7:0] OPERAND2);

wire [7:0] add_out, sub_out, mul_out, div_out;

Add_8bits add_8bits(.IN1(OPERAND1), . IN2(OPERAND2), .OUT(add_out));
Sub_8bits sub_8bits(.IN1(OPERAND1), . IN2(OPERAND2), .OUT(sub_out));
Mul_8bits mul_8bits(.IN1(OPERAND1), . IN2(OPERAND2), .OUT(mul_out));
Div_8bits div_8bits(.IN1(OPERAND1), . IN2(OPERAND2), .OUT(div_out));

Mux_4to1_8bits mux_8bits(
    .OUT(RESULT),
    .SEL(OPERATION),
    .IN1(add_out),
    .IN2(sub_out),
    .IN3(mul_out),
    .IN4(div_out));
endmodule

module Alu_8bits_Tb;

reg [1:0] SEL;
reg [7:0] IN1, IN2;
wire [7:0] OUT;

initial begin 
   #0 SEL = 2'b00;
   #10 SEL = 2'b01;
   #10 SEL = 2'b10;
   #10 SEL = 2'b11;
end

initial begin
   #0 IN1 <= 8'd2;
end

initial begin
   #0 IN2 <= 8'd2;
end

Alu_8bits U0 (.OPERATION(SEL), .OPERAND1(IN1), .OPERAND2(IN2), .RESULT(OUT));

endmodule