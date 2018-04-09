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
    input              clk,
    input              reset,
    output wire [31:0] instrAddress,
    input  wire [31:0] currInstruction,
    output wire [31:0] dataMemReadAddress,
    output wire [31:0] dataMemWriteAddress,
    output wire [31:0] dataMemWriteData,
    input  wire [31:0] dataMemOut,
    output wire        MemWrite   
    
);


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

wire RegDstp;
wire [31:0] nextInstrAddressp;
wire [31:0] currInstructionp;
wire [31:0] nextInstrAddressp1;
wire [4:0]  writeMuxOutputp;
wire [31:0] signExtendOutp;
wire [31:0] regData2p;
wire [31:0] regData2p1;
wire [31:0] regData1p;
wire [2:0]  ALUOpp;
wire [2:0]  ALUOpp1;
wire        ALUSrcp;
wire        ALUSrcp1;
wire        RegWritep;
wire        RegWritep1;

wire [31:0] aluOutp;
wire        RegWritep2;
wire [4:0]  writeMuxOutputp1;

wire        RegWritep3;
wire [4:0]  writeMuxOutputp2;
wire [31:0] dataMemOutp;
wire [31:0] aluOutp1;
wire        memToRegp;
wire        memToRegp1;
wire        memToRegp2;
wire        memToRegp3;
wire        memToRegp4;
wire        MemoryWrite;
wire        MemoryWritep;
wire        MemoryWritep1;

assign dataMemReadAddress = aluOutp;
assign dataMemWriteAddress = aluOutp;
assign dataMemWriteData = regData2p1;

control control(
    .opCode(currInstruction[31:26]),
    .opFunction(currInstruction[5:0]),
    .zeroIn(zeroFlag),
    .regDst(RegDst),
    .regWrite(RegWrite),
    .ALUSrc(ALUSrc),
    .ALUOp(ALUOp),
    .MemWrite(MemoryWrite),
    .MemToReg(memToReg),
    .PCSrc(PCSrc)
);


programCounter pc(
    .clk(clk),
    .reset(reset),
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
     .in0(currInstructionp[20:16]),
     .in1(currInstructionp[15:11]),
     .control(RegDstp),
     .muxout(writeMuxOutput)
     );
     
     
 pipeline #(.Width(74)) IF_ID_Pipeline (
    .clk(clk),
    .inData({MemoryWrite,memToReg,RegWrite,ALUSrc,ALUOp,RegDst,nextInstrAddress,currInstruction}),
    .outData({MemoryWritep,memToRegp,RegWritep,ALUSrcp,ALUOpp,RegDstp,nextInstrAddressp,currInstructionp})
    );
 
 registerFile regFile(
     .clk(clk),
     .ReadAddress1(currInstructionp[25:21]),
     .ReadAddress2(currInstructionp[20:16]),
     .WriteAddress(writeMuxOutputp2),//writeMuxOutput
     .WriteData(regWrData),
     .RegWriteEn(RegWritep3),//RegWrite
     .ReadData1(regData1),
     .ReadData2(regData2)
     ); 
     
     
 signExtend signExtend(
         .in(currInstructionp[15:0]),
         .out(signExtendOut)
         );   


 pipeline #(.Width(271)) ID_Ex_Pipeline (
    .clk(clk),
    .inData({MemoryWritep,memToRegp,RegWritep,ALUSrcp,ALUOpp,nextInstrAddressp,writeMuxOutput,signExtendOut,regData2,regData1}),
    .outData({MemoryWritep1,memToRegp1,RegWritep1,ALUSrcp1,ALUOpp1,nextInstrAddressp1,writeMuxOutputp,signExtendOutp,regData2p,regData1p})
    );         
     
 Mux2_1 #(.width(32)) ALUSrcMUX(
         .in0(regData2p),
         .in1(signExtendOutp),
         .control(ALUSrcp1),
         .muxout(aluSrcMuxOut)
         );    
     
     
 alu alu(
         .op1(regData1p),
         .op2(aluSrcMuxOut),
         .aluOut(aluOut),
         .ALUOp(ALUOpp1),
         .zeroFlag(zeroFlag)
   ); 
   
pipeline #(.Width(72)) Ex_Mem_Pipeline (
    .clk(clk),
    .inData({MemoryWritep1,memToRegp1,RegWritep1,writeMuxOutputp,aluOut,regData2p}),
    .outData({MemWrite,memToRegp2,RegWritep2,writeMuxOutputp1,aluOutp,regData2p1})
); 
   
   
pipeline #(.Width(269)) Mem_WB_Pipeline (
    .clk(clk),
    .inData({memToRegp2,RegWritep2,writeMuxOutputp1,dataMemOut,aluOutp}),
    .outData({memToRegp3,RegWritep3,writeMuxOutputp2,dataMemOutp,aluOutp1})
);   
   
   
   
   Mux2_1 #(.width(32)) RegDestMux(
           .in0(aluOutp1),
           .in1(dataMemOutp),
           .control(memToRegp3),
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
