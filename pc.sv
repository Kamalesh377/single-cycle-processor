`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.10.2023 12:53:30
// Design Name: 
// Module Name: pc
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


module pc(program_counter,program_counter_nxt,mux_control,imm);
input logic [31:0]program_counter;
input logic mux_control;
input logic [31:0] imm;
output logic [31:0]program_counter_nxt;

assign program_counter_nxt = mux_control ? program_counter+32'h00000004:program_counter+imm;

endmodule
