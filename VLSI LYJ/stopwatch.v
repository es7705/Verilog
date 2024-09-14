`timescale 1ns/1ps

module TimeScaleTestTb;

reg[3:0] y;
wire [3:0] x1,x2,x3,x4,x5;

assign #10 x1=y;
assign #10.1 x2=y;
assign #10.11 x3=y;
assign #10.111 x4=y;
assign #10.1111 x5=y;

initial begin
   #0 y = 4'd0;
   #5 y = 4'd9;
end

endmodule 