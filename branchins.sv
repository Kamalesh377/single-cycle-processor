module branchins(
    input logic [31:0] immgen,
    input logic [31:0] pc,
    output logic [31:0] pc_branch,
    input logic branch,
    input logic zero_flag
    output logic muxcontrol
);

logic [31:0] imm;
assign muxcontol= branch&zero_flag;

always_comb begin
    imm = immgen << 1;

    if (imm[31] == 0) begin
        pc_branch = imm + pc;
    end else begin
        pc_branch = pc - imm;
    end
    
    
end

endmodule
