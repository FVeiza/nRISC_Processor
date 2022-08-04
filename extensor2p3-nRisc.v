/*
	CEFET-MG
	Disciplina de Laboratório de Arquitetura e Organização de Computadores
	Data: 28/08/2021
	Aluno: Fernando Veizaga
	Matricula: 20203001902
*/

module extensor2p3(entrada, saida);
	input [1:0] entrada;
	
	output reg [2:0] saida;
	
	always @ (entrada)
	begin
		saida <= {{1{1'b0}}, entrada[1:0]};
	end
endmodule


module test_extensor2p3;
	reg [1:0] ent;
	
	wire [2:0] saida;
	
	initial begin
		ent = 0;
		#2 ent = 1;
		#2 ent = 2;
		#2 ent = 3;
	end
	
	initial begin
 		$monitor("Time=%0d entrada=%b saida=%b",$time, ent, saida);
 	end
	
	extensor2p3 mod1(ent, saida);
	
endmodule
