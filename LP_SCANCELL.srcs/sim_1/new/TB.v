`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.11.2024 22:41:15
// Design Name: 
// Module Name: TB
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


module CELL_TB;

    // Testbench signals
    reg clk;               // Clock signal
    reg rstn;              // Active low reset
    reg scan_in;           // Scan input signal
    wire scan_out;         // Scan output signal
    reg data_in;           // Normal data input signal
    wire data_out;         // Normal data output signal
    reg enable;            // Clock enable signal (for clock gating)
    reg scan_mode;         // Control signal for scan (1 for scan mode, 0 for normal mode)

    // Instantiate the Unit Under Test (UUT)
    CELL uut (
        .clk(clk),
        .rstn(rstn),
        .scan_in(scan_in),
        .scan_out(scan_out),
        .data_in(data_in),
        .data_out(data_out),
        .enable(enable),
        .scan_mode(scan_mode)
    );

    // Clock generation (periodic clock signal)
    always begin
        #5 clk = ~clk;  // Toggle clock every 5 time units
    end

    // Test sequence
    initial begin
        // Initialize signals
        clk = 0;
        rstn = 0;
        scan_in = 0;
        data_in = 0;
        enable = 1;  // Enable clock gating initially
        scan_mode = 0;  // Start in normal mode
        
        // Apply reset
        #10 rstn = 1;  // Release reset after 10 time units
        #10 rstn = 0;  // Assert reset again to initialize UUT
        #10 rstn = 1;  // Release reset

        // Normal mode test (Functional mode)
        // Apply normal data
        #10 data_in = 1;  // Normal data input = 1
        #10 data_in = 0;  // Normal data input = 0
        #10 data_in = 1;  // Normal data input = 1
        #10 data_in = 0;  // Normal data input = 0
        
        // Switch to scan mode
        scan_mode = 1;  // Set scan mode to 1
        #10 scan_in = 1; // Apply scan input = 1
        #10 scan_in = 0; // Apply scan input = 0
        #10 scan_in = 1; // Apply scan input = 1
        #10 scan_in = 0; // Apply scan input = 0

        // Disable clock gating and observe behavior
        enable = 0;  // Disable clock gating (no clock should reach flip-flop)
        #10 scan_in = 1;  // Apply scan input while clock is disabled
        #10 scan_in = 0;  // Apply scan input while clock is disabled

        // Re-enable clock gating and continue normal operation
        enable = 1;  // Re-enable clock gating
        scan_mode = 0;  // Return to normal mode
        #10 data_in = 1;  // Normal data input = 1
        #10 data_in = 0;  // Normal data input = 0

        // Finish simulation
        #20 $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time = %0t | rstn = %b | scan_in = %b | scan_out = %b | data_in = %b | data_out = %b | enable = %b | scan_mode = %b",
                 $time, rstn, scan_in, scan_out, data_in, data_out, enable, scan_mode);
    end

endmodule
