`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2024 21:47:02
// Design Name: 
// Module Name: LFST_TB
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


module tb_lfsr_32bit;
    reg clk;
    reg reset;
    wire [31:0] lfsr_out;

    // Instantiate the LFSR module
    lfsr_32bit uut (
        .clk(clk),
        .reset(reset),
        .lfsr_out(lfsr_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        reset = 1;
        #10 reset = 0; // Release reset
        #200 $finish;  // End simulation after 200ns
    end

    // Monitor output
    initial begin
        $monitor($time, " LFSR Output: %h", lfsr_out);
    end
endmodule
