`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.12.2024 22:46:49
// Design Name: 
// Module Name: CSA
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


module CSA(
    input [4:0] a,       // First 5-bit input
    input [4:0] b,       // Second 5-bit input
    input cin,           // Carry-in input
    output [4:0] sum,    // 5-bit Sum output
    output cout          // Carry-out output
);
    wire [4:0] sum0, sum1; // Sum assuming carry-in is 0 or 1
    wire carry0, carry1;   // Carry-out assuming carry-in is 0 or 1

    // Ripple Carry Adder for carry-in = 0
    ripple_carry_adder_5bit RCA0 (
        .a(a),
        .b(b),
        .cin(1'b0),
        .sum(sum0),
        .cout(carry0)
    );

    // Ripple Carry Adder for carry-in = 1
    ripple_carry_adder_5bit RCA1 (
        .a(a),
        .b(b),
        .cin(1'b1),
        .sum(sum1),
        .cout(carry1)
    );

    // Select the appropriate sum and carry based on the actual carry-in
    assign sum = cin ? sum1 : sum0;
    assign cout = cin ? carry1 : carry0;

endmodule

// Ripple Carry Adder Module (used in Carry Select Adder)
module ripple_carry_adder_5bit (
    input [4:0] a,
    input [4:0] b,
    input cin,
    output [4:0] sum,
    output cout
);
    wire [4:0] carry;

    // Full adder for each bit
    assign {carry[0], sum[0]} = a[0] + b[0] + cin;
    assign {carry[1], sum[1]} = a[1] + b[1] + carry[0];
    assign {carry[2], sum[2]} = a[2] + b[2] + carry[1];
    assign {carry[3], sum[3]} = a[3] + b[3] + carry[2];
    assign {cout, sum[4]} = a[4] + b[4] + carry[3];
endmodule
