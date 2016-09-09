`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Diego Jimenez / Sam Gianelli
// 
// Create Date: 02/20/2016 01:42:02 PM
// Design Name: 
// Module Name: LightPatternGenerator_tb
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


module LightPatternGenerator_tb();
    reg r_s, b_s, p_s, Clk_s;
    wire [7:0] out_s;
    
    LightPatternGenerator LightPatternGenerator_1(r_s, b_s, p_s, Clk_s, out_s);
    
    //clock procedure
    always begin
        Clk_s <= 0;
        #10;
        Clk_s <= 1;
        #10;
    end
    
    initial begin
        b_s <= 0;
        #20;
        
        b_s <= 1;
        #40;
        
        b_s <= 0;
        #260;
        
        p_s <= 1;
        #80;
        
        p_s <= 0;
        #310;
        
        r_s <= 1;
        #10;
        r_s <= 0;
        #40;
        
        b_s <= 1;
        #100;
        b_s <= 0;
        #10
        r_s <= 1;
        #10;
        r_s <= 0;
        #40;
        
        b_s <= 1;
        #100;
        b_s <= 0;
        #193;
        b_s <= 1;
        r_s <= 1;
        p_s <= 1;
        #40;
        b_s <= 0;
        p_s <= 0;
        r_s <= 0;
    
    end      
    
endmodule
