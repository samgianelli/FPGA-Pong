`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2016 11:08:30 AM
// Design Name: 
// Module Name: TopModuleLab4_tb
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


module TopModuleLab4_tb();
    reg Clk_s, Rst_s, b_s, p_s;
    wire [7:0] LightOut_s;
    wire [6:0] out_s;
    wire [7:0] en_out_s
    
    TopModuleLab4 TopModuleLab4_1(Clk_s, Rst_s, b_s, p_s, LightOut_s, out_s, en_out_s);
    
    always begin
        Clk_s <= 1;
        #5;
        Clk_s <= 0;
        #5;
    end
    
    initial begin
        Rst_s <= 1;
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
    end
        
endmodule
