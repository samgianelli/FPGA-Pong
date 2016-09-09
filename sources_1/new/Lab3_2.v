`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2016 03:11:16 PM
// Design Name: 
// Module Name: Lab3_2
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

module Lab3(Clk, in, Rst, Play, Begin, out);
    input Clk, Rst, Play, Begin;
    input [3:0] in;
    output reg [7:0] out;
    wire N1, N2;

    ClkDiv ClkDiv_1(Clk, in, Rst, N1);
    ButtonSync ButtonSync_1(Play, N2, PlayOut);
    LightPatternGenerator(Rst, Begin, N2, N1, out);
    
endmodule