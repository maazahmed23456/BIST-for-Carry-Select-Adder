`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.11.2024 22:27:08
// Design Name: 
// Module Name: CELL_TB
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


module tb_low_power_scan_cell;
    reg clk;
    reg reset;
    reg scan_enable;
    reg scan_in;
    reg [3:0] data_in;
    reg scan_clock_gate;  // Scan clock gating control signal
    wire [3:0] data_out;
    wire scan_out;

    // Instantiate the DUT (Device Under Test)
    low_power_scan_cell uut (
        .clk(clk),
        .reset(reset),
        .scan_enable(scan_enable),
        .scan_in(scan_in),
        .data_in(data_in),
        .data_out(data_out),
        .scan_out(scan_out),
        .scan_clock_gate(scan_clock_gate)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns clock period
    end

    // Stimulus
    initial begin
        // Initialize signals
        reset = 1; scan_enable = 0; scan_in = 0; data_in = 4'b1010; scan_clock_gate = 1;
        #10 reset = 0;

        // Functional mode: Load data_in
        #10 scan_enable = 0; data_in = 4'b1100;
        #10;

        // Test mode: Shift in bits with scan clock gating
        #10 scan_enable = 1; scan_in = 1;  // Shift in '1'
        scan_clock_gate = 1;  // Enable scan clock
        #10 scan_in = 0;       // Shift in '0'
        #10 scan_in = 1;       // Shift in '1'
        scan_clock_gate = 0;  // Disable scan clock (low-power)
        #10 scan_in = 0;       // Shift in '0', but clock is gated (no change)

        #10 $finish;
    end

    // Monitor outputs
    initial begin
        $monitor($time, " Reset=%b, Scan_Enable=%b, Scan_In=%b, Data_In=%b, Data_Out=%b, Scan_Out=%b, Scan_Clock_Gate=%b",
                 reset, scan_enable, scan_in, data_in, data_out, scan_out, scan_clock_gate);
    end

endmodule
