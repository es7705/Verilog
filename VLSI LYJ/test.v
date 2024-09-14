`timescale 1ns/1ps

module TestTb;

reg[3:0] y;
wire [3:0] x1,x2,x3,x4;

assign #2 x1=y;
assign #4 x2=y;
assign #6.555 x3=y;
assign #6.5555 x4=y;


initial begin
   #0 y = 4'd0;
   #3 y = 4'd9;
end

endmodule 