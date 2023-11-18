`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.10.2023 14:12:10
// Design Name: 
// Module Name: register
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


module register(clk,reset,in,out);
input logic clk,reset;
input logic [31:0] in;
output logic out;
always_ff@(posedge clk)
begin
    if (reset==1'b1)
        out<=32'b0;
    else
        out<=in;
end
endmodule
    



  
