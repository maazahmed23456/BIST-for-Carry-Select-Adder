`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.12.2024 18:30:13
// Design Name: 
// Module Name: TOP_WITH_FAULT_TB
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


module TOP_WITH_FAULT_TB();
reg clk;
reg rst;
reg [4:0]a;
reg [4:0]b;
reg cin;
reg BIST_MODE;
wire cout;
wire [4:0]sum;
wire [5:0]misr_output;
wire complete;
wire fault_detected;

TOP_WITH_FAULT uut(
.clk(clk),
.rst(rst),
.a(a),
.b(b),
.cin(cin),
.BIST_MODE(BIST_MODE),
.cout(cout),
.sum(sum),
.misr_output(misr_output),
.complete(complete),
.fault_detected(fault_detected)
);

initial begin
        clk = 0;
        forever #5 clk = ~clk; // Clock with a period of 10 ns
    end
    
initial begin
rst = 1;
a = 0;
b = 0;
cin = 0;
#10;
rst = 0;
BIST_MODE = 1;
#20500;
$finish;
end

endmodule