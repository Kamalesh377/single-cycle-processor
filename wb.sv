module wb (
    input logic [31:0] data_out,
    input logic [31:0] operand_2,
    input bit memtoreg,
    output logic [31:0] writedata
);

assign writedata = memtoreg ? data_out : operand_2;

endmodule
