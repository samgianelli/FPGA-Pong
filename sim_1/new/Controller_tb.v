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


module Controller_tb();
    reg Rst_s, b_s, p_s, Clk_s, T5_in_s;
    wire [7:0] out_s;
    wire T5_en_s, T20_en_s, Hit_ld_s, Hit_clr_s, Lvl_clr_s;
    
    Controller Controller_1(Rst_s, b_s, p_s, Clk_s, T5_in_s, out_s, T5_en_s, T20_en_s, Hit_ld_s, Hit_clr_s, Lvl_clr_s);
    
    
    always begin
        Clk_s <= 1;
        #5;
        Clk_s <= 0;
        #5;
    end
    
    initial begin
        Rst_s <= 1;
        b_s <= 0;
        p_s <= 0;
        T5_in_s <= 0;
        #30;
        
        Rst_s <= 0;
        #4;
        
        b_s <= 1;
        @(posedge Clk_s);
        #10;
        b_s <= 0;
        
        #125;
        p_s <= 1;
        @(posedge Clk_s);
        #16; 
        p_s <= 0;
        
        #200;
        T5_in_s <= 1;
        @(posedge Clk_s);
        #5;
        T5_in_s <= 0;
        #100;
    end
        
endmodule
