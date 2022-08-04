/*
	CEFET-MG
	Disciplina de Laboratório de Arquitetura e Organização de Computadores I
	Data: 04/09/2021
	Aluno: Fernando Veizaga
	Matricula: 20203001902
*/

include "andbranch-nRisc.v";
include "banco_regs-nRisc.v";
include "controle-nRisc.v";
include "extensor1p3-nRisc.v";
include "extensor2p3-nRisc.v";
include "extensor2p8-nRisc.v";
include "extensor4p8-nRisc.v";
include "memoria_dados-nRisc.v";
include "memoria_instrucoes-nRisc.v";
include "muxtipo1-nRisc.v";
include "muxtipo2-nRisc.v";
include "muxtipo3-nRisc.v";
include "pc-nRisc.v";
include "somadorbranch-nRisc.v";
include "somadorpc-nRisc.v";
include "ULA-nRisc.v";

module mips8bits (clock, reset, valorescrito, pc_out, valorinstrucao, tulares, tfonte1, tfonte2, treg1, treg2, tmux0, tmux1, tmux2);

	input clock, reset;
	output [7:0] valorescrito, pc_out, valorinstrucao, tulares, tfonte1, tfonte2;
	output [2:0] treg1, treg2, tmux0, tmux1, tmux2;
	
	wire [7:0] pc_in;
	wire [7:0] ender;
	wire [7:0] instrucao;
	wire [1:0] mux1en0;
	wire [2:0] mux1en0ext;
	wire [2:0] mux1en1;
	wire mux1en2;
	wire [2:0] mux1en2ext;
	wire [2:0] mux2en0;
	wire [2:0] mux3en0;
	wire [1:0] imediato2bits;
	wire [7:0] imediato8bits;
	wire [2:0] reg1;
	wire [2:0] reg2;
	wire [2:0] regescr;
	wire [3:0] branch4bits;
	wire [7:0] branch8bits;
	wire [2:0] opcode;
	wire [4:0] jump5bits;
	wire [7:0] jump8bits;
	wire [7:0] dado1;
	wire [7:0] dado2;
	wire [7:0] operando1;
	wire [7:0] operando2;
	wire zero;
	wire [7:0] ulares;
	wire [7:0] dadolido;
	wire [7:0] dadoescrito;
	wire [7:0] somapc;
	wire [7:0] somabranch;
	wire [7:0] muxbranch;
	wire pcesc, escreg, ulafonte1, ulafonte2, escmem, lermem, regfonte, branchne, jump;
	wire [1:0] regdst, reglido1, reglido2, ulaop;
	wire sinaland;
	
	pc modulo_pc(pc_in, reset, clock, pcesc, ender);
	
	mem_instr modulo_mem_instr(ender, instrucao, clock);
	
	assign mux1en0 = instrucao[1:0];
	assign mux1en1 = instrucao[4:2];
	assign mux1en2 = instrucao[4];
	
	extensor2p3 modulo_extensor2p3(mux1en0, mux1en0ext);
	
	extensor1p3 modulo_extensor1p3(mux1en2, mux1en2ext);
	
	assign mux2en0 = instrucao[4:2];
	assign mux3en0 = instrucao[4:2];
	
	muxtipo3 modulo_muxtipo3(mux1en0ext, mux1en1, mux1en2ext, reg2, reglido2);
	
	muxtipo2 modulo1_muxtipo2(mux2en0, reg1, reglido1);
	
	muxtipo2 modulo2_muxtipo2(mux3en0, regescr, regdst);
	
	assign imediato2bits = instrucao[1:0];
	
	extensor2p8 modulo_extensor2p8(imediato2bits, imediato8bits);
	
	assign branch4bits = instrucao[3:0];
	
	extensor4p8 modulo_extensor4p8(branch4bits, branch8bits);
	
	assign opcode = instrucao[7:5];
	
	controle modulo_controle(opcode, reset, clock, pcesc, regdst, reglido1, reglido2, escreg, ulafonte1, ulafonte2, ulaop, escmem, lermem, regfonte, branchne, jump);
	
	assign jump5bits = instrucao[4:0];
	
	banco_regs modulo_banco_regs(reg1, reg2, regescr, dadoescrito, escreg, dado1, dado2, clock, reset);
	
	muxtipo1 modulo1_muxtipo1(dado2, imediato8bits, operando2, ulafonte2);
	
	muxtipo1 modulo2_muxtipo1(dado1, dado2, operando1, ulafonte1);
	
	ula modulo_ula(operando1, operando2, ulaop, ulares, zero);
	
	memoria_dados modulo_memoria_dados(ulares, dado1, escmem, lermem, dadolido, clock, reset);
	
	muxtipo1 modulo3_muxtipo1(ulares, dadolido, dadoescrito, regfonte);
	
	somadorpc modulo_somadorpc(ender, somapc);
	
	somadorbranch modulo_somadorbranch(branch8bits, somapc, somabranch);
	
	andbranch modulo_andbranch(zero, branchne, sinaland);
	
	muxtipo1 modulo4_muxtipo1(somapc, somabranch, muxbranch, sinaland);
	
	assign jump8bits = {somapc[7:5], jump5bits[4:0]};
	
	muxtipo1 modulo5_muxtipo1(muxbranch, jump8bits, pc_in, jump);
	
	assign valorescrito = dadoescrito;
	assign pc_out = ender;
	assign valorinstrucao = instrucao;
	assign tulares = ulares;
	assign tfonte1 = operando1;
	assign tfonte2 = operando2;
	assign treg1 = reg1;
	assign treg2 = reg2;
	assign tmux0 = mux1en0ext;
	assign tmux1 = mux1en1;
	assign tmux2 = mux1en2ext;
	
endmodule

module test_mips8bits;
	reg clk, res;
	
	wire [7:0] vlrescr, pc_out, instr, tula, tfon1, tfon2;
	wire [2:0] tre1, tre2, mux0, mux1, mux2;
	
	always begin
		clk = 0;
		#1 clk = 1;
		#1 clk = 0;
	end
	
	initial begin
		res = 1;
		#2 res = 0;
		#100 res = 1;
	end
	
	initial begin
 		$monitor("Time=%0d clock=%b reset=%b valorescrito=%b pc_out=%b valorinstrucao=%b tula=%b op1=%b op2=%b reg1=%b reg2=%b mux0=%b mux1=%b mux2=%b",$time, clk, res, vlrescr, pc_out, instr, tula, tfon1, tfon2, tre1, tre2, mux0, mux1, mux2);
 	end
	
	mips8bits modulo1(clk, res, vlrescr, pc_out, instr, tula, tfon1, tfon2, tre1, tre2, mux0, mux1, mux2);
	
endmodule

