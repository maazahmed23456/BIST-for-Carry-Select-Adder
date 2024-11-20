`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.11.2024 22:36:57
// Design Name: 
// Module Name: LP_SCANCELL_2
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


module CELL(
    input wire clk,         // Clock signal
    input wire rstn,        // Active low reset
    input wire scan_in,     // Scan input signal
    output wire scan_out,   // Scan output signal
    input wire data_in,     // Normal data input signal
    output wire data_out,   // Normal data output signal
    input wire enable,      // Clock enable signal (for clock gating)
    input wire scan_mode    // Control signal: 1 for scan mode, 0 for normal mode
);

    reg ff_reg;
    wire mux_out;
    wire gated_clk;

    // Clock Gating Logic: Apply clock gating only when scan_mode = 1
    assign gated_clk = (scan_mode) ? (clk & enable) : clk;  // Clock is gated only during scan mode

    // MUX to select between scan input and normal data input
    assign mux_out = (scan_mode) ? scan_in : data_in;

    // Flip-flop for storing either scan or data input
    always @(posedge gated_clk or negedge rstn) begin
        if (~rstn) begin
            ff_reg <= 1'b0;
        end else begin
            ff_reg <= mux_out;
        end
    end

    assign scan_out = ff_reg;  // Scan output
    assign data_out = ff_reg;  // Data output (same as scan output in normal mode)

endmodule

