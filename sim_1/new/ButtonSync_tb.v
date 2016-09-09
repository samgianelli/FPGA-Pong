`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TosiCorp
// Engineer: Sam Gianelli, Diego Jimenez
// 
// Create Date: 02/16/2016 04:09:09 PM
// Design Name: 
// Module Name: ButtonSync_tb
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


module ButtonSync_tb();
    reg bi_s, Clk_s;
    wire bo_s;
    
    ButtonSync ButtonSync_1(bi_s, Clk_s, bo_s);
    
    //clock procedure
    always begin
        Clk_s <= 0;
        #10;
        Clk_s <= 1;
        #10;
    end
    
    initial begin
            bi_s <= 0;
            #20;
            
            bi_s <= 1;
            #80;
            
            bi_s <= 0;
            #10;
            
    end



endmodule
