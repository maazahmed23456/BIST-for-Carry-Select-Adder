`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.11.2024 22:55:45
// Design Name: 
// Module Name: CHAIN
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


module SCAN_CHAIN (
    input wire clk,               // Clock signal
    input wire rstn,              // Active low reset
    input wire scan_in,           // Scan input signal
    output wire scan_out,         // Scan output signal
    input wire enable,            // Clock enable signal (for clock gating)
    input wire scan_mode          // Scan mode control signal
);

    // Intermediate scan outputs for connecting the cells in the chain
    wire [6:0] scan_chain_out;  // 7 intermediate scan outputs (between 8 flip-flops)

    // Instantiate 8 clock-gated scan cells
    CELL cell0 (
        .clk(clk),
        .rstn(rstn),
        .scan_in(scan_in),
        .scan_out(scan_chain_out[0]),
        .data_in(1'b1),    // Data input for normal mode (optional)
        .data_out(),       // Data output for normal mode (optional)
        .enable(enable),
        .scan_mode(scan_mode)
    );

    CELL cell1 (
        .clk(clk),
        .rstn(rstn),
        .scan_in(scan_chain_out[0]),
        .scan_out(scan_chain_out[1]),
        .data_in(1'b0),    // Data input for normal mode (optional)
        .data_out(),       // Data output for normal mode (optional)
        .enable(enable),
        .scan_mode(scan_mode)
    );

    CELL cell2 (
        .clk(clk),
        .rstn(rstn),
        .scan_in(scan_chain_out[1]),
        .scan_out(scan_chain_out[2]),
        .data_in(1'b0),
        .data_out(),
        .enable(enable),
        .scan_mode(scan_mode)
    );

    CELL cell3 (
        .clk(clk),
        .rstn(rstn),
        .scan_in(scan_chain_out[2]),
        .scan_out(scan_chain_out[3]),
        .data_in(1'b0),
        .data_out(),
        .enable(enable),
        .scan_mode(scan_mode)
    );

    CELL cell4 (
        .clk(clk),
        .rstn(rstn),
        .scan_in(scan_chain_out[3]),
        .scan_out(scan_chain_out[4]),
        .data_in(1'b0),
        .data_out(),
        .enable(enable),
        .scan_mode(scan_mode)
    );

   CELL cell5 (
        .clk(clk),
        .rstn(rstn),
        .scan_in(scan_chain_out[4]),
        .scan_out(scan_chain_out[5]),
        .data_in(1'b0),
        .data_out(),
        .enable(enable),
        .scan_mode(scan_mode)
    );

    CELL cell6 (
        .clk(clk),
        .rstn(rstn),
        .scan_in(scan_chain_out[5]),
        .scan_out(scan_chain_out[6]),
        .data_in(1'b0),
        .data_out(),
        .enable(enable),
        .scan_mode(scan_mode)
    );

    CELL cell7 (
        .clk(clk),
        .rstn(rstn),
        .scan_in(scan_chain_out[6]),
        .scan_out(scan_out),  // Final scan output
        .data_in(1'b0),
        .data_out(),
        .enable(enable),
        .scan_mode(scan_mode)
    );

endmodule
