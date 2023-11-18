module alu(
  input logic [31:0] operand1,
  input logic [31:0] operand2,
  input string operation,
  input bit muxcontrol,
  output logic [31:0] alu_output,
  output bit zero_flag
);

  always_comb begin
    case(operation)
      "add": alu_output = operand1 + operand2;
      "sub": alu_output = operand1 - operand2;
      "and": alu_output = operand1 & operand2;
      "or": alu_output = operand1 | operand2;
      "lw": alu_output = operand1 + operand2;
      "sw": alu_output = operand1 + operand2;
      "beq": alu_output = operand1 - operand2;
      default: alu_output = 32'b0; 
    endcase

    // Check for zero_flag condition
    if (operation == "beq" && alu_output == 32'b0) begin
      zero_flag = 1'b1;
    end else begin
      zero_flag = 1'b0;
    end
  end

endmodule
