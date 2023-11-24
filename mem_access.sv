module memory_access(
    input logic [31:0] address,
    input logic mem_write,
    input logic [31:0] write_data,
    input logic mem_read,
    output logic [31:0] data_out
);

    logic [31:0] memory_array [0:3]; 

    // Initialize memory_array with ascending values
    initial begin
        for (int i = 0; i < 6; i = i + 1) begin
            memory_array[i] = i;
        end
    end

    always_comb begin
        if (mem_read) begin
            case (address)
                32'h00000000: data_out = memory_array[0];
                32'h00000004: data_out = memory_array[1];
                32'h00000008: data_out = memory_array[2];
                32'h0000000C: data_out = memory_array[3];
                32'h00000010: data_out = memory_array[4];
                32'h00000014: data_out = memory_array[5];
                default: data_out = 32'b0000_0000; 
            endcase
        end else if (mem_write) begin
            case (address)
                32'h00000000: memory_array[0] = write_data;
               32'h00000004: memory_array[1] = write_data;
                32'h00000008: memory_array[2] = write_data;
                32'h0000000C: memory_array[3] = write_data;
                32'h00000010: memory_array[4] = write_data;
                32'h00000014: memory_array[5] = write_data;
            endcase
        end else begin
            data_out = 32'b0000_0000; 
        end
    end

endmodule
