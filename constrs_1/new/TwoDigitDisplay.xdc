## Engineer: Diego Jimenez, Sam Gianelli
##
##//  ////////////////THIS IS THE MIDPROJECT AND THE FINAL SUBMISSION///////////////
##

## This part is to activate or deactive ANODE of each display digit
set_property IOSTANDARD LVCMOS33 [get_ports {en_out[0]}]
set_property PACKAGE_PIN N6 [get_ports {en_out[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {en_out[1]}]
set_property PACKAGE_PIN M6 [get_ports {en_out[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {en_out[2]}]
set_property PACKAGE_PIN M3 [get_ports {en_out[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {en_out[3]}]
set_property PACKAGE_PIN N5 [get_ports {en_out[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {en_out[4]}]
set_property PACKAGE_PIN N2 [get_ports {en_out[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {en_out[5]}]
set_property PACKAGE_PIN N4 [get_ports {en_out[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {en_out[6]}]
set_property PACKAGE_PIN L1 [get_ports {en_out[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {en_out[7]}]
set_property PACKAGE_PIN M1 [get_ports {en_out[7]}]

##This part is to assign a pin number to 100MHz clock signal
set_property PACKAGE_PIN E3 [get_ports Clk]
set_property IOSTANDARD LVCMOS33 [get_ports Clk]

##This part is to assign pin numbers for 7-bit input number
##set_property IOSTANDARD LVCMOS33 [get_ports {Number[6]}]
##set_property PACKAGE_PIN V6 [get_ports {Number[6]}]
##set_property IOSTANDARD LVCMOS33 [get_ports {Number[5]}]
##set_property PACKAGE_PIN V7 [get_ports {Number[5]}]
##set_property IOSTANDARD LVCMOS33 [get_ports {Number[4]}]
##set_property PACKAGE_PIN R5 [get_ports {Number[4]}]
##set_property IOSTANDARD LVCMOS33 [get_ports {Number[3]}]
##set_property PACKAGE_PIN R6 [get_ports {Number[3]}]
##set_property IOSTANDARD LVCMOS33 [get_ports {Number[2]}]
##set_property PACKAGE_PIN R7 [get_ports {Number[2]}]
##set_property IOSTANDARD LVCMOS33 [get_ports {Number[1]}]
##set_property PACKAGE_PIN U8 [get_ports {Number[1]}]
##set_property IOSTANDARD LVCMOS33 [get_ports {Number[0]}]
##set_property PACKAGE_PIN U9 [get_ports {Number[0]}]

##This part is to assign pin numbers for 7 segements of the digit display
set_property IOSTANDARD LVCMOS33 [get_ports {out[6]}]
set_property PACKAGE_PIN L3 [get_ports {out[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {out[5]}]
set_property PACKAGE_PIN N1 [get_ports {out[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {out[4]}]
set_property PACKAGE_PIN L5 [get_ports {out[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {out[3]}]
set_property PACKAGE_PIN L4 [get_ports {out[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {out[2]}]
set_property PACKAGE_PIN K3 [get_ports {out[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {out[1]}]
set_property PACKAGE_PIN M2 [get_ports {out[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {out[0]}]
set_property PACKAGE_PIN L6 [get_ports {out[0]}]

# BUTTONS
set_property IOSTANDARD LVCMOS33 [get_ports {Rst}]  
set_property PACKAGE_PIN F15 [get_ports {Rst}]
set_property IOSTANDARD LVCMOS33 [get_ports {b}]  
set_property PACKAGE_PIN E16 [get_ports {b}]
set_property IOSTANDARD LVCMOS33 [get_ports {p1}]  
set_property PACKAGE_PIN V10 [get_ports {p1}]
set_property IOSTANDARD LVCMOS33 [get_ports {p2}]  
set_property PACKAGE_PIN R10 [get_ports {p2}]

# SWITCHES
set_property IOSTANDARD LVCMOS33 [get_ports {mode}]  
set_property PACKAGE_PIN U9 [get_ports {mode}]
set_property IOSTANDARD LVCMOS33 [get_ports {switch[1]}]  
set_property PACKAGE_PIN P4 [get_ports {switch[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {switch[0]}]  
set_property PACKAGE_PIN P3 [get_ports {switch[0]}]

# LIGHTS
set_property IOSTANDARD LVCMOS33 [get_ports {LightOut[0]}]
set_property PACKAGE_PIN U6 [get_ports {LightOut[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LightOut[1]}]
set_property PACKAGE_PIN U7 [get_ports {LightOut[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LightOut[2]}]
set_property PACKAGE_PIN T4 [get_ports {LightOut[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LightOut[3]}]
set_property PACKAGE_PIN T5 [get_ports {LightOut[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LightOut[4]}]
set_property PACKAGE_PIN T6 [get_ports {LightOut[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LightOut[5]}]
set_property PACKAGE_PIN R8 [get_ports {LightOut[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LightOut[6]}]
set_property PACKAGE_PIN V9 [get_ports {LightOut[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LightOut[7]}]
set_property PACKAGE_PIN T8 [get_ports {LightOut[7]}]

# FIXME: FILL IN PINS FOR: 2P-TIME-SWITCHES, P2-PLAY, MODE-SWITCH