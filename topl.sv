module topl (
  input logic [31:0] inst,
  input logic [31:0] writedata,
  
  input logic clk, 
  output logic [31:0] readdata1,
  output logic [31:0] readdata2,
  output logic [2:0] f3,
  output logic [6:0] f7,
  output logic [1:0] aluop,
  output logic alusrc, memtoreg, regwrite_ctrl, memread, memwrite, branch,
  output logic signed [31:0] immgen
);

  logic [4:0] rs1, rs2, rd;
  
  logic [6:0]  op;
  logic [11:0] imm;
  

  // Instantiate modules
  decoder decoder_inst (
    .inst(inst),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .f3(f3),
    .f7(f7),
    .op(op),
    .imm(imm)
  );

  control  control_inst (
    .op(op),
    .aluop(aluop),
    .alusrc(alusrc),
    .memtoreg(memtoreg),
    .regwrite(regwrite_ctrl),
    .memread(memread),
    .memwrite(memwrite),
    .branch(branch)
  );

  immgenerator immgenerator_inst (
    .imm(imm),
    .immgen(immgen)
  );

  regfile regfile_inst (
    .rd(rd),
    .rs1(rs1),
    .rs2(rs2),
    .writedata(writedata),
    .regwrite(regwrite_ctrl),
    .clk(clk),
    .readdata1(readdata1),
    .readdata2(readdata2)
  );

 
  

endmodule
