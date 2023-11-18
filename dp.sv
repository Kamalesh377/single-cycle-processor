`timescale 1ns / 1ps



module dp(clk,reset,program_counter,mux_control,imm);
input logic clk,reset,mux_control;
input logic [31:0]imm;
output logic [31:0]program_counter;
 pc prog_counter(program_counter,program_counter_nxt,mux_control,imm);
 register pc_logic(clk,reset,in,out);


    
endmodule
