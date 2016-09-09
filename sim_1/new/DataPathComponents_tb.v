`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2016 11:29:11 AM
// Design Name: 
// Module Name: DataPathComponents_tb
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


module DataPathComponents_tb();
    reg Clk_s, Rst_s, En_s;
    wire [7:0] C_s;
  
    counter1 counter1_tb(Clk_s, Rst_s, En_s, C_s);
    
    //clock procedure
    always begin
        Clk_s <= 0;
        #10;
        Clk_s <= 1;
        #10;
    end
    
    initial begin
        Rst_s <= 0;
        @(posedge Clk_s);
        #5;
        
        En_s <= 1;
        #100;
        En_s <= 0;
        #100;
        En_s <= 1;
        #100;
        En_s <= 0;
        #100;
        Rst_s <= 1;
        #10;
        Rst_s <= 0;
        #10;
        
        En_s <= 1;
        #100;
        En_s <= 0;
        #100;
        En_s <= 1;
        #100;
        En_s <= 0;
        #100;
        Rst_s <= 1;
        #10;
        Rst_s <= 0;

    end     
endmodule
