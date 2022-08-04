/*
	CEFET-MG
	Disciplina de Laboratório de Arquitetura e Organização de Computadores
	Data: 28/08/2021
	Aluno: Fernando Veizaga
	Matricula: 20203001902
*/

module somadorbranch(entr0, entr1, saida);
	input [7:0] entr0, entr1;
	
	output reg [7:0] saida;
	
	always @ (entr0 or entr1)
	begin
		saida = entr0 + entr1;
	end
endmodule


module test_somadorbranch;
	reg [7:0] ent0, ent1;
	
	wire [7:0] saida;
	
	initial begin
		ent0 = 128;
		ent1 = 20;
		#2 ent0 = 150;
		ent1 = 15;
		#2 ent0 = 200;
		ent1 = 10;
		#2 ent0 = 250;
		ent1 = 5;
	end
	
	initial begin
 		$monitor("Time=%0d entr0=%b entr1=%b saida=%b",$time, ent0, ent1, saida);
 	end
	
	somadorbranch mod1(ent0, ent1, saida);
	
endmodule
