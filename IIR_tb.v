`timescale 1ns / 1ps
`include "IIR.v"

module IIR_tb( y
    );


reg clk,rst;
reg[7:0] a,b,c,d;
reg[7:0] x;
output[7:0] y;


IIR iir0(
clk,
rst,
a,b,c,d,
x,
y
);

initial begin
clk=0;
rst=0;
a=0.5*16;//0.5
b=256-1.5*16;//-1.5
c=2*16;//2.0
d=256-1*16;//-1
x=8'b0000_0000;

#4 rst=1;

#100 $finish;
end

always #1 begin
    clk<=~clk;
end

always@(posedge clk or negedge rst) begin
    if (!rst) x <= 0;
    else 
    x <= x+(1<<4);
end

initial begin
    $recordfile("waveform_IIR.trn");
    $recordvars();
end

endmodule
