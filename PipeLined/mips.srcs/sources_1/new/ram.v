`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2018 03:34:39 PM
// Design Name: 
// Module Name: ram
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

module dataMemory #(parameter propDelay=2)(
    input clk,
    input [31:0] ReadAddress,
    input [31:0] WriteAddress,
    input [31:0] WriteData,
    output [31:0] ReadData,
    input MemWrite
);


reg [31:0] ramMem [20:0];

assign #propDelay ReadData =  ramMem[ReadAddress];

always @(posedge clk)
begin
    if(MemWrite)
        ramMem[WriteAddress] <= WriteData;
end


endmodule
    