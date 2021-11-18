`timescale 1ns / 1ps
`include "multiply.v"
module FIR(
clk,
rst,
a,b,c,
x,
y
);

input clk,rst;
input[7:0] a,b,c;
input[7:0] x;
output[7:0] y;

reg[7:0] x_n2;
reg[7:0] x_n1;
	wire [7:0] mul_xn2;
	wire [7:0] mul_xn1;
	wire [7:0] mul_xn0;

//your code here=============
multiply mul_x0(.a(x),.b(a),.c(mul_xn0));
multiply mul_x1(.a(x_n1),.b(b),.c(mul_xn1));
multiply mul_x2(.a(x_n2),.b(c),.c(mul_xn2));

always @(posedge clk or posedge rst) begin
	if (rst) begin
		x_n1 <= 0;
		x_n2 <= 0;
	end
	else begin
		x_n2 <= x_n1;
		x_n1 <= x;
	end
end
//your code here=============
assign y = mul_xn0+mul_xn1+mul_xn2;

endmodule
