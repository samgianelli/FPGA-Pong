`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: TosiCorp.
// Engineer: Diego Jimenez, Sam Gianelli
// 
//  ////////////////THIS IS THE MIDPROJECT AND THE FINAL SUBMISSION///////////////
//
// Create Date: 03/21/2016 11:10:18 AM
// Design Name: 
// Module Name: DataPathComponents
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
/////////////////////////////////////////////////////////////////////////////////////////


module DataPathComponents();

endmodule
/////////////////////////////////////////////////////////////////////////////////////////

module counter1(Clk, Rst, En, C);
    input Clk, Rst, En;
    output reg [7:0] C;
    
    initial begin
        C <= 0;
    end
    
    always@(posedge Clk, posedge Rst) begin
        if (Rst == 1)
            C <= 0;
        else if (En == 1)
            C <= C + 1;
    end
    
endmodule
//////////////////////////////////////////////////////////////////////////////////////////
    
module timer20(Clk, Rst, En, Tc);
    input Clk, Rst, En;
    output reg Tc;    
    // to create 1 Hz clock from 100-MHz on the board
    reg [30:0] DivVal;
    reg [30:0] DivCnt;
    
    initial begin
        DivVal = 2000000000;
        DivCnt = 0;
    end
    
    always @(posedge Clk, posedge Rst) begin
        if (Rst == 1) begin
            Tc <= 0;
            DivCnt <= 0;
        end
        else if (En == 1 && DivCnt == DivVal) begin
            Tc <= 1;
            DivCnt <= 0;
        end
        else if (En == 1) begin
            DivCnt <= DivCnt + 1;
            Tc <= 0;
        end
    end
    
endmodule
////////////////////////////////////////////////////////////////////////////////////////////

module timer5(Clk, Rst, En, Tc);
    input Clk, Rst, En;
    output reg Tc;    
    // to create 1 Hz clock from 100-MHz on the board
    reg [30:0] DivVal;
    reg [60:0] DivCnt;
    
    initial begin
        DivVal = 500000000;
        DivCnt = 0;
    end
    
    always @(posedge Clk, posedge Rst) begin
        if (Rst == 1) begin
            Tc <= 0;
            DivCnt <= 0;
        end
        else if (En == 1 && DivCnt >= DivVal) begin
            Tc <= 1;
            //DivCnt <= 0;
        end
        else if (En == 1) begin
            DivCnt <= DivCnt + 1;
            Tc <= 0;
        end
    end
    
endmodule

/////////////////////////////////////////////////////////////////////////////////

module ClkDiv_Level(Clk, in, Rst, ClkOut);
    input Clk, Rst;
    input [3:0] in;
    output reg ClkOut;
    // to create 1 Hz clock from 100-MHz on the board
    reg [26:0] DivVal;
    reg [26:0] DivCnt;
    reg ClkInt;
    
    always @(in) begin
        case (in)
            4'b0000 : DivVal = 50000000;
            4'b0001 : DivVal = 50000000;
            4'b0010 : DivVal = 45000000;
            4'b0011 : DivVal = 40000000;
            4'b0100 : DivVal = 35000000;
            4'b0101 : DivVal = 30000000;
            4'b0110 : DivVal = 25000000;
            4'b0111 : DivVal = 20000000;
            4'b1000 : DivVal = 15000000;
            4'b1001 : DivVal = 10000000;
            4'b1010 : DivVal = 5000000;
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

/////////////////////////////////////////////////////////////////////////////

module ClkDiv_Switch(Clk, in, Rst, ClkOut);
    input Clk, Rst;
    input [1:0] in;
    output reg ClkOut;
    // to create 1 Hz clock from 100-MHz on the board
    reg [26:0] DivVal;
    reg [26:0] DivCnt;
    reg ClkInt;
    
    always @(in) begin
        case (in)
            2'b00 : DivVal = 50000000;
            2'b01 : DivVal = 35000000;
            2'b10 : DivVal = 20000000;
            2'b11 : DivVal = 5000000;
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

/////////////////////////////////////////////////////////////////////////////

module lessThan(a,b,c);
    input [3:0] a,b;  // change to [7:0] for 2P
    output reg c;

    always@(a or b) begin
        if (a < b) 
	       c<=1;
        else
	       c<=0;
    end
endmodule

//////////////////////////////////////////////////////////////////////////////

module greaterOrEqual(a, b, c);
    input [7:0] a, b;
    output reg c;
    
    always @(a or b) begin
        if (a > b || a == b)
            c <= 1;
        else 
            c <= 0;
    end
endmodule

/////////////////////////////////////////////////////////////////////////////

module Bit8Reg(clk,clr,ld,value,rvalue);
    input clk, clr, ld;
    input [7:0] value;
    output reg [7:0] rvalue;

always@(posedge clk) begin
	if (clr == 1)
		rvalue <=0;
	else if (ld ==1)
		rvalue <= value;
end		

endmodule

///////////////////////////////////////////////////////////////////////////////

module Bit8CountReg(clk,clr,ld,rvalue);
    input clk, clr, ld;
    output reg [7:0] rvalue;

always@(posedge clk) begin
	if (clr == 1)
		rvalue <=0;
	else if (ld ==1)
		rvalue <= rvalue + 1;
end		

endmodule

///////////////////////////////////////////////////////////////////////////////

module Bit8RegMod(clk,clr,ld,value,rvalue);
    input clk, clr, ld;
    input [7:0] value;
    output reg [7:0] rvalue;

always@(posedge clk) begin
	if (clr == 1)
		rvalue <= 8'b00000001;
	else if (ld ==1)
		rvalue <= value + 1;
end		

endmodule

///////////////////////////////////////////////////////////////////////////////

module Bit4Reg(clk,clr,ld,value,rvalue);
    input clk, clr, ld;
    input [3:0] value;
    output reg [3:0] rvalue;

always@(posedge clk) begin
	if (clr == 1)
		rvalue <=0;
	else if (ld ==1)
		rvalue <= value;
end		

endmodule

//////////////////////////////////////////////////////////////////////////////

module And2(x, y, F);
    input x, y;
    output F;
    reg F;
    
    always @(x,y) begin
        F <= x & y;
    end
endmodule

/////////////////////////////////////////////////////////////////////////////////

module Or2(x, y, F);
    input x, y;
    output F;
    reg F;
    
    always @(x, y) begin
        F <= x | y;
    end
endmodule

/////////////////////////////////////////////////////////////////////////////////////

module Mux2By4(x0, x1, select, out);
    input [7:0] x0;
    input [7:0] x1;
    input select;
    output reg [7:0] out;
    
    always @(x0, x1, select) begin
        case(select)
            1'b0: out = x0;
            1'b1: out = x1;
        endcase
    end
endmodule

/////////////////////////////////////////////////////////////////////////////////////