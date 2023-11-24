module regfile (
  input logic [4:0] rd, rs1, rs2,
  input logic [31:0] writedata,
  input logic regwrite,
  input logic clk, 
  output logic [31:0] readdata1,
  output logic [31:0] readdata2
);

  logic [31:0] registers [0:4];
  
  always_ff @(posedge clk) begin
    
    for (int i = 0; i < 5; i++) begin
      registers[i] <= i;
    end

    if (regwrite) begin
      
      registers[rd] <= writedata;
    end
  end

  
  assign readdata1 = registers[rs1];
  assign readdata2 = registers[rs2];

endmodule
