`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2018 03:30:00 PM
// Design Name: 
// Module Name: memory
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


module instructionMemory #(parameter propDelay=2)(
    input [31:0] ReadAddress,
    output reg [31:0] instruction
    );
    
    
    reg [31:0] mem [0:20];
    
    initial
    begin
        mem[0] = 'b001000_00000_01000_0000_0000_0000_0101; //addi $t0,$zero,5
        mem[4] = 'b001000_00000_01001_0000_0000_0000_0110; //addi $t1,$zero,6
        mem[8] = 'b000000_01000_01001_01010_00000_100000;  //add $t2,$t0,$t1
        mem[12] = 'b101011_00000_01010_0000_0000_0000_0100; //sw $t2,4($zero)
    end
    
    always @(*)
    begin
        #propDelay instruction = mem[ReadAddress];
    end
    
    
endmodule
