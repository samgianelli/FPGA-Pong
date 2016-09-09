`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
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

module Controller(Rst, b, p, Clk, T5_in, out, T5_en, T5_rst, T20_en, T20_rst, Hit_ld, Hit_clr, Lvl_clr);
    input Rst, b, p, Clk, T5_in;
    output reg [7:0] out;
    output reg T5_en, T5_rst, T20_en, T20_rst, Hit_ld, Hit_clr, Lvl_clr;
    reg [4:0] State, StateNext;
    
    parameter S_Wait = 0, S_L0a = 1, S_L1a = 2, S_L2a = 3, S_L3a = 4, S_L4a = 5, S_L5a = 6, S_L6a = 7, S_L7a = 8,
                S_L6b = 9, S_L5b = 10, S_L4b = 11, S_L3b = 12, S_L2b = 13, S_L1b = 14, S_L0b = 15, S_LAll = 16, S_LNone = 17, S_L1c = 18;
                
    initial begin
        State <= S_Wait;
    end
    
    //State Register
    always @(posedge Clk, posedge Rst, posedge T5_in) begin  //INCLUDE posedge b ??
        if (Rst == 1) begin
            State <= S_Wait;
        end
        else if (T5_in == 1) begin
            State <= S_Wait;
        end
        else begin
            State <= StateNext;
        end
    end
    
    
    always @(b, p, State, T5_in) begin
        
        case (State)
            S_Wait: begin
                out <= 8'b00000000;
                T5_en <= 0;
                T5_rst <= 1;
                T20_en <= 0;
                T20_rst <= 1;
                Hit_ld <= 0;
                Hit_clr <= 1;
                Lvl_clr <= 1;   
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
                T5_rst <= 1;
                T20_en <= 1;
                T20_rst <= 0;
                Hit_ld <= 0;
                Hit_clr <= 0;
                Lvl_clr <= 0;   
                StateNext <= S_L1a;
            end 

            S_L1a: begin
                out <= 8'b00000010;
                T5_en <= 0;
                T5_rst <= 0;
                T20_en <= 1;
                T20_rst <= 0;
                Hit_ld <= 0;
                Hit_clr <= 0;
                Lvl_clr <= 0;
                StateNext <= S_L2a;
            end      
                        
            S_L1c: begin  // second state for counting purposes 
                out <= 8'b00000010;
                T5_en <= 0;
                T5_rst <= 0;
                T20_en <= 1;
                T20_rst <= 0;
                Hit_ld <= 1;  //INSTEAD OF HIT_LD, CAN WE JUST HAVE A REGISTER VAR THAT INCREMENTS IN CONTROLLER AND OUTPUTS LIKE out??
                Hit_clr <= 0;
                Lvl_clr <= 0;
                StateNext <= S_L2a;   
            end               

            S_L2a: begin
                out <= 8'b00000100;
                T5_en <= 0;
                T5_rst <= 0;
                T20_en <= 1;
                T20_rst <= 0;
                Hit_ld <= 0;
                Hit_clr <= 0;
                Lvl_clr <= 0;         
                StateNext <= S_L3a;
            end 
            
            S_L3a: begin
                out <= 8'b00001000;
                T5_en <= 0;
                T5_rst <= 1;
                T20_en <= 1;
                Hit_ld <= 0;
                Hit_clr <= 0;
                Lvl_clr <= 0;            
                StateNext <= S_L4a;
            end      
            
            S_L4a: begin
                out <= 8'b00010000;
                T5_en <= 0;
                T5_rst <= 0;
                T20_en <= 1;
                T20_rst <= 0;
                Hit_ld <= 0;
                Hit_clr <= 0;
                Lvl_clr <= 0;            
                StateNext <= S_L5a;
            end 

            S_L5a: begin
                out <= 8'b00100000;
                T5_en <= 0;
                T5_rst <= 0;
                T20_en <= 1;
                T20_rst <= 0;
                Hit_ld <= 0;
                Hit_clr <= 0;
                Lvl_clr <= 0;
                StateNext <= S_L6a;
            end                        

            S_L6a: begin
                out <= 8'b01000000;
                T5_en <= 0;
                T5_rst <= 0;
                T20_en <= 1;
                T20_rst <= 0;
                Hit_ld <= 0;
                Hit_clr <= 0;
                Lvl_clr <= 0;
                StateNext <= S_L7a;
            end 
            
            S_L7a: begin
                out <= 8'b10000000;
                T5_en <= 0;
                T5_rst <= 0;
                T20_en <= 1;
                T20_rst <= 0;
                Hit_ld <= 0;
                Hit_clr <= 0;
                Lvl_clr <= 0;
                StateNext <= S_L6b;
            end    
            
            S_L6b: begin
                out <= 8'b01000000;
                T5_en <= 0;
                T5_rst <= 0;
                T20_en <= 1;
                T20_rst <= 0;
                Hit_ld <= 0;
                Hit_clr <= 0;
                Lvl_clr <= 0;   
                StateNext <= S_L5b;
            end 

            S_L5b: begin
                out <= 8'b00100000;
                T5_en <= 0;
                T5_rst <= 0;
                T20_en <= 1;
                T20_rst <= 0;
                Hit_ld <= 0;
                Hit_clr <= 0;
                Lvl_clr <= 0;  
                StateNext <= S_L4b;
            end                        

            S_L4b: begin
                out <= 8'b00010000;
                T5_en <= 0;
                T5_rst <= 0;
                T20_en <= 1;
                T20_rst <= 0;
                Hit_ld <= 0;
                Hit_clr <= 0;
                Lvl_clr <= 0;        
                StateNext <= S_L3b;
            end 
            
            S_L3b: begin
                out <= 8'b00001000;
                T5_en <= 0;
                T5_rst <= 0;
                T20_en <= 1;
                T20_rst <= 0;
                Hit_ld <= 0;
                Hit_clr <= 0;
                Lvl_clr <= 0;   
                StateNext <= S_L2b;
            end         
            
            S_L2b: begin
                out <= 8'b00000100;
                T5_en <= 0;
                T5_rst <= 1;
                T20_en <= 1;
                T20_rst <= 0;
                Hit_ld <= 0;
                Hit_clr <= 0;
                Lvl_clr <= 0;
                StateNext <= S_L1b;
            end  
            
            S_L1b: begin
                out <= 8'b00000010;
                T5_en <= 0;
                T5_rst <= 0;
                T20_en <= 1;
                T20_rst <= 0;
                Hit_ld <= 0;
                Hit_clr <= 0;
                Lvl_clr <= 0;
                StateNext <= S_L0b;
            end  
            
            S_L0b: begin
                out <= 8'b00000001;
                T5_en <= 0;
                T5_rst <= 0;
                T20_en <= 1;
                T20_rst <= 0;
                Hit_ld <= 0;
                Hit_clr <= 0;
                Lvl_clr <= 0;
                if (p == 1) begin
                    StateNext <= S_L1c;
                end
                else begin
                    StateNext <= S_LAll;
                end  
            end
            
            S_LAll: begin
                out <= 8'b11111111;
                T5_en <= 1;
                T5_rst <= 0;
                T20_en <= 0;
                T20_rst <= 0;
                Hit_ld <= 0;
                Hit_clr <= 0;
                Lvl_clr <= 0;
                if (T5_in == 1) begin
                    StateNext <= S_Wait;
                end
                else begin
                    StateNext <= S_LNone;
                end
            end
            
            S_LNone: begin
                out <= 8'b00000000;
                T5_en <= 1;
                T5_rst <= 0;
                T20_en <= 0;
                T20_rst <= 0;
                Hit_ld <= 0;
                Hit_clr <= 0;
                Lvl_clr <= 0;
                if (T5_in == 1) begin
                    StateNext <= S_Wait;
                end
                else begin
                    StateNext <= S_LAll;
                end
            end
            
            default: begin
                out <= 8'b00000000;
            end
       
       endcase
       
   end 
    
endmodule