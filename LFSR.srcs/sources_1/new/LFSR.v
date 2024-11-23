`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2024 21:46:26
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


module lfsr_32bit (
    input clk,          // Clock signal
    input reset,        // Active high reset
    output [31:0] lfsr_out // Output of the LFSR
);
    reg [31:0] lfsr; // 32-bit LFSR register
    wire feedback;   // Feedback bit
    
    // Feedback logic using the primitive polynomial x^32 + x^22 + x^2 + x + 1
    assign feedback = lfsr[31] ^ lfsr[21] ^ lfsr[1] ^ lfsr[0];

    always @(posedge clk or posedge reset) begin
        if (reset)
            lfsr <= 32'h1; // Initialize LFSR with a non-zero value
        else
            lfsr <= {lfsr[30:0], feedback}; // Shift left and insert feedback bit
    end
    
    assign lfsr_out = lfsr; // Assign output
endmodule
