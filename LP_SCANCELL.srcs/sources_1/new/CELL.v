`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.11.2024 22:22:47
// Design Name: 
// Module Name: CELL
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


module clock_gated_low_power_scan_cell (
    input wire clk,         // Clock signal
    input wire rstn,        // Active low reset
    input wire scan_in,     // Scan input
    output wire scan_out,   // Scan output
    input wire data_in,     // Normal data input
    output wire data_out,   // Normal data output
    input wire enable       // Clock enable signal (used for clock gating)
);

    reg scan_reg, data_reg;
    wire scan_mux_out, data_mux_out;
    wire gated_clk;

    // Clock Gating: Enable clock to the flip-flops only when 'enable' is high
    assign gated_clk = clk & enable;  // Gated clock signal

    // MUX to choose between normal data input and scan input
    assign scan_mux_out = (rstn == 0) ? 1'b0 : scan_in;
    assign data_mux_out = (rstn == 0) ? 1'b0 : data_in;

    // Scan flip-flop with clock gating
    always @(posedge gated_clk or negedge rstn) begin
        if (~rstn) begin
            scan_reg <= 1'b0;
            data_reg <= 1'b0;
        end else begin
            scan_reg <= scan_mux_out;
            data_reg <= data_mux_out;
        end
    end

    assign scan_out = scan_reg;
    assign data_out = data_reg;

endmodule
