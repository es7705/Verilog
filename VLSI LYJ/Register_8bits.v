`timescale 1ns/1ps

module Register_8bits(
   input wire clk,
   input wire nrst,
   input wire wen,
   input wire [7:0] IN,
   output reg [7:0] OUT);



always @(posedge clk or negedge nrst)begin
   if(!nrst) OUT <= 8'b0;
   else if(wen) OUT <= IN;
end
endmodule

module Register_8bits_Tb;
reg clk, nrst, wen;
reg [7:0] IN;
wire [7:0] OUT;

initial begin
   clk = 0;
   #10 clk = 0;
   forever #10 begin 
	clk = ~clk;
   end
end

initial begin
   #0 IN <= 8'd10;
   #35 IN <= 8'd20;
   #20 IN <= 8'd30;
   #20 IN <= 8'd40;
   #20 IN <= 8'd50;
   #20 IN <= 8'd60;
   #20 IN <= 8'd70;
   #20 IN <= 8'd80;
   #20 IN <= 8'd90;
end

initial begin
   #0 wen <= 1'b0;
   #10 wen <= 1'b1;
   #150 wen <= 1'b0;
end

initial begin
   #0 nrst <= 1'b0;
   #10 nrst <= 1'b1;
   #250 nrst <= 1'b0;	
end

Register_8bits U0(.clk(clk), .IN(IN), .nrst(nrst), .wen(wen), .OUT(OUT));
endmodule
