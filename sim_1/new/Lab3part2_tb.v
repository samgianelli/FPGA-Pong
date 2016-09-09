`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TosiCorp
// Engineer:  Diego Jimenez, Sam Gianelli
// 
// Create Date: 03/06/2016 04:57:29 PM
// Design Name: 
// Module Name: Lab3part2_tb
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


module Lab3part2_tb();
    reg Clk_s, Rst_s, Play_s, Begin_s;
    wire [7:0] out_s;
    wire ButtonOut_s;
    
    Lab3part2 Lab3part2_tb(Clk_s, Rst_s, Play_s, Begin_s, ButtonOut_s, out_s);
    
    //Clock Procedure
    always begin
        Clk_s <= 0;
        #10;
        Clk_s <= 1;
        #10;
    end
    
    initial begin
        Rst_s <= 1;
        #10;
        Rst_s <= 0;
        #5;
        
        Begin_s <= 1;
        @(posedge Clk_s);
        #5;
        Begin_s <= 0;
        #260;
        
        Play_s <= 1;
        @(posedge Clk_s);
        @(posedge Clk_s);
        #5;
        Play_s <= 0;
        #180;
        
        Play_s <= 1;
        #100;
        Play_s <= 0;
        #60;
        
        Rst_s <= 1;
        #5;
        Rst_s <= 0;
        #20;
        
        Begin_s <= 1;
        @(posedge Clk_s);
        #5;
        Begin_s <= 0;
        
        #645;
    end   

endmodule
