`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.12.2024 17:18:45
// Design Name: 
// Module Name: LFSR_TB
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


`timescale 1ns / 1ps

module LFSR_TB();
    reg clk;                 // Clock signal
    reg reset;               // Reset signal
    wire [10:0] lfsr_out;
    wire finish;    // Output of the LFSR

    // Instantiate the LFSR module
    LFSR uut (
        .clk(clk),
        .reset(reset),
        .lfsr_out(lfsr_out),
        .finish(finish)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Clock with a period of 10 ns
    end

    // Stimulus
    initial begin
        // Monitor signals
        $monitor("Time: %0t | Reset: %b | LFSR Output: %b", $time, reset, lfsr_out);

        // Apply reset
        reset = 1; 
        #10;

        // Release reset
        reset = 0; 
        #21000;

        // Finish simulation
        $finish;
    end
endmodule
