`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Diego Jimenez, Sam Gianelli
// 
//  ////////////////THIS IS THE MIDPROJECT AND THE FINAL SUBMISSION///////////////
//
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


module DataPath_2P(Clk, Rst, switch, mode, T5_en, T5_rst, T20_en, T20_rst, Hit_ld, Hit_clr, Lvl_clr, P1_ld, P1_clr, P2_ld, P2_clr, T5_out, Clk_out, winner, L_Dig, R_Dig);
    input Clk, Rst, mode, T5_en, T5_rst, T20_en, T20_rst, Hit_ld, Hit_clr, Lvl_clr, P1_ld, P1_clr, P2_ld, P2_clr;
    input [1:0] switch;
    output T5_out, Clk_out, winner;
    output [7:0] L_Dig;
    output [7:0] R_Dig;
    wire [7:0] wa, Hit_out_w, Lvl_out_w, lvl_Clk_w, switch_Clk_w;
    wire [7:0] wb, wP1a, wP1b, wP1Comp, wP2a, wP2b, wP2Comp;
    wire wc, wd, we, wf;
    
    // 5 Sec Timer
    timer5 timer5_1(Clk, T5_rst, T5_en, T5_out);
    
    // incrementing of Hits and P2 and selecting with mux
    Bit8CountReg Bit8CountReg_1(Clk_out,Hit_clr,Hit_ld,Hit_out_w);
    counter1 counter1_3(Clk, Rst, P2_ld, wP2a);
    Bit8CountReg Bit8CountReg_2(Clk_out,P2_clr,P2_ld,wP2b);
    Mux2By4 Mux2By4_1(Hit_out_w, wP2b, mode, R_Dig); 
    
    // incrementing of Level and P1 and selecting with mux
    Bit8CountReg Bit8CountReg_3(Clk,Lvl_clr,we,Lvl_out_w);
    lessThan lessThan_1(Lvl_out_w, 9, wc);
    timer20 timer20_1(Clk, T20_rst, T20_en, wd);
    And2 And2_1(wc, wd, we);
    Bit8CountReg Bit8CountReg_4(Clk_out,P1_clr,P1_ld,wP1b);
    Mux2By4 Mux2By4_2(Lvl_out_w+8'b00000001, wP1b, mode, L_Dig);
    
    // comparing P1 and P2 with 5 and checking for winner
    greaterOrEqual greaterOrEqual_1(wP1b, 5, wP1Comp);
    greaterOrEqual greaterOrEqual_2(wP2b, 5, wP2Comp);
    Or2 Or2_1(wP1Comp, wP2Comp, winner);
    
    // selecting for which clock divider to use
    ClkDiv_Level ClkDiv_Level_1(Clk, Lvl_out_w, Rst, lvl_Clk_w);
    ClkDiv_Switch ClkDiv_Switch_1(Clk, switch, Rst, switch_Clk_w);
    Mux2By4 Mux2By4_3(lvl_Clk_w, switch_Clk_w, mode, Clk_out);
    
endmodule
