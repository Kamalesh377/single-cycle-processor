module immgenerator (
  input logic [11:0] imm,
  output logic signed [31:0] immgen
);
  always_comb begin
    
    immgen = {{20{imm[11]}}, imm};
  end
endmodule
