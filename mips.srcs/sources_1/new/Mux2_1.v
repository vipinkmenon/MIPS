`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2018 03:59:14 PM
// Design Name: 
// Module Name: Mux2_1
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


module Mux2_1 #(parameter width=32)(
    input [width-1:0] in0,
    input [width-1:0] in1,
    input control,
    output [width-1:0] muxout
    );
    
    assign #1 muxout = (control == 0) ? in0 : in1;
endmodule
