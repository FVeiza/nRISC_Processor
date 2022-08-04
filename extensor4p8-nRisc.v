/*
	CEFET-MG
	Disciplina de Laboratório de Arquitetura e Organização de Computadores
	Data: 28/08/2021
	Aluno: Fernando Veizaga
	Matricula: 20203001902
*/

module extensor4p8(entrada, saida);
	input [3:0] entrada;
	
	output reg [7:0] saida;
	
	always @ (entrada)
	begin
		saida <= {{4{1'b0}}, entrada[3:0]};
	end
endmodule


module test_extensor4p8;
	reg [3:0] ent;
	
	wire [7:0] saida;
	
	initial begin
		ent = 1;
		#2 ent = 3;
		#2 ent = 7;
		#2 ent = 14;
	end
	
	initial begin
 		$monitor("Time=%0d entrada=%b saida=%b",$time, ent, saida);
 	end
	
	extensor4p8 mod1(ent, saida);
	
endmodule
