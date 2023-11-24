module alucontrol(
    input logic [1:0] aluop,
    input logic [2:0] f3,
    input logic [6:0] f7,
    output logic [3:0] aluoperation
);

always_comb begin
    case ({aluop, f7, f3})
        3'b00: aluoperation = 4'b0010;
        3'b01: aluoperation = 4'b0110;
        {2'b10, 7'b0100000, 3'b000}: aluoperation = 4'b0110;
        {2'b10, 7'b0000000, 3'b000}: aluoperation = 4'b0010;
        {2'b10, 7'b0000000, 3'b111}: aluoperation = 4'b0000;
        {2'b10, 7'b0000000, 3'b110}: aluoperation = 4'b0001;
        

        default: aluoperation = 4'b0000; // Default value if no condition is met
    endcase
end

endmodule
