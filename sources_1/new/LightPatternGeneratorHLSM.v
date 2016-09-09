`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: TosiCorp
// Engineer: Sam Gianelli, Diego Jimenez
// 
// Create Date: 02/20/2016 01:17:01 PM
// Design Name: 
// Module Name: LightPatternGenerator
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


module LightPatternGeneratorHLSM(r, b, p, Clk, Time20, Time5, out, hit, level, EnTimer5, EnTimer20);
    input r, b, p, Clk, Time20, Time5;
    output reg [7:0] out;
    output reg [6:0] hit;
    output reg [3:0] level;
    output reg EnTimer5, EnTimer20;
    reg [4:0] State, StateNext;
    
    parameter S_Wait = 0, S_L0a = 1, S_L1a = 2, S_L2a = 3, S_L3a = 4, S_L4a = 5, S_L5a = 6, S_L6a = 7, S_L7a = 8,
                S_L6b = 9, S_L5b = 10, S_L4b = 11, S_L3b = 12, S_L2b = 13, S_L1b = 14, S_L0b = 15, S_LAll = 16, S_LNone = 17, S_L1c = 18;
                
    initial begin
        State <= S_Wait;
    end
    
    //State Register
    always @(posedge Clk, posedge r) begin
        if (r == 1) begin
            State <= S_Wait;
        end
        else begin
            State <= StateNext;
        end
    end
    
    
    always @(b, p, State, Time5) begin
        
        case (State)
            S_Wait: begin
                out <= 8'b00000000;
                EnTimer5 <= 0;
                EnTimer20 <= 0;
                hit <= 7'b0000000;
                level <= 4'b0000;        
                if (b == 1) begin
                    StateNext <= S_L0a;
                end
                else begin
                    StateNext <= S_Wait;
                end
            end
            
            S_L0a: begin
                out <= 8'b00000001;
                EnTimer5 <= 0;
                EnTimer20 <= 1;
                StateNext <= S_L1c;
            end 

            S_L1a: begin
                out <= 8'b00000010;
                EnTimer5 <= 0;
                EnTimer20 <= 1;
                StateNext <= S_L2a;
            end      
                        
            S_L1c: begin  // second state for counting purposes 
                out <= 8'b00000010;
                EnTimer5 <= 0;
                EnTimer20 <= 1;
                hit <= hit + 1;
                StateNext <= S_L2a;   
            end               

            S_L2a: begin
                out <= 8'b00000100;
                EnTimer5 <= 0; 
                EnTimer20 <= 1;               
                StateNext <= S_L3a;
            end 
            
            S_L3a: begin
                out <= 8'b00001000;
                EnTimer5 <= 0; 
                EnTimer20 <= 1;                
                StateNext <= S_L4a;
            end      
            
            S_L4a: begin
                out <= 8'b00010000;
                EnTimer5 <= 0; 
                EnTimer20 <= 1;                
                StateNext <= S_L5a;
            end 

            S_L5a: begin
                out <= 8'b00100000;
                EnTimer5 <= 0;
                EnTimer20 <= 1;
                StateNext <= S_L6a;
            end                        

            S_L6a: begin
                out <= 8'b01000000;
                EnTimer5 <= 0;
                EnTimer20 <= 1;
                StateNext <= S_L7a;
            end 
            
            S_L7a: begin
                out <= 8'b10000000;
                EnTimer5 <= 0;
                EnTimer20 <= 1;
                StateNext <= S_L6b;
            end    
            
            S_L6b: begin
                out <= 8'b01000000;
                EnTimer5 <= 0; 
                EnTimer20 <= 1;      
                StateNext <= S_L5b;
            end 

            S_L5b: begin
                out <= 8'b00100000;
                EnTimer5 <= 0; 
                EnTimer20 <= 1;     
                StateNext <= S_L4b;
            end                        

            S_L4b: begin
                out <= 8'b00010000;
                EnTimer5 <= 0; 
                EnTimer20 <= 1;          
                StateNext <= S_L3b;
            end 
            
            S_L3b: begin
                out <= 8'b00001000;
                EnTimer5 <= 0; 
                EnTimer20 <= 1;     
                StateNext <= S_L2b;
            end         
            
            S_L2b: begin
                out <= 8'b00000100;
                EnTimer5 <= 0; 
                EnTimer20 <= 1;      
                StateNext <= S_L1b;
            end  
            
            S_L1b: begin
                out <= 8'b00000010;
                EnTimer5 <= 0; 
                EnTimer20 <= 1;
                StateNext <= S_L0b;
            end  
            
            S_L0b: begin
                out <= 8'b00000001;
                EnTimer5 <= 0;
                EnTimer20 <= 1;
                if (p == 1) begin
                    StateNext <= S_L1a;
                end
                else begin
                    StateNext <= S_LAll;
                end  
            end
            
            S_LAll: begin
                out <= 8'b11111111;
                EnTimer5 <= 1;
                EnTimer20 <= 0;
                if (Time5 == 1) begin
                    StateNext = S_Wait;
                end
                else begin
                    StateNext <= S_LNone;
                end
            end
            
            S_LNone: begin
                EnTimer5 <= 1;
                EnTimer20 <= 0;
                out <= 8'b00000000;
                if (Time5 == 1) begin
                    StateNext = S_Wait;
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
