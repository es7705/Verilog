`timescale 1ns/1ps

module Adder_16bits(
input wire [15:0] IN1,
input wire [15:0] IN2,
output wire[15:0] OUT); 



assign OUT = IN1 + IN2;

endmodule

module Adder_16bits_Tb;
reg [15:0] IN1;
reg [15:0] IN2;
wire[15:0] OUT;

initial begin
   #0 IN1 = 16'd10;
   #10 IN1 = 16'd20;
   #20 IN1 = 16'd30;
   #30 IN1 = 16'd40;
   #40 IN1 = 16'd50;

end

initial begin
   #0 IN2 = 16'd11;
   #10 IN2 = 16'd21;
   #20 IN2 = 16'd31;
   #35 IN2 = 16'd41;
   #40 IN2 = 16'd51;
end

Adder_16bits U0(.IN1(IN1), .IN2(IN2), .OUT(OUT));
endmodule
