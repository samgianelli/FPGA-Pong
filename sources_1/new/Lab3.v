`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: TosiCorp
// Engineer: Diego Jimenez / Sam Gianelli
// 
// Create Date: 02/16/2016 04:31:57 PM
// Design Name: 
// Module Name: Lab3
// Project Name:     (THIS IS NOT THE FINAL TOP MODULE, THIS IS ONLY FOR PART 1)
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
    output [7:0] out;
    wire N1;

    ClkDiv ClkDiv_1(Clk, in, Rst, N1);
    //ButtonSync ButtonSync_1(Play, N1, PlayOut);
    LightPatternGenerator LightPatternGenerator_1(Rst, Begin, Play, N1, out);
    
endmodule
