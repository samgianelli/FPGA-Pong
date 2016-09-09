`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Diego Jimenez, Sam Gianelli
// 
//  ////////////////THIS IS THE MIDPROJECT AND THE FINAL SUBMISSION///////////////
// 
// 
// Create Date: 04/05/2016 02:45:45 PM
// Design Name: 
// Module Name: Controller
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

module Controller_2P(Rst, b, p1, p2, Clk, T5_in, winner, mode, out, T5_en, T5_rst, T20_en, T20_rst, Hit_ld, Hit_clr, Lvl_clr, P1_ld, P1_clr, P2_ld, P2_clr);
    input Rst, b, p1, p2, Clk, T5_in, winner, mode;
    output reg [7:0] out;
    output reg T5_en, T5_rst, T20_en, T20_rst, Hit_ld, Hit_clr, Lvl_clr, P1_ld, P1_clr, P2_ld, P2_clr;
    reg [4:0] State, StateNext;
    
    parameter S_Wait = 0, S_L0a = 1, S_L1a = 2, S_L2a = 3, S_L3a = 4, S_L4a = 5, S_L5a = 6, S_L6a = 7, S_L7a = 8,
                S_L6b = 9, S_L5b = 10, S_L4b = 11, S_L3b = 12, S_L2b = 13, S_L1b = 14, S_L0b = 15, S_P1LAll = 16, S_P1LNone = 17, S_L1c = 18,
                S_P1Inc = 19, S_P1Wait = 20, S_P2Inc = 21, S_P2LNone = 22, S_P2LAll = 23, S_P2Wait = 24, S_P2_7 = 25, S_AllOFF = 26, S_AllON = 27, S_GO = 28;
                //FIXME: Still need to update all of the states
                
    initial begin
        State <= S_Wait;
    end
    
    //State Register
    always @(posedge Clk, posedge Rst, posedge T5_in) begin  //INCLUDE posedge b ??
        if (Rst == 1) begin
            State <= S_Wait;
        end
        else if (mode == 0 && T5_in == 1) begin
            State <= S_Wait;
        end 
        else if (mode == 1 && T5_in == 1 && (State == S_P1LAll || State == S_P1LNone)) begin
            State <= S_P1Wait;
        end
        else if (mode == 1 && T5_in == 1 && (State == S_P2LAll || State == S_P2LNone)) begin
            State <= S_P2Wait;
        end
        else if (mode == 1 && T5_in == 1 && (State == S_AllOFF || State == S_AllON)) begin
            State <= S_GO;
        end
        else begin
            State <= StateNext;
        end
    end
    
    
    always @(b, p1, p2, winner, mode, State, T5_in) begin
        
        case (State)
            S_Wait: begin
                out <= 8'b00000000;
                T5_en <= 0;
                T20_en <= 0;
                T5_rst <= 1;
                T20_rst <= 1;
                Hit_ld <= 0;
                Hit_clr <= 1;
                Lvl_clr <= 1; 
                P1_ld <= 0;
                P1_clr <= 1;
                P2_ld <= 0;
                P2_clr <= 1;  
                if (b == 1) begin
                    StateNext <= S_L0a;
                end
                else begin
                    StateNext <= S_Wait;
                end
            end
            
            S_L0a: begin
                out <= 8'b00000001;
                T5_en <= 0;
                T20_en <= 1;
                T5_rst <= 0;
                T20_rst <= 0;
                Hit_ld <= 0;
                Hit_clr <= 0;
                Lvl_clr <= 0;
                P1_ld <= 0;
                P1_clr <= 0;
                P2_ld <= 0;
                P2_clr <= 0;    
                StateNext <= S_L1a;
            end 

            S_L1a: begin
                out <= 8'b00000010;
                T5_en <= 0;
                T20_en <= 1;
                T5_rst <= 0;
                T20_rst <= 0;
                Hit_ld <= 0;
                Hit_clr <= 0;
                Lvl_clr <= 0;
                P1_ld <= 0;
                P1_clr <= 0;
                P2_ld <= 0;
                P2_clr <= 0; 
                StateNext <= S_L2a;
            end      
                        
            S_L1c: begin  // second state for counting purposes 
                out <= 8'b00000010;
                T5_en <= 0;
                T20_en <= 1;
                T5_rst <= 0;
                T20_rst <= 0;
                Hit_ld <= 1;  //INSTEAD OF HIT_LD, CAN WE JUST HAVE A REGISTER VAR THAT INCREMENTS IN CONTROLLER AND OUTPUTS LIKE out??
                Hit_clr <= 0;
                Lvl_clr <= 0;
                P1_ld <= 0;
                P1_clr <= 0;
                P2_ld <= 0;
                P2_clr <= 0; 
                StateNext <= S_L2a;   
            end               

            S_L2a: begin
                out <= 8'b00000100;
                T5_en <= 0;
                T20_en <= 1;
                T5_rst <= 0;
                T20_rst <= 0;
                Hit_ld <= 0;
                Hit_clr <= 0;
                Lvl_clr <= 0; 
                P1_ld <= 0;
                P1_clr <= 0;
                P2_ld <= 0;
                P2_clr <= 0;         
                StateNext <= S_L3a;
            end 
            
            S_L3a: begin
                out <= 8'b00001000;
                T5_en <= 0;
                T20_en <= 1;
                T5_rst <= 0;
                T20_rst <= 0;
                Hit_ld <= 0;
                Hit_clr <= 0;
                Lvl_clr <= 0; 
                P1_ld <= 0;
                P1_clr <= 0;
                P2_ld <= 0;
                P2_clr <= 0;            
                StateNext <= S_L4a;
            end      
            
            S_L4a: begin
                out <= 8'b00010000;
                T5_en <= 0;
                T20_en <= 1;
                T5_rst <= 0;
                T20_rst <= 0;
                Hit_ld <= 0;
                Hit_clr <= 0;
                Lvl_clr <= 0; 
                P1_ld <= 0;
                P1_clr <= 0;
                P2_ld <= 0;
                P2_clr <= 0;            
                StateNext <= S_L5a;
            end 

            S_L5a: begin
                out <= 8'b00100000;
                T5_en <= 0;
                T20_en <= 1;
                T5_rst <= 0;
                T20_rst <= 0;
                Hit_ld <= 0;
                Hit_clr <= 0;
                Lvl_clr <= 0;
                P1_ld <= 0;
                P1_clr <= 0;
                P2_ld <= 0;
                P2_clr <= 0; 
                StateNext <= S_L6a;
            end                        

            S_L6a: begin
                out <= 8'b01000000;
                T5_en <= 0;
                T20_en <= 1;
                T5_rst <= 0;
                T20_rst <= 0;
                Hit_ld <= 0;
                Hit_clr <= 0;
                Lvl_clr <= 0;
                P1_ld <= 0;
                P1_clr <= 0;
                P2_ld <= 0;
                P2_clr <= 0; 
                StateNext <= S_L7a;
            end 
            
            S_L7a: begin
                out <= 8'b10000000;
                T5_en <= 0;
                T20_en <= 1;
                T5_rst <= 0;
                T20_rst <= 0;
                Hit_ld <= 0;
                Hit_clr <= 0;
                Lvl_clr <= 0;
                P1_ld <= 0;
                P1_clr <= 0;
                P2_ld <= 0;
                P2_clr <= 0; 
                if (mode == 0 || (mode == 1 && p2 == 1)) begin
                    StateNext <= S_L6b;
                end
                else begin
                    StateNext <= S_P2Inc;
                end
            end    
            
            S_L6b: begin
                out <= 8'b01000000;
                T5_en <= 0;
                T20_en <= 1;
                T5_rst <= 0;
                T20_rst <= 0;
                Hit_ld <= 0;
                Hit_clr <= 0;
                Lvl_clr <= 0;  
                P1_ld <= 0;
                P1_clr <= 0;
                P2_ld <= 0;
                P2_clr <= 0;  
                StateNext <= S_L5b;
            end 

            S_L5b: begin
                out <= 8'b00100000;
                T5_en <= 0;
                T20_en <= 1;
                T5_rst <= 0;
                T20_rst <= 0;
                Hit_ld <= 0;
                Hit_clr <= 0;
                Lvl_clr <= 0;  
                P1_ld <= 0;
                P1_clr <= 0;
                P2_ld <= 0;
                P2_clr <= 0; 
                StateNext <= S_L4b;
            end                        

            S_L4b: begin
                out <= 8'b00010000;
                T5_en <= 0;
                T20_en <= 1;
                T5_rst <= 0;
                T20_rst <= 0;
                Hit_ld <= 0;
                Hit_clr <= 0;
                Lvl_clr <= 0;  
                P1_ld <= 0;
                P1_clr <= 0;
                P2_ld <= 0;
                P2_clr <= 0;       
                StateNext <= S_L3b;
            end 
            
            S_L3b: begin
                out <= 8'b00001000;
                T5_en <= 0;
                T20_en <= 1;
                T5_rst <= 0;
                T20_rst <= 0;
                Hit_ld <= 0;
                Hit_clr <= 0;
                Lvl_clr <= 0;   
                P1_ld <= 0;
                P1_clr <= 0;
                P2_ld <= 0;
                P2_clr <= 0; 
                StateNext <= S_L2b;
            end         
            
            S_L2b: begin
                out <= 8'b00000100;
                T5_en <= 0;
                T20_en <= 1;
                T5_rst <= 0;
                T20_rst <= 0;
                Hit_ld <= 0;
                Hit_clr <= 0;
                Lvl_clr <= 0;
                P1_ld <= 0;
                P1_clr <= 0;
                P2_ld <= 0;
                P2_clr <= 0; 
                StateNext <= S_L1b;
            end  
            
            S_L1b: begin
                out <= 8'b00000010;
                T5_en <= 0;
                T20_en <= 1;
                T5_rst <= 0;
                T20_rst <= 0;
                Hit_ld <= 0;
                Hit_clr <= 0;
                Lvl_clr <= 0;
                P1_ld <= 0;
                P1_clr <= 0;
                P2_ld <= 0;
                P2_clr <= 0; 
                StateNext <= S_L0b;
            end  
            
            S_L0b: begin
                out <= 8'b00000001;
                T5_en <= 0;
                T20_en <= 1;
                T5_rst <= 0;
                T20_rst <= 0;
                Hit_ld <= 0;
                Hit_clr <= 0;
                Lvl_clr <= 0;
                P1_ld <= 0;
                P1_clr <= 0;
                P2_ld <= 0;
                P2_clr <= 0; 
                if (p1 == 1) begin
                    StateNext <= S_L1c;
                end
                else if (p1 == 0 && mode == 1) begin
                    StateNext <= S_P1Inc;
                end
                else begin
                    StateNext <= S_P1LAll;
                end  
            end
            
            S_P1LAll: begin
                out <= 8'b11111111;
                T5_en <= 1;
                T20_en <= 0;
                T5_rst <= 0;
                T20_rst <= 0;
                Hit_ld <= 0;
                Hit_clr <= 0;
                Lvl_clr <= 0;
                P1_ld <= 0;
                P1_clr <= 0;
                P2_ld <= 0;
                P2_clr <= 0; 
                if (T5_in == 1 && mode == 0) begin
                    StateNext <= S_Wait;
                end
                else if (T5_in == 1 && mode == 1) begin
                    StateNext <= S_P1Wait;
                end
                else begin
                    StateNext <= S_P1LNone;
                end
            end
            
            S_P1LNone: begin
                out <= 8'b00000000;
                T5_en <= 1;
                T20_en <= 0;
                T5_rst <= 0;
                T20_rst <= 0;
                Hit_ld <= 0;
                Hit_clr <= 0;
                Lvl_clr <= 0;
                P1_ld <= 0;
                P1_clr <= 0;
                P2_ld <= 0;
                P2_clr <= 0; 
                if (T5_in == 1 && mode == 0) begin
                    StateNext <= S_Wait;
                end
                else if (T5_in == 1 && mode == 1) begin
                    StateNext <= S_P1Wait;
                end
                else begin
                    StateNext <= S_P1LAll;
                end
            end
            
            S_P1Inc: begin
                out <= 8'b00000000;
                T5_en <= 1;
                T20_en <= 0;
                T5_rst <= 0;
                T20_rst <= 0;
                Hit_ld <= 0;
                Hit_clr <= 0;
                Lvl_clr <= 0;
                P1_ld <= 0;
                P1_clr <= 0;
                P2_ld <= 1;
                P2_clr <= 0;
                StateNext <= S_P1LNone; 
            end
            
            S_P1Wait: begin
                out <= 8'b00000000;
                T5_en <= 0;
                T20_en <= 0;
                T5_rst <= 1;
                T20_rst <= 1;
                Hit_ld <= 0;
                Hit_clr <= 0;
                Lvl_clr <= 0;
                P1_ld <= 0;
                P1_clr <= 0;
                P2_ld <= 0;
                P2_clr <= 0;
                if (winner == 0 && b == 1) begin
                    StateNext <= S_L0a;
                end
                else if (winner == 0 && b == 0) begin
                    StateNext <= S_P1Wait;
                end 
                else begin
                    StateNext <= S_AllOFF;
                end
            end
            
            S_P2Inc: begin
                out <= 8'b00000000;
                T5_en <= 1;
                T20_en <= 0;
                T5_rst <= 0;
                T20_rst <= 0;
                Hit_ld <= 0;
                Hit_clr <= 0;
                Lvl_clr <= 0;
                P1_ld <= 1;
                P1_clr <= 0;
                P2_ld <= 0;
                P2_clr <= 0; 
                StateNext <= S_P2LNone;
            end
            
            S_P2LNone: begin
                out <= 8'b00000000;
                T5_en <= 1;
                T20_en <= 0;
                T5_rst <= 0;
                T20_rst <= 0;
                Hit_ld <= 0;
                Hit_clr <= 0;
                Lvl_clr <= 0;
                P1_ld <= 0;
                P1_clr <= 0;
                P2_ld <= 0;
                P2_clr <= 0; 
                if (T5_in == 1) begin
                    StateNext <= S_P2Wait;
                end
                else begin
                    StateNext <= S_P2LAll;
                end
            end
            
            S_P2LAll: begin
                out <= 8'b11111111;
                T5_en <= 1;
                T20_en <= 0;
                T5_rst <= 0;
                T20_rst <= 0;
                Hit_ld <= 0;
                Hit_clr <= 0;
                Lvl_clr <= 0;
                P1_ld <= 0;
                P1_clr <= 0;
                P2_ld <= 0;
                P2_clr <= 0;
                if (T5_in == 1) begin
                    StateNext <= S_P2Wait;
                end
                else begin
                    StateNext <= S_P2LNone; 
                end
            end
            
            S_P2Wait: begin
                out <= 8'b00000000;
                T5_en <= 0;
                T20_en <= 0;
                T5_rst <= 1;
                T20_rst <= 1;
                Hit_ld <= 0;
                Hit_clr <= 0;
                Lvl_clr <= 0;
                P1_ld <= 0;
                P1_clr <= 0;
                P2_ld <= 0;
                P2_clr <= 0; 
                if (winner == 0 && b == 1) begin
                    StateNext <= S_P2_7;
                end 
                else if (winner == 0 && b == 0) begin
                    StateNext <= S_P2Wait;
                end
                else begin
                    StateNext <= S_AllOFF;
                end
            end
            
            S_P2_7: begin
                out <= 8'b10000000;
                T5_en <= 0;
                T20_en <= 1;
                T5_rst <= 0;
                T20_rst <= 0;
                Hit_ld <= 0;
                Hit_clr <= 0;
                Lvl_clr <= 0;
                P1_ld <= 0;
                P1_clr <= 0;
                P2_ld <= 0;
                P2_clr <= 0;
                StateNext <= S_L6b; 
            end
            
            S_AllOFF: begin
                out <= 8'b00000000;
                T5_en <= 1;
                T20_en <= 0;
                T5_rst <= 0;
                T20_rst <= 0;
                Hit_ld <= 0;
                Hit_clr <= 0;
                Lvl_clr <= 0;
                P1_ld <= 0;
                P1_clr <= 0;
                P2_ld <= 0;
                P2_clr <= 0;
                if (T5_in == 1) begin
                    StateNext <= S_GO;
                end
                else begin
                    StateNext <= S_AllON;
                end 
            end
            
            S_AllON: begin
                out <= 8'b11111111;
                T5_en <= 1;
                T20_en <= 0;
                T5_rst <= 0;
                T20_rst <= 0;
                Hit_ld <= 0;
                Hit_clr <= 0;
                Lvl_clr <= 0;
                P1_ld <= 0;
                P1_clr <= 0;
                P2_ld <= 0;
                P2_clr <= 0; 
                if (T5_in == 1) begin
                    StateNext <= S_GO;
                end
                else begin
                    StateNext <= S_AllOFF;
                end
            end
            
            S_GO: begin
                out <= 8'b00000000;
                T5_en <= 0;
                T20_en <= 0;
                T5_rst <= 1;
                T20_rst <= 1;
                Hit_ld <= 0;
                Hit_clr <= 0;
                Lvl_clr <= 0;
                P1_ld <= 0;
                P1_clr <= 0;
                P2_ld <= 0;
                P2_clr <= 0; 
                if (Rst == 0) begin
                    StateNext <= S_GO;
                end
                else begin
                    StateNext <= S_Wait;
                end
            end
            
            default: begin
                out <= 8'b00000000;
            end
       
       endcase
       
   end 
    
endmodule