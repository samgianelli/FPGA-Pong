`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2016 11:35:35 AM
// Design Name: 
// Module Name: Controller_tb
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


module Controller_2P_tb();
    reg Rst_s, b_s, p1_s, p2_s, Clk_s, T5_in_s, winner_s, mode_s;
    wire [7:0] out_s;
    wire T5_en_s, T20_en_s, Hit_ld_s, Hit_clr_s, Lvl_clr_s, P1_ld_s, P1_clr_s, P2_ld_s, P2_clr_s;
    
    Controller_2P Controller_2P_1(Rst_s, b_s, p1_s, p2_s, Clk_s, T5_in_s, winner_s, mode_s, out_s, T5_en_s, T20_en_s, Hit_ld_s, Hit_clr_s, Lvl_clr_s, P1_ld_s, P1_clr_s, P2_ld_s, P2_clr_s);
    
    
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
        #62;
        mode_s <= 1;
        #100;
        
        b_s <= 1;
        @(posedge Clk_s);
        #3;
        b_s <= 0;
        #70;
        p2_s <= 1;
        @(posedge Clk_s);
        #2;
        p2_s <= 0;
        #60
        p1_s <= 1;
        @(posedge Clk_s);
        #30;
        p1_s <= 0;
        @(posedge Clk_s);
        b_s <= 1;
        #1;
        b_s<=0;
        #87
        T5_in_s <= 1;
        @(posedge Clk_s);#2;
        T5_in_s <= 0;
        #40
        winner_s <= 1;
        #40
        T5_in_s <= 1;
        #50
        Rst_s <= 1;
        #10
        b_s <= 1;
        #20;
        mode_s <= 0;
        #30;
        
                
    end
        
endmodule
