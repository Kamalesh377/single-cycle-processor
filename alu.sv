

module alu(
  input logic [31:0] readdata1,
  input logic [31:0] readdata2,
  input logic [31:0] immgen,
  input logic [3:0] aluoperation,
  input logic alusrc,
  output logic [31:0] alu_output,
  output logic zero_flag
);

  logic [31:0] operand2;

  assign operand2 = alusrc ? immgen : readdata2;

  always_comb begin
    case(aluoperation)
      4'b0000: alu_output = readdata1 & operand2;
      4'b0001: alu_output = readdata1 | operand2;
      4'b0010: alu_output = readdata1 + operand2;
      4'b0110: alu_output = readdata1 - operand2;
      default: alu_output = 32'b0; 
    endcase

    // Check for zero_flag condition
    if (aluoperation == 4'b0110 && alu_output == 32'b0) begin
      zero_flag = 1'b1;
    end else begin
      zero_flag = 1'b0;
    end
  end

endmodule
