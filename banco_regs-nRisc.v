/*
	CEFET-MG
	Disciplina de Laboratório de Arquitetura e Organização de Computadores
	Data: 10/08/2021
	Aluno: Fernando Veizaga
	Matricula: 20203001902
*/

module banco_regs (Reg1, Reg2, RegEscr, DadoEscr, EscReg, Dado1, Dado2, clock, reset);
	input [2:0] Reg1, Reg2, RegEscr;
	input [7:0] DadoEscr; 
	input EscReg, clock, reset;
	
	output [7:0] Dado1, Dado2; 
	reg [7:0] BR [7:0];
	integer i;
	initial begin
		BR[8'b0] <= 8'b0;
		for(i=0;i<8;i=i+1)
			begin
				BR[i] <= 8'b0;
			end
	end 
	
	assign Dado1 = BR[Reg1];
	assign Dado2 = BR[Reg2];
	
	always @(posedge clock) 
	begin
		if ((EscReg) && (RegEscr != 3'b000))
		begin	
			BR[RegEscr] <= DadoEscr;
		end
			
		if(reset==1'b1)
		begin
			for(i=0;i<8;i=i+1)
			begin
				BR[i] <= 8'b0;
			end
		end
	end
endmodule

module test_bancoreg;
	reg [2:0] reg1, reg2, regescr;
	reg [7:0] dadoescr;
	reg escreg, clk, rst;
	
	wire [7:0] dado1, dado2;
	
	always begin
		clk = 0;
		#1 clk = 1;
		#1 clk = 0;
	end
	
	initial begin
		escreg = 0;
		reg1 = 3;
		reg2 = 6;
		regescr = 3;
		dadoescr = 10;
		rst = 0;
		#2 escreg = 1;
		#2 regescr = 6; 
		dadoescr = 5;
		#2 rst = 1;	
	end
	
	initial begin
 		$monitor("Time=%0d reg1=%b reg2=%b regescr=%b dadoescr=%b escreg=%b clock=%b reset=%b dado1=%b dado2=%b",$time, reg1, reg2, regescr, dadoescr, escreg, clk, rst, dado1, dado2);
 	end
	
	banco_regs mod1(reg1, reg2, regescr, dadoescr, escreg, dado1, dado2, clk, rst);
	
endmodule
