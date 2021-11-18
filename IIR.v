`timescale 1ns / 1ps
`include "multiply.v"

module IIR(
clk,
rst,
a,b,c,d,
x,
y
);

input clk,rst;
input[7:0] a,b,c,d;
input[7:0] x;
output[7:0] y;

reg [7:0] x_n1;
reg [7:0] y_n1;
reg [7:0] y_n2;

wire [7:0] m_x;
wire [7:0] m_x1;
wire [7:0] m_y1;
wire [7:0] m_y2;

//your code here=============
	multiply mx(.a(x), .b(a), .c(m_x));
	multiply mx1(.a(x_n1), .b(b), .c(m_x1));
	multiply my1(.a(y_n1), .b(c), .c(m_y1));
	multiply my2(.a(y_n2), .b(d), .c(m_y2));

	always @(posedge clk or posedge rst) begin
		if (rst) begin 
			x_n1 <=0;
			y_n1 <=0;
			y_n2 <=0;
		end
		else begin
			x_n1 <= x;
			y_n2 <= y_n1;
			y_n1 <= y;
		end
	end

assign y =	m_x + m_x1 + m_y1 + m_y2;
//your code here=============

endmodule
