/*
	CEFET-MG
	Disciplina de Laboratório de Arquitetura e Organização de Computadores
	Data: 28/08/2021
	Aluno: Fernando Veizaga
	Matricula: 20203001902
*/

module andbranch(zero, sinal, saida);
	input zero, sinal;
	
	output reg saida;
	
	always @ (zero or sinal)
	begin
		saida = (~zero && sinal);
	end
endmodule


module test_andbranch;
	reg zro, sin;
	
	wire saida;
	
	initial begin
		zro = 0;
		sin = 0;
		#2 zro = 1;
		sin = 0;
		#2 zro = 0;
		sin = 1;
		#2 zro = 1;
		sin = 1;
	end
	
	initial begin
 		$monitor("Time=%0d zero=%b sinal=%b saida=%b",$time, zro, sin, saida);
 	end
	
	andbranch mod1(zro, sin, saida);
	
endmodule
