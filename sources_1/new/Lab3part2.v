`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TosiCorp
// Engineer: Sam Gianelli, Diego Jimenez
// 
// Create Date: 02/20/2016 03:14:41 PM
// Design Name: 
// Module Name: Lab3part2   (THIS IS THE FINAL TOP MODULE)
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Lab3part2(Clk, in, Rst, Play, Begin, out);
    input Clk, Rst, Play, Begin;
    input [3:0] in;
    output [7:0] out;
    wire N1; 
    wire ButtonOut;

    ClkDiv ClkDiv_1(Clk, in, Rst, N1);
    ButtonSync ButtonSync_1(Play, N1, ButtonOut);
    LightPatternGenerator LightPatternGenerator_1(Rst, Begin, ButtonOut, N1, out);
    
endmodule