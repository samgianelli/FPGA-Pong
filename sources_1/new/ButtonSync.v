`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: TosiCorp
// Engineer: Diego Jimenez, Sam Gianelli
// 
//  ////////////////THIS IS THE MIDPROJECT AND THE FINAL SUBMISSION///////////////
//
// Create Date: 02/16/2016 03:01:04 PM
// Design Name: 
// Module Name: ButtonSync
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


module ButtonSync(bi, Clk, bo);
    input bi, Clk;
    output reg bo;
    reg [1:0] State, StateNext;
    
    parameter S_Wait = 0, S_Out = 1, S_Hold = 2;
    
    initial begin
        State <= S_Wait;
    end
     
    //State Register
    always @(posedge Clk) begin
        State <= StateNext;
    end
    
    always @(bi, State) begin
        case (State)
            S_Wait: begin
                bo <= 0;
                if (bi == 1) begin
                    StateNext <= S_Out;
                end
                else begin
                    StateNext <= S_Wait;
                end
            end
            
            S_Out: begin
                bo <= 1;
                if (bi == 1) begin
                    StateNext <= S_Hold;
                end
                else begin
                    StateNext <= S_Wait;
                end
            end
            
            S_Hold: begin
                bo <= 0;
                if (bi == 1) begin
                    StateNext <= S_Hold;
                end
                else begin
                    StateNext <= S_Wait;
                end
            end
        endcase
    end

endmodule
