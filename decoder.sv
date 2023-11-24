module decoder(input logic [31:0]inst, output logic [4:0]rs1, output logic[4:0]rs2, output logic[4:0]rd, output logic[2:0]f3,output logic[6:0]f7,output logic[6:0]op, output logic[11:0]imm);
assign op=inst[6:0];
always_comb
begin
    case(op)
        7'b0110011 : begin // R-type
        rs1<=inst[19:15];
        rs2<=inst[24:20];
        rd<=inst[11:7];
        f3<=inst[14:12];
        f7<=inst[31:24];
         end
        7'b0000011 : begin // Load
        rs1<=inst[19:15];
        rs2<=5'bx;
        rd<=inst[11:7];
         f3<=inst[14:12];
        imm<=inst[31:20];
          end
        7'b0100011 : begin // S-type
        rs1<=inst[19:15];
        rs2<=inst[24:20];
        f3<=inst[14:12];
        imm[11:5]<=inst[31:25];
        imm[4:0]<=inst[11:7];
        rd<=5'bx;
        end
        7'b1100011 : begin // beq-type
 
    
        imm[11] <= inst[31];
        imm[10] <= inst[7];
        imm[9:6] <= inst[11:8];
        imm[5:0] <= inst[30:25];


        rs1<=inst[19:15];
        rs2<=inst[24:20];

        f3<=inst[14:12];

        end
    endcase
end
endmodule
