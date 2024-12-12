`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.12.2024 18:00:29
// Design Name: 
// Module Name: ANALYZER
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

module ANALYZER (
    input wire completed,
    input wire [5:0] misr_result,
    output reg detected  // Declared as reg for use in procedural block
);

    always @(*) begin
        if (!completed) begin
            detected = 0; // Default to 0 if not completed
        end else begin
            if (misr_result == 6'b010011) begin
                detected = 1; // Set to 1 if misr_result matches
            end else begin
                detected = 0; // Otherwise set to 0
            end
        end
    end

endmodule
