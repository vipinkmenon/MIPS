`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2018 08:01:33 PM
// Design Name: 
// Module Name: system
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


module system(
input clk,
input reset
);

wire [31:0] instrAddress;
wire [31:0] instruction;
wire [31:0] dataMemReadAddress;
wire [31:0] dataMemWriteAddress;
wire [31:0] dataMemWriteData;
wire [31:0] dataMemOut;
wire [31:0] ReadData;
wire        MemWrite;

instructionMemory im(
    .ReadAddress(instrAddress),
    .instruction(instruction)
);

mips proc(
    .clk(clk),
    .reset(reset),
    .instrAddress(instrAddress),
    .currInstruction(instruction),
    .dataMemReadAddress(dataMemReadAddress),
    .dataMemWriteAddress(dataMemWriteAddress),
    .dataMemWriteData(dataMemWriteData),
    .dataMemOut(ReadData),
    .MemWrite(MemWrite)   
);

dataMemory dm(
    .clk(clk),
    .ReadAddress(dataMemReadAddress),
    .WriteAddress(dataMemWriteAddress),
    .WriteData(dataMemWriteData),
    .ReadData(ReadData),
    .MemWrite(MemWrite)
);

endmodule
