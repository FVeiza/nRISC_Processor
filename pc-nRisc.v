/*
	CEFET-MG
	Disciplina de Laboratório de Arquitetura e Organização de Computadores
	Data: 10/08/2021
	Aluno: Fernando Veizaga
	Matricula: 20203001902
*/

module pc (Entrada, reset, clock, PCEsc, Saida);
	input [7:0] Entrada;
	input reset, clock, PCEsc;

	output reg [7:0] Saida;
/*
	initial begin
		Saida = 8'b10000000;
	end
*/	
	always @ (posedge clock)
	begin
		if((PCEsc>=1'b1) && ((Entrada >= 8'b10000000) && (Entrada <= 8'b11111111)))
		begin
			Saida = Entrada;
		end

		if(reset==1'b1)
		begin
			Saida = 8'b10000000;
		end
	end

endmodule

module test_pc;

	reg [7:0] entr;
	reg res, clk, pcesc;
	wire [7:0] saida;
	
	always begin
		clk = 0;
		#1 clk = 1;
		#1 clk = 0;
	end
	
	integer i;
	initial begin
		entr = 8'b10000000;
		res = 0;
		pcesc = 1;
		for(i = 0; i < 128; i = i+1)
		begin
			#1 entr = entr + 1;
		end
		#1 pcesc = 0;
		#5 res = 1; 
	end
	
	initial begin
 		$monitor("Time=%0d entr=%b res=%b pcesc=%b clk=%b saida=%b",$time, entr, res, pcesc, clk, saida);
 	end
	
	pc mod1(entr, res, clk, pcesc, saida);

endmodule

