`timescale 1ns / 1ps



module dp_sv();
 wire [31:0] program_counter;
 reg mux_control;
 reg clk,reset;
 reg [31:0]imm;
 dp dut(.program_counter(program_counter),.mux_control(mux_control),.clk(clk),.reset(reset),.imm(imm));   
 initial 
 begin
   clk =1;
   forever
   begin
        #10 clk=~clk;
    end
 end
 initial begin
      #20 mux_control=1;imm=5;reset=0;
      #40 mux_control=0;imm=5;reset=0;
      #60 mux_control=0;imm=5;reset=0;
      #80 mux_control=1;imm=5;reset=1;
      #100 $finish;
  end
    
        
    
endmodule
