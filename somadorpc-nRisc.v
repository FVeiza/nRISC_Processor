/*
	CEFET-MG
	Disciplina de Laboratório de Arquitetura e Organização de Computadores
	Data: 28/08/2021
	Aluno: Fernando Veizaga
	Matricula: 20203001902
*/

module somadorpc(entr, saida);
	input [7:0] entr;
	
	output reg [7:0] saida;
	
	always @ (entr)
	begin
		saida = entr + 8'b00000001;
	end
endmodule

module test_somadorpc;
	reg [7:0] ent;
	
	wire [7:0] saida;
	
	initial begin
		ent = 128;
		#2 ent = 150;
		#2 ent = 200;
		#2 ent = 250;
	end
	
	initial begin
 		$monitor("Time=%0d entrada=%b saida=%b",$time, ent, saida);
 	end
	
	somadorpc mod1(ent, saida);
	
endmodule
