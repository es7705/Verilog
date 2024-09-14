`timescale 1ns/1ps

module D_FF(clk, D, nrst,  Q);

input clk;
input D;
input nrst;
output reg Q;

always @(posedge clk or negedge nrst)begin
   if(!nrst) Q <= 1'b0;
   else Q <= D;
end
endmodule

module D_FF_Tb;
reg clk, D, nrst;
wire Q;

initial begin
   clk = 0;
   #10 clk = 0;
   forever #10 begin 
	clk = ~clk;
   end
end

initial begin
   #0 D <= 1'b0;
   #10 D <= 1'b1;
   #15 D <= 1'b0;
   #10 D <= 1'b1;
   #10 D <= 1'b0;
   #10 D <= 1'b1;
   #17 D <= 1'b0;
   #10 D <= 1'b1;
   #12 D <= 1'b0;
   #10 D <= 1'b1;
   #10 D <= 1'b0;
   #15 D <= 1'b1;
   #10 D <= 1'b0;
   #10 D <= 1'b1;
   #15 D <= 1'b0;
   #10 D <= 1'b1;
   #18 D <= 1'b0;
   #10 D <= 1'b1;
   #10 D <= 1'b0;
   #15 D <= 1'b1;
   #12 D <= 1'b0;
   #10 D <= 1'b1;
   #13 D <= 1'b0;
   #10 D <= 1'b1;
end

initial begin
   #0 nrst <= 1'b0;
   #10 nrst <= 1'b1;
   #170 nrst <= 1'b0;	
 
end

D_FF U0(.clk(clk), .D(D), .nrst(nrst), .Q(Q));
endmodule
