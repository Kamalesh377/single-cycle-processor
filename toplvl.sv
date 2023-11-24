module toplvl(
    // Inputs
    input logic [1:0] aluop,
    input logic [2:0] f3,
    input logic [6:0] f7,
    input logic [31:0] readdata1,
    input logic [31:0] readdata2,
    input logic [31:0] immgen,
    input logic alusrc,
    
    input logic [31:0] pc,

    // Outputs
    
    output logic [31:0] alu_output,
    output logic zero_flag,
    output logic [31:0] pc_branch
);
wire [3:0] aluoperation;


  // Instantiate modules
  alucontrol aluctl_inst(
    .aluop(aluop),
    .f3(f3),
    .f7(f7),
    .aluoperation(aluoperation)
    
  );

  alu alu_inst(
    .readdata1(readdata1),
    .readdata2(readdata2),
    .immgen(immgen),
    .aluoperation(aluoperation),
    .alusrc(alusrc),
    .alu_output(alu_output),
    .zero_flag(zero_flag)
  );

  branchins branchins_inst(
    .immgen(immgen),
    .pc(pc),
    .pc_branch(pc_branch)
  );

  

endmodule
