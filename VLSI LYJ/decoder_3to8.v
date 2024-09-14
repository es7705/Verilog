`timescale 1ns/1ps

module decoder_3_to_8(
X, Y); 

input wire [2:0] X;
output reg [7:0] Y;

always @(*)
begin
   case(X)
     3'b000 : Y = 8'b00000001; //0
     3'b001 : Y = 8'b00000010; //1
     3'b010 : Y = 8'b00000100; //2
     3'b011 : Y = 8'b00001000; //3
     3'b100 : Y = 8'b00010000; //4
     3'b101 : Y = 8'b00100000; //5
     3'b110 : Y = 8'b01000000; //6
     3'b111 : Y = 8'b10000000; //7
     default : Y = 8'b00000001; //0
   endcase
end

endmodule

module decoder_3_to_8_Tb;
reg [2:0] X;
wire [7:0] Y;

initial begin
   #0 X = 3'd0;
   #10 X = 3'd1;
   #10 X = 3'd2;
   #10 X = 3'd3;
   #10 X = 3'd4;
   #10 X = 3'd5;
   #10 X = 3'd6;
   #10 X = 3'd7;

end

decoder_3_to_8 U0(.X(X), .Y(Y));
endmodule