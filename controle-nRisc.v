/*
	CEFET-MG
	Disciplina de Laboratório de Arquitetura e Organização de Computadores I
	Data: 10/08/2021
	Aluno: Fernando Veizaga
	Matricula: 20203001902
*/
	
module controle (opcode, reset, clock, PCEsc, RegDst, RegLido1, RegLido2, EscReg, ULAFonte1, ULAFonte2, ULAOp, EscMem, LerMem, RegFonte, BranchNE, Jump);
	input [2:0] opcode;
	input reset, clock;
	
	output reg PCEsc, EscReg, ULAFonte1, ULAFonte2, EscMem, LerMem, RegFonte, BranchNE, Jump;
	output reg [1:0] RegDst, RegLido1, RegLido2, ULAOp;
	
	always @(posedge clock) 
	begin
		if(reset==1'b1)
		begin
			PCEsc = 1'b1;
			RegDst = 2'b00;
			RegLido1 = 2'b00;
			RegLido2 = 2'b00;
			EscReg = 1'b0;
			ULAFonte1 = 1'b0;
			ULAFonte2 = 1'b0;
			ULAOp = 2'b00;
			EscMem = 1'b0;
			LerMem = 1'b0;
			RegFonte = 1'b0;
			BranchNE = 1'b0;
			Jump = 1'b0;
		end
		
		else begin
			case (opcode)
				3'b000: begin	//bne
					PCEsc = 1'b1;
					RegDst = 2'b00;
					RegLido1 = 2'b01;
					RegLido2 = 2'b10;
					EscReg = 1'b0;
					ULAFonte1 = 1'b0;
					ULAFonte2 = 1'b0;
					ULAOp = 2'b01;
					EscMem = 1'b0;
					LerMem = 1'b0;
					RegFonte = 1'b0;
					BranchNE = 1'b1;
					Jump = 1'b0;
					end
					
				3'b001: begin	//slt
					PCEsc = 1'b1;
					RegDst = 2'b01;
					RegLido1 = 2'b00;
					RegLido2 = 2'b00;
					EscReg = 1'b1;
					ULAFonte1 = 1'b0;
					ULAFonte2 = 1'b0;
					ULAOp = 2'b10;
					EscMem = 1'b0;
					LerMem = 1'b0;
					RegFonte = 1'b0;
					BranchNE = 1'b0;
					Jump = 1'b0;
					end
					
				3'b010: begin	//lw
					PCEsc = 1'b1;
					RegDst = 2'b10;
					RegLido1 = 2'b00;
					RegLido2 = 2'b00;
					EscReg = 1'b1;
					ULAFonte1 = 1'b0;
					ULAFonte2 = 1'b1;
					ULAOp = 2'b00;
					EscMem = 1'b0;
					LerMem = 1'b1;
					RegFonte = 1'b1;
					BranchNE = 1'b0;
					Jump = 1'b0;
					end
				
				3'b011: begin	//sw
					PCEsc = 1'b1;
					RegDst = 2'b00;
					RegLido1 = 2'b10;
					RegLido2 = 2'b01;
					EscReg = 1'b0;
					ULAFonte1 = 1'b1;
					ULAFonte2 = 1'b1;
					ULAOp = 2'b00;
					EscMem = 1'b1;
					LerMem = 1'b0;
					RegFonte = 1'b0;
					BranchNE = 1'b0;
					Jump = 1'b0;
					end
				
				3'b100: begin	//add
					PCEsc = 1'b1;
					RegDst = 2'b00;
					RegLido1 = 2'b00;
					RegLido2 = 2'b00;
					EscReg = 1'b1;
					ULAFonte1 = 1'b0;
					ULAFonte2 = 1'b0;
					ULAOp = 2'b00;
					EscMem = 1'b0;
					LerMem = 1'b0;
					RegFonte = 1'b0;
					BranchNE = 1'b0;
					Jump = 1'b0;
					end
				
				3'b101: begin	//addi
					PCEsc = 1'b1;
					RegDst = 2'b00;
					RegLido1 = 2'b00;
					RegLido2 = 2'b00;
					EscReg = 1'b1;
					ULAFonte1 = 1'b0;
					ULAFonte2 = 1'b1;
					ULAOp = 2'b00;
					EscMem = 1'b0;
					LerMem = 1'b0;
					RegFonte = 1'b0;
					BranchNE = 1'b0;
					Jump = 1'b0;
					end
				
				3'b110: begin	//jump
					PCEsc = 1'b1;
					RegDst = 2'b00;
					RegLido1 = 2'b00;
					RegLido2 = 2'b00;
					EscReg = 1'b0;
					ULAFonte1 = 1'b0;
					ULAFonte2 = 1'b0;
					ULAOp = 2'b00;
					EscMem = 1'b0;
					LerMem = 1'b0;
					RegFonte = 1'b0;
					BranchNE = 1'b0;
					Jump = 1'b1;
					end
				
				3'b111: begin	//halt
					PCEsc = 1'b0;
					RegDst = 2'b00;
					RegLido1 = 2'b00;
					RegLido2 = 2'b00;
					EscReg = 1'b0;
					ULAFonte1 = 1'b0;
					ULAFonte2 = 1'b0;
					ULAOp = 2'b00;
					EscMem = 1'b0;
					LerMem = 1'b0;
					RegFonte = 1'b0;
					BranchNE = 1'b0;
					Jump = 1'b0;
					end
					
				default: begin
					PCEsc = 1'b1;
					RegDst = 2'b00;
					RegLido1 = 2'b00;
					RegLido2 = 2'b00;
					EscReg = 1'b1;
					ULAFonte1 = 1'b0;
					ULAFonte2 = 1'b1;
					ULAOp = 2'b00;
					EscMem = 1'b0;
					LerMem = 1'b0;
					RegFonte = 1'b0;
					BranchNE = 1'b0;
					Jump = 1'b0;
				end
			endcase
		end
	end
	
endmodule

module test_controle;
	reg [2:0] opc;
	reg clk, rst;
	
	wire pcesc, escreg, ulafonte1, ulafonte2, escmem, lermem, regfonte, branchne, jump;
	wire [1:0] regdst, reglido1, reglido2, ulaop;
	
	always begin
		clk = 0;
		#1 clk = 1;
		#1 clk = 0;
	end
	integer i;
	initial begin
		rst = 0;
		opc = 0;
		for(i=0; i<8; i=i+1)
		begin
			#2 opc = opc + 1;
		end
		#2 rst = 1;
	end
	
	initial begin
 		$monitor("Time=%0d opcode=%b reset=%b clock=%b pcesc=%b escreg=%b ulafonte1=%b ulafonte2=%b escmem=%b lermem=%b regfonte=%b branchne=%b jump=%b regdst=%b reglido1=%b reglido2=%b ulaop=%b",$time, opc, rst, clk, pcesc, escreg, ulafonte1, ulafonte2, escmem, lermem, regfonte, branchne, jump, regdst, reglido1, reglido2, ulaop);
 	end
	
	controle mod1(opc, rst, clk, pcesc, regdst, reglido1, reglido2, escreg, ulafonte1, ulafonte2, ulaop, escmem, lermem, regfonte, branchne, jump);
	
endmodule
