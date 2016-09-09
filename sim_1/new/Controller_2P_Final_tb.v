`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Diego Jimenez, Sam Gianelli
// 
//  ////////////////THIS IS THE MIDPROJECT AND THE FINAL SUBMISSION///////////////
//
// 
// Create Date: 04/17/2016 04:33:30 PM
// Design Name: 
// Module Name: Controller_2P_Final_tb
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


module Controller_2P_Final_tb();
    reg Rst_s, b_s, p1_s, p2_s, Clk_s, T5_in_s, winner_s, mode_s;
    wire [7:0] out_s;
    wire T5_en_s, T5_rst_s, T20_en_s, T20_rst_s, Hit_ld_s, Hit_clr_s, Lvl_clr_s, P1_ld_s, P1_clr_s, P2_ld_s, P2_clr_s;
    
    Controller_2P Controller_2P_1(Rst_s, b_s, p1_s, p2_s, Clk_s, T5_in_s, winner_s, mode_s, out_s, T5_en_s, T5_rst_s, T20_en_s, T20_rst_s, Hit_ld_s, Hit_clr_s, Lvl_clr_s, P1_ld_s, P1_clr_s, P2_ld_s, P2_clr_s);
    
    always begin
        Clk_s <= 1;
        #5;
        Clk_s <= 0;
        #5;
        end
        
    initial begin
        Rst_s <= 1;
        b_s <= 0;
        p1_s <= 0;
        p2_s <= 0;
        T5_in_s <= 0;
        mode_s <= 0;
        winner_s <= 0;
        #30;
            
        Rst_s <= 0;
        #4;
            
        b_s <= 1;
        @(posedge Clk_s);
        #10;
        b_s <= 0;
            
        #125;
        p1_s <= 1;
        @(posedge Clk_s);
        #16; 
        p1_s <= 0;
            
        #200;
        T5_in_s <= 1;
        @(posedge Clk_s);
        #5;
        T5_in_s <= 0;
        #42;
            
        b_s <= 1;
        @(posedge Clk_s);
        #2;
        b_s <= 0;
        @(posedge Clk_s);
        #32;
        mode_s <= 1;
        #30
        p2_s <= 1;
        #100;
        p2_s <= 0;
        b_s <= 1;
        @(posedge Clk_s);
        #3;
        #30;
        Rst_s <= 1;
        #20;
        Rst_s <= 0;
        b_s <= 1;
        #10;
        b_s <= 0;
        #60;
        p1_s <= 1;
        #20;
        p1_s <= 0;
        b_s <= 0;
        #70;
        p2_s <= 1;
        @(posedge Clk_s);
        #2;
        Rst_s <= 1;
        #10;  
                    
        end


endmodule
