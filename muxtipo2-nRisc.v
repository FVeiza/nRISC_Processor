/*
	CEFET-MG
	Disciplina de Laboratório de Arquitetura e Organização de Computadores
	Data: 28/08/2021
	Aluno: Fernando Veizaga
	Matricula: 20203001902
*/

module muxtipo2(entr0, saida, sinalt2);
	input [2:0] entr0;
	input [1:0] sinalt2;
	
	output reg [2:0] saida;
	
	always @ (entr0 or sinalt2)
	begin
		case(sinalt2)
			2'b00: begin saida = entr0; end
			2'b01: begin saida = 3'b001; end
			2'b10: begin saida = 3'b010; end
			default: begin saida = entr0; end
		endcase
	
	end
endmodule


module test_muxtipo2;
	reg [2:0] en0;
	reg [1:0] sinal;
	
	wire [2:0] saida;
	
	initial begin
		en0 = 5;
		sinal = 0;
		#2 sinal = 1;
		#2 sinal = 2;
		#2 en0 = 2;
		sinal = 0;
		#2 sinal = 1;
		#2 sinal = 2;
	end
	
	initial begin
 		$monitor("Time=%0d entr0=%b sinalt2=%b saida=%b",$time, en0, sinal, saida);
 	end
	
	muxtipo2 mod1(en0, saida, sinal);
	
endmodule
