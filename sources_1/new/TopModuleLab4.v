`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
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

module TopModuleLab4(Clk, Rst, b, p1, LightOut, out, en_out);
    input Clk, Rst, b, p1;
    output [7:0] LightOut;
    output [6:0] out;
    output [7:0] en_out;
    wire Tc;
    wire [7:0] Hit_out;
    wire [3:0] Lvl_out;
    wire T5, T5_en, T5_rst, T20_en, T20_rst, Hit_ld, Hit_clr, Lvl_clr, po;
    
    ButtonSync ButtonSync_1(p1, Clk_out, po);
    
    Controller Controller_1(Rst, b, po, Clk_out, T5, LightOut, T5_en, T5_rst, T20_en, T20_rst, Hit_ld, Hit_clr, Lvl_clr);
    DataPath DataPath_1(Clk, Rst, T5_en, T5_rst, T20_en, T20_rst, Hit_ld, Hit_clr, Lvl_clr, T5, Clk_out, Hit_out, Lvl_out);
   
    TwoDigitDisplayUpgrade TwoDigitDisplayUpgrade_1(Clk, Lvl_out + 1, Hit_out, out, en_out);
    //timer5 timer5_1(Clk, Rst, 1, Tc);
    //counter1 counter1_1(Clk, Rst, Tc, Number);
    
    
    
endmodule
