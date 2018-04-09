`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2018 03:40:04 PM
// Design Name: 
// Module Name: registerFile
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


module registerFile #(propDealay=3)(
    input clk,
    input [4:0] ReadAddress1,
    input [4:0] ReadAddress2,
    input [4:0] WriteAddress,
    input [31:0] WriteData,
    input RegWriteEn,
    output reg [31:0] ReadData1,
    output reg [31:0] ReadData2
    );
    
    reg [31:0] t0;
    reg [31:0] t1;
    reg [31:0] t2;
    reg [31:0] t3;
    reg [31:0] t4;
    reg [31:0] t5;
    reg [31:0] t6;
    reg [31:0] t7;
    reg [31:0] t8;
    reg [31:0] t9;
    reg [31:0] s0;
    reg [31:0] s1;
    reg [31:0] s2;
    reg [31:0] s3;
    reg [31:0] s4;
    reg [31:0] s5;
    reg [31:0] s6;
    reg [31:0] s7;
    
    always @(posedge clk)
    begin
        if(RegWriteEn)
        begin
            case(WriteAddress)
                8:begin
                    t0 <= WriteData;
                end
                9:begin
                    t1 <= WriteData;
                end
                10:begin
                    t2 <= WriteData;
                end
                11:begin
                    t3 <= WriteData;
                end
                12:begin
                    t4 <= WriteData;
                end
                13:begin
                    t5 <= WriteData;
                end
                14:begin
                    t6 <= WriteData;
                end
                15:begin
                    t7 <= WriteData;
                end
                16:begin
                    s0 <= WriteData;
                end
                17:begin
                    s1 <= WriteData;
                end
                18:begin
                    s2 <= WriteData;
                end
                19:begin
                    s3 <= WriteData;
                end
                20 :begin
                    s4 <= WriteData;
                end
                21 :begin
                    s5 <= WriteData;
                end
                22:begin
                    s6 <= WriteData;
                end
                23 :begin
                    s7 <= WriteData;
                end
                24 :begin
                    t8 <= WriteData;
                end
                25 :begin
                    t9 <= WriteData;
                end
            endcase
        end
    end
    
    always @(*)
    begin
            case(ReadAddress1)
                0:begin
                    ReadData1 = 0;
                end
                8:begin
                    ReadData1 = t0;
                end
                9:begin
                    ReadData1 = t1;
                end
                10:begin
                    ReadData1 = t2;
                end
                11:begin
                    ReadData1 = t3;
                end
                12:begin
                    ReadData1 = t4;
                end
                13:begin
                    ReadData1 = t5;
                end
                14:begin
                    ReadData1 = t6;
                end
                15:begin
                    ReadData1 = t7;
                end
                16:begin
                    ReadData1 = s0;
                end
                17:begin
                    ReadData1 = s1;
                end
                18:begin
                    ReadData1 = s2;
                end
                19:begin
                    ReadData1 = s3;
                end
                20 :begin
                    ReadData1 = s4;
                end
                21 :begin
                    ReadData1 = s5;
                end
                22:begin
                    ReadData1 = s6;
                end
                23 :begin
                    ReadData1 = s7;
                end
                24 :begin
                    ReadData1 = t8;
                end
                25 :begin
                    ReadData1 = t9;
                end
                default:begin
                    ReadData1 = 'hxx;
                end
            endcase
    end
    
    
    always @(*)
    begin
            case(ReadAddress2)
                0:begin
                    ReadData2 = 0;
                end
                8:begin
                    ReadData2 = t0;
                end
                9:begin
                    ReadData2 = t1;
                end
                10:begin
                    ReadData2 = t2;
                end
                11:begin
                    ReadData2 = t3;
                end
                12:begin
                    ReadData2 = t4;
                end
                13:begin
                    ReadData2 = t5;
                end
                14:begin
                    ReadData2 = t6;
                end
                15:begin
                   ReadData2 = t7;
                end
                16:begin
                   ReadData2 = s0;
                end
                17:begin
                   ReadData2 = s1;
                end
                18:begin
                   ReadData2 = s2;
                end
                19:begin
                   ReadData2 = s3;
                end
                20 :begin
                   ReadData2 = s4;
                end
                21 :begin
                   ReadData2 = s5;
                end
                22:begin
                   ReadData2 = s6;
                end
                23 :begin
                   ReadData2 = s7;
                end
                24 :begin
                   ReadData2 = t8;
                end
                25 :begin
                   ReadData2 = t9;
                end
                default:begin
                   ReadData2 = 'hxx;
                end
            endcase
    end
    
    
endmodule
