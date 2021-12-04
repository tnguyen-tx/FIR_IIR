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

reg[7:0] x1;
reg[7:0] x2;

wire[7:0] mula_xn, mulb_xn1, mulc_xn2;

multiply mul0 (.a(a), .b(x), .c(mula_xn));
multiply mul1 (.a(b), .b(x1), .c(mulb_xn1));
multiply mul2 (.a(c), .b(x2), .c(mulc_xn2));

always @(posedge clk or negedge rst) begin
    if (!rst) begin
        x1 <=0;
        x2 <=0;
    end
    else begin
        x1 <= x;
        x2 <= x1;
    end
end

assign y = mula_xn + mulb_xn1 + mulc_xn2;

endmodule //FIR
