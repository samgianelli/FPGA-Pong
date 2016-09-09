`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: TosiCorp & Shrek Studios
// Engineer: Diego Jimenez, Sam Gianelli
// 
//  ////////////////THIS IS THE MIDPROJECT AND THE FINAL SUBMISSION///////////////
//
// Create Date: 03/22/2016 02:18:58 PM
// Design Name: 
// Module Name: TopModuleLab4
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

module TopModuleLab4_2P(Clk, Rst, b, p1, p2, mode, switch, LightOut, out, en_out);
    input Clk, Rst, b, p1, p2, mode;
    input [1:0] switch;
    output [7:0] LightOut;
    output [6:0] out;
    output [7:0] en_out;
    wire Tc;
    wire [7:0] R_Dig;
    wire [7:0] L_Dig;
    wire T5_in, T5_en, T5_rst, T20_en, T20_rst, Hit_ld, Hit_clr, Lvl_clr, P1_ld, P1_clr, P2_ld, P2_clr, p1o, p2o;
    
    ButtonSync ButtonSync_1(p1, Clk_out, p1o);
    ButtonSync ButtonSync_2(p2, Clk_out, p2o);
    
    Controller_2P Controller_2P_1(Rst, b, p1o, p2o, Clk_out, T5_in, winner, mode, LightOut, T5_en, T5_rst, T20_en, T20_rst, Hit_ld, Hit_clr, Lvl_clr, P1_ld, P1_clr, P2_ld, P2_clr);
    DataPath_2P DataPath_2P_1(Clk, Rst, switch, mode, T5_en, T5_rst, T20_en, T20_rst, Hit_ld, Hit_clr, Lvl_clr, P1_ld, P1_clr, P2_ld, P2_clr, T5_in, Clk_out, winner, R_Dig, L_Dig);
   
    TwoDigitDisplayUpgrade TwoDigitDisplayUpgrade_1(Clk, R_Dig, L_Dig, out, en_out);
    
endmodule
