module mux_pc #(parameter width = 32) (pc_plus_four,pc_plus_offset,branch_select,pc_next);

input [width-1:0] pc_plus_four;
input [width-1:0] pc_plus_offset;
input branch_select;
output reg [width-1:0]pc_next;

assign pc_next=branch_select?pc_plus_offset:pc_plus_four;
endmodule
