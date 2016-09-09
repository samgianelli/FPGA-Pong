`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2016 07:39:32 PM
// Design Name: 
// Module Name: DataPathComponentsTimer2_tb
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


module DataPathComponentsTimer2_tb();
    reg Clk_s, Rst_s, En_s;
    wire Tc_s;
  
    timer2 timer2_tb(Clk_s, Rst_s, En_s, Tc_s);
    
    //clock procedure
    always begin
        Clk_s <= 0;
        #10;
        Clk_s <= 1;
        #10;
    end
    
    initial begin
        Rst_s <= 0;
        En_s <= 1;
        @(posedge Clk_s);
        #2000;
    end


endmodule
