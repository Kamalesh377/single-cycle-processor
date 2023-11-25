module pc_plus_offset #(parameter width = 32)(signed_offset,pc_present,pc_plus_signed_offset);

input [width-1:0] signed_offset;
input [width-1:0] pc_present;
output reg [width-1:0] pc_plus_signed_offset;

assign pc_plus_signed_offset=pc_present+signed_offset;
endmodule
