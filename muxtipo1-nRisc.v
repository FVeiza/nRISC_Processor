/*
	CEFET-MG
	Disciplina de Laboratório de Arquitetura e Organização de Computadores
	Data: 28/08/2021
	Aluno: Fernando Veizaga
	Matricula: 20203001902
*/

module muxtipo1(entr0, entr1, saida, sinalt1);
	input [7:0] entr0, entr1;
	input sinalt1;
	
	output reg [7:0] saida;
	
	always @ (entr0 or entr1 or sinalt1)
	begin
		case(sinalt1)
			1'b0: begin saida = entr0; end
			1'b1: begin saida = entr1; end
			default: begin saida = entr0; end
		endcase
	
	end
endmodule


module test_muxtipo1;
	reg [7:0] en0, en1;
	reg sinal;
	
	wire [7:0] saida;
	
	initial begin
		en0 = 5;
		en1 = 7;
		sinal = 0;
		#2 sinal = 1;
		#2 en0 = 56;
		en1 = 43;
		sinal = 0;
		#2 sinal = 1;
	end
	
	initial begin
 		$monitor("Time=%0d entr0=%b entr1=%b sinalt1=%b saida=%b",$time, en0, en1, sinal, saida);
 	end
	
	muxtipo1 mod1(en0, en1, saida, sinal);
	
endmodule
