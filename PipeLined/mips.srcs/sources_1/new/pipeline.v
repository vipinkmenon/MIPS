`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2018 04:06:56 PM
// Design Name: 
// Module Name: adder
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


module pipeline #(parameter Width=32) (
    input        clk,
    input [Width-1:0] inData,
    output reg [Width-1:0] outData
    );
    
    always@(posedge clk)
    begin
        outData <= inData;
    end
    
endmodule