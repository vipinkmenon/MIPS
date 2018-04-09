`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2018 04:08:12 PM
// Design Name: 
// Module Name: mips
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


module mips(
    input         clk,
    output wire [31:0] instrAddress,
    input  wire [31:0] currInstruction,
    output wire [31:0] dataMemReadAddress,
    output wire [31:0] dataMemWriteAddress,
    output wire [31:0] dataMemWriteData,
    input  wire [31:0] dataMemOut,
    output wire        MemWrite   
    
);

assign dataMemReadAddress = aluOut;
assign dataMemWriteAddress = aluOut;
assign dataMemWriteData = regData2;



wire [31:0] nextInstrAddress;

wire [31:0] regData1;
wire [31:0] regData2;
wire [31:0] aluOut;
wire [31:0] aluSrcMuxOut;
wire [31:0] signExtendOut;
wire [31:0] shiftAddressOut;
wire [31:0] jmpAddress;
wire [31:0] pcMuxOut;
wire [31:0] regWrData;
wire [4:0] writeMuxOutput;
wire RegDst;
wire RegWrite;
wire memToReg;
wire ALUSrc;
wire PCSrc;
wire zeroFlag;
wire [2:0] ALUOp;


control control(
    .opCode(currInstruction[31:26]),
    .opFunction(currInstruction[5:0]),
    .zeroIn(zeroFlag),
    .regDst(RegDst),
    .regWrite(RegWrite),
    .ALUSrc(ALUSrc),
    .ALUOp(ALUOp),
    .MemWrite(MemWrite),
    .MemToReg(memToReg),
    .PCSrc(PCSrc)
);


programCounter pc(
    .clk(clk),
    .pcIn(pcMuxOut),
    .instructionAddress(instrAddress)
);

adder pcAdder(
           .op1(instrAddress),
           .op2('d4),
           .adderOut(nextInstrAddress)
   );


 Mux2_1 #(.width(32)) PCSrcMux(
         .in0(nextInstrAddress),
         .in1(jmpAddress),
         .control(PCSrc),
         .muxout(pcMuxOut)
 ); 
 
 Mux2_1 #(.width(5)) regFileMux(
     .in0(currInstruction[20:16]),
     .in1(currInstruction[15:11]),
     .control(RegDst),
     .muxout(writeMuxOutput)
     );
 
 registerFile regFile(
     .clk(clk),
     .ReadAddress1(currInstruction[25:21]),
     .ReadAddress2(currInstruction[20:16]),
     .WriteAddress(writeMuxOutput),
     .WriteData(regWrData),
     .RegWriteEn(RegWrite),
     .ReadData1(regData1),
     .ReadData2(regData2)
     ); 
     
     
 signExtend signExtend(
         .in(currInstruction[15:0]),
         .out(signExtendOut)
         );    
     
 Mux2_1 #(.width(32)) ALUSrcMUX(
         .in0(regData2),
         .in1(signExtendOut),
         .control(ALUSrc),
         .muxout(aluSrcMuxOut)
         );    
     
     
 alu alu(
         .op1(regData1),
         .op2(aluSrcMuxOut),
         .aluOut(aluOut),
         .ALUOp(ALUOp),
         .zeroFlag(zeroFlag)
   ); 
   
   
   Mux2_1 #(.width(32)) RegDestMux(
           .in0(aluOut),
           .in1(dataMemOut),
           .control(memToReg),
           .muxout(regWrData)
   );  
    
   shiftLeft sl(
       .in(signExtendOut),
       .out(shiftAddressOut)
       );
       
   adder BrAddressAdder(
           .op1(shiftAddressOut),
           .op2(nextInstrAddress),
           .adderOut(jmpAddress)
   );   

endmodule
