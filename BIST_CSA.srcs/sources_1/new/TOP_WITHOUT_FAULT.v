`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.12.2024 17:36:15
// Design Name: 
// Module Name: TOP_WITHOUT_FAULT
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


module TOP_WITHOUT_FAULT(
input clk ,
input rst,
input [4:0]a,
input [4:0]b,
input cin,
input BIST_MODE,
output cout,
output [4:0]sum,
output [5:0]misr_output,
output complete
);

wire [4:0]a_mux;
wire [4:0]b_mux;
wire cin_mux;
wire [10:0]lfsr_within;
wire lfsr_finish;

assign a_mux = BIST_MODE ? lfsr_within[4:0] : a;
assign b_mux = BIST_MODE ? lfsr_within[9:5] : b;
assign cin_mux = BIST_MODE ? lfsr_within[10] : cin;

CSA M1 (
.a(a_mux),
.b(b_mux),
.cin(cin_mux),
.sum(sum),
.cout(cout)
);

LFSR M2 (
.clk(clk),
.reset(rst),
.lfsr_out(lfsr_within),
.finish(lfsr_finish)
);

MISR M3 (
.clk(clk),
.reset(rst),
.sum(sum),
.cout(cout),
.misr_out(misr_output)
);

assign complete = lfsr_finish;

endmodule

















