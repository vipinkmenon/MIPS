`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2018 04:05:31 PM
// Design Name: 
// Module Name: shiftLeft
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


module shiftLeft #(parameter shiftAmnt = 2)(
    input [31:0] in,
    output [31:0] out
    );
    
    assign out = in << shiftAmnt;
endmodule
