/*
	CEFET-MG
	Disciplina de Laboratório de Arquitetura e Organização de Computadores
	Data: 10/08/2021
	Aluno: Fernando Veizaga
	Matricula: 20203001902
*/

module memoria_dados (Endereco, DadoEscr, EscMem, LerMem, DadoLido, clock, reset);
	input [7:0] Endereco, DadoEscr;
	input EscMem;
	input LerMem;
	input clock;
	input reset;
	
	output reg [7:0] DadoLido;
	
	reg [7:0] mem_dados [127:0];
	integer i;
	initial begin 
		DadoLido <= 8'b0;
		for(i=0;i<128;i=i+1)
		begin		
			mem_dados[i] <= 8'b0;  
		end
	end
	
	always @(posedge clock) 
	begin
		if (EscMem == 1'b1)
		begin		
			mem_dados[Endereco] <= DadoEscr;
		end
			
		if (LerMem == 1'b1)
		begin
			DadoLido <= mem_dados[Endereco];
		end
		
		if(reset==1'b1)
		begin
			for(i=0;i<128;i=i+1)
			begin
				mem_dados[i] <= 8'b0;  
			end
		end
		
	end 
		
endmodule

module test_memdados;
	reg [7:0] ender, dadoescr;
	reg escmem, lermem, clk, reset;
	
	wire [7:0] dadolido;
	
	always begin
		clk = 0;
		#1 clk = 1;
		#1 clk = 0;
	end
	
	initial begin
		ender = 50;
		dadoescr = 100;
		escmem = 0;
		lermem = 0;
		reset = 0;
		#2 escmem = 1;
		#2 escmem = 0;
		#2 lermem = 1;
		#2 lermem = 0;
		#2 reset = 1;
		#2 lermem = 1;
	end
	
	initial begin
 		$monitor("Time=%0d ender=%b dadoescr=%b escmem=%b lermem=%b clk=%b reset=%b dadolido=%b",$time, ender, dadoescr, escmem, lermem, clk, reset, dadolido);
 	end
	
	memoria_dados mod1(ender, dadoescr, escmem, lermem, dadolido, clk, reset);
	
endmodule

