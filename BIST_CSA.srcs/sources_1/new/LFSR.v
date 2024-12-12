`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.12.2024 21:49:28
// Design Name: 
// Module Name: LFSR
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


module LFSR (
    input clk,          // Clock signal
    input reset,        // Reset signal (active high)
    output reg [10:0] lfsr_out, // Output of the LFSR
    output reg finish   // Finish signal, goes high after 2047 cycles
);
    wire feedback; // Feedback signal

    // Feedback logic based on the polynomial 1 + x^2 + x^11
    assign feedback = lfsr_out[10] ^ lfsr_out[1];

    // Counter to track the number of clock cycles
    reg [10:0] counter;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Initialize the LFSR with a non-zero value
            lfsr_out <= 11'b00000000001; 
            counter <= 11'b0; // Reset the counter
            finish <= 1'b0; // Reset the finish signal
        end else begin
            // Shift left and insert the feedback value
            lfsr_out <= {lfsr_out[9:0], feedback};

            // Increment the counter
            counter <= counter + 1;

            // Set the finish signal when the counter reaches 2047
            if (counter == 11'd2046) begin
                finish <= 1'b1;
            end else begin
                finish <= 1'b0;
            end
        end
    end
endmodule
