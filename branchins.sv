module branchins(
    input logic [31:0] immgen,
    input logic [31:0] pc,
    output logic [31:0] pc_branch,
    output logic [31:0] muxcontrol,
    input logic branch,
    input logic zero_flag
);

logic [31:0] imm;
assign muxconrtol= branch&zero_flag;

always_comb begin
    imm = immgen << 1;

    if (imm[31] == 0) begin
        pc_branch = imm + pc;
    end else begin
        pc_branch = pc - imm;
    end
    
    
end

endmodule
