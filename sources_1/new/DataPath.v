`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2016 02:14:42 PM
// Design Name: 
// Module Name: DataPath
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


module DataPath(Clk, Rst, T5_en, T5_rst, T20_en, T20_rst, Hit_ld, Hit_clr, Lvl_clr, T5_out, Clk_out, Hit_out, Lvl_out);
    input Clk, Rst, T5_en, T5_rst, T20_en, T20_rst, Hit_ld, Hit_clr, Lvl_clr;
    output T5_out, Clk_out;
    output [7:0] Hit_out;
    output [3:0] Lvl_out;
    wire [7:0] wa;
    wire [3:0] wb;
    wire wc, wd, we;
    
    timer5 timer5_1(Clk, T5_rst, T5_en, T5_out);
    
    Bit8CountReg Bit8CountReg_1(Clk_out,Hit_clr,Hit_ld,Hit_out);
    
    Bit8CountReg Bit8CountReg_2(Clk,Lvl_clr,we,Lvl_out);
    lessThan lessThan_1(Lvl_out, 9, wc);
    timer20 timer20_1(Clk, T20_rst, T20_en, wd);
    And2 And2_1(wc, wd, we);
    ClkDiv_Level ClkDiv_Level_1(Clk, Lvl_out, Rst, Clk_out);
    
endmodule
