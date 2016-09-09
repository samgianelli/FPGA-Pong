# FPGA-Pong

Language: Verilog

Purpose: class project for Digital Logic

FPGA used: Nexys4 DDR

Code for a game that can be synthesized to an FPGA board where one or two players bounce a moving LED back and forth
by carefully timing their button presses with the current location of the LED.

Single Player games are played by bouncing the LED off of the rightmost LED and the player must press a button to bounce
the LED back off the left wall or else they lose the game.  Every 20 seconds the level increments and the LED speeds up.

Two Player games are played where the second player takes the position of the second wall from the Single Player game.  
The first player to score 5 points by making their opponent miss the LED wins the game.  The speed of the game can be manually
toggeled via switches on the FPGA board.

Includes: Datapath Components, Controller, testbenches, and constraint files necessary for generating a valid bitstream
