/*
	CEFET-MG
	Disciplina de Laboratório de Arquitetura e Organização de Computadores
	Data: 28/08/2021
	Aluno: Fernando Veizaga
	Matricula: 20203001902
*/

module muxtipo3(entr0, entr1, entr2, saida, sinalt3);
	input [2:0] entr0, entr1, entr2;
	input [1:0] sinalt3;
	
	output reg [2:0] saida;
	
	always @ (entr0 or entr1 or entr2 or sinalt3)
	begin
		case(sinalt3)
			2'b00: begin saida = entr0; end
			2'b01: begin saida = entr1; end
			2'b10: begin saida = entr2; end
			default: begin saida = entr0; end
		endcase
	
	end
	
endmodule


module test_muxtipo3;
	reg [2:0] en0, en1, en2;
	reg [1:0] sinal;
	
	wire [2:0] saida;
	
	initial begin
		en0 = 1;
		en1 = 2;
		en2 = 3;
		sinal = 2'b00;
		#2 sinal = 2'b01;
		#2 sinal = 2'b10;
		#2 en0 = 4;
		en1 = 5;
		en2 = 6;
		sinal = 2'b00;
		#2 sinal = 2'b01;
		#2 sinal = 2'b10;
	end
	
	initial begin
 		$monitor("Time=%0d entr0=%b entr1=%b entr3=%b sinalt3=%b saida=%b",$time, en0, en1, en2, sinal, saida);
 	end
	
	muxtipo3 mod1(en0, en1, en2, saida, sinal);
	
endmodule