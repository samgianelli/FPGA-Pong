`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: TosiCorp
// Engineer: Sam Gianelli / Diego Jimenez
// 
// Create Date: 02/16/2016 02:10:54 PM
// Design Name: 
// Module Name: ClkDiv
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


module ClkDiv(Clk, in, Rst, ClkOut);
    input Clk, Rst;
    input [3:0] in;
    output reg ClkOut;
    // to create 1 Hz clock from 100-MHz on the board
    reg [26:0] DivVal;
    reg [26:0] DivCnt;
    reg ClkInt;
    
    always @(in) begin
        case (in)
            4'b0000 : DivVal = 100000000;
            4'b0001 : DivVal = 50000000;
            4'b0010 : DivVal = 25000000;
            4'b0011 : DivVal = 12500000;
        endcase
    end
    
    always @(posedge Clk) begin
        if( Rst == 1) begin
            DivCnt <= 0;
            ClkOut <= 0;
            ClkInt <= 0;
        end
        else begin
          if (DivCnt >= DivVal) begin
                ClkOut <= ~ClkInt;
                ClkInt <= ~ClkInt;
                DivCnt <= 0;
        end
        else begin
            ClkOut <= ClkInt;
            ClkInt <= ClkInt;
            DivCnt <= DivCnt + 1;
        end
    end
end
endmodule
