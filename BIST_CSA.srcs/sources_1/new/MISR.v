`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.12.2024 22:04:39
// Design Name: 
// Module Name: MISR
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

module MISR (
    input clk,                  // Clock signal
    input reset,                // Reset signal (active high)
    input [4:0] sum,
    input cout,           // Input data signals: summ[0] to summ[4]
    output reg [5:0] misr_out   // MISR output: 6-bit register
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Reset MISR to initial state
            misr_out <= 6'b000000;
        end else begin
            // Update MISR based on the XOR feedback logic
            misr_out[0] <= misr_out[5] ^ sum[0];
            misr_out[1] <= misr_out[0] ^ sum[1]^misr_out[5];
            misr_out[2] <= misr_out[1] ^ sum[2];
            misr_out[3] <= misr_out[2] ^ sum[3];
            misr_out[4] <= misr_out[3] ^ sum[4];
            misr_out[5] <= misr_out[4]^cout; // Feedback connection from D4
        end
    end

endmodule
