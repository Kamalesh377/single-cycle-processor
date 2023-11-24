module control #(parameter data_width = 32)(op,alusrc,memtoreg,regwrite,memread,memwrite,branch,aluop);


input [6:0]op;

output logic[1:0]aluop;
output logic alusrc,memtoreg,regwrite,memread,memwrite,branch;

always@(*)
	begin
      if(op == 7'b0110011)
					begin aluop = 2'b10;alusrc=0 ;memtoreg=0 ;regwrite=1 ;memread=0 ;memwrite=0 ;branch=0 ; end
      if(op == 7'b0000011)
					begin aluop = 2'b00;alusrc=1 ;memtoreg=1 ;regwrite=1 ;memread=1 ;memwrite=0 ;branch=0 ; end
      if(op == 7'b0100011)
					begin aluop = 2'b00;alusrc=1 ;memtoreg=0 ;regwrite=0 ;memread=0 ;memwrite=1 ;branch=0 ; end
      if(op == 7'b1100011)
					begin aluop = 2'b01;alusrc=0 ;memtoreg=0 ;regwrite=0 ;memread=0 ;memwrite=0 ;branch=1 ; end

	end
endmodule
