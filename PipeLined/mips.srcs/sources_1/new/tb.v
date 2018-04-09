`timescale 1ns/1ps

module tb();

reg clk;
reg reset;


initial
begin
    reset = 1;
    #10;
    reset = 0;
end

initial
begin
    clk = 0;
    forever
    begin
        clk = ~clk;
        #5;
    end
end


system dut(
    .clk(clk),
    .reset(reset)
);

endmodule