`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2018 03:38:08 PM
// Design Name: 
// Module Name: programCounter
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


module programCounter(
    input clk,
    input reset,
    input [31:0] pcIn,
    output reg [31:0] instructionAddress
    );
    

always @(posedge clk or posedge reset)
begin
    if(reset)
        instructionAddress <= 0;
    else
        instructionAddress <= pcIn;
end    
    
endmodule
