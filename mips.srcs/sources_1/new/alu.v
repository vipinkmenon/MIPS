`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2018 03:52:43 PM
// Design Name: 
// Module Name: alu
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


module alu #(propDealay=5)(
    input [31:0] op1,
    input [31:0] op2,
    output reg [31:0] aluOut,
    input [2:0] ALUOp,
    output zeroFlag
    );
    
    reg carry;
    
    assign zeroFlag = ((aluOut == 0) & (carry == 0) ) ? 1'b1 : 1'b0;
    
    always @(*)
    begin
        carry = 0;
        case(ALUOp)
            3'b000:begin
               aluOut = op1 & op2;
             end
            3'b001:begin
                aluOut = op1 | op2;
            end
            3'b010:begin
                {carry,aluOut} = op1 + op2;
            end           
            3'b110:begin
                {carry,aluOut} = op1 - op2;
            end
            3'b111:begin
                if(op1 < op2)
                    aluOut = 32'b1;
                 else
                    aluOut = 32'b0;
            end
            default:begin
                aluOut = 0;
            end
        endcase
    end
    
    
endmodule
