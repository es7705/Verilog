module mux_8to1(D,S,F);
input wire [7:0] D;
input wire [2:0] S;
output wire F;

assign F = D[S];
endmodule

module mux_8to1_Tb;
reg [7:0] D
wire [2:0] S;
wire F;

initial begin
#0 S = 3'b000;
#0 D = 8'd7;
end

mux_8to1 U0(.D(D), .S(S), .F(F));
