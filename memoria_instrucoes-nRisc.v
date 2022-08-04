/*
	CEFET-MG
	Disciplina de Laboratório de Arquitetura e Organização de Computadores
	Data: 10/08/2021
	Aluno: Fernando Veizaga
	Matricula: 20203001902
*/

module mem_instr (PC, instrucao, clock);
	input [7:0] PC;
	input clock;
	
	output reg [7:0] instrucao;
	
	always @ (posedge clock)
	begin
		if((PC > 8'b10011001) && (PC <= 8'b11111111))
		begin
			instrucao <= 8'b00000000;
		end
		
		else begin
			case(PC)
				8'b10000000: begin instrucao <= 8'b10101010; end
				8'b10000001: begin instrucao <= 8'b10101010; end
				8'b10000010: begin instrucao <= 8'b01100001; end
				8'b10000011: begin instrucao <= 8'b10101001; end
				8'b10000100: begin instrucao <= 8'b01100000; end
				8'b10000101: begin instrucao <= 8'b10101010; end
				8'b10000110: begin instrucao <= 8'b01100010; end
				8'b10000111: begin instrucao <= 8'b10101111; end
				8'b10001000: begin instrucao <= 8'b01010000; end
				8'b10001001: begin instrucao <= 8'b00110110; end
				8'b10001010: begin instrucao <= 8'b00000101; end
				8'b10001011: begin instrucao <= 8'b10110001; end
				8'b10001100: begin instrucao <= 8'b00110011; end
				8'b10001101: begin instrucao <= 8'b00000001; end
				8'b10001110: begin instrucao <= 8'b11011000; end
				8'b10001111: begin instrucao <= 8'b11000111; end
				8'b10010000: begin instrucao <= 8'b10110101; end
				8'b10010001: begin instrucao <= 8'b00110110; end
				8'b10010010: begin instrucao <= 8'b00000110; end
				8'b10010011: begin instrucao <= 8'b10110001; end
				8'b10010100: begin instrucao <= 8'b00110011; end
				8'b10010101: begin instrucao <= 8'b00000001; end
				8'b10010110: begin instrucao <= 8'b11011000; end
				8'b10010111: begin instrucao <= 8'b11000111; end
				8'b10011000: begin instrucao <= 8'b11100000; end
				8'b10011001: begin instrucao <= 8'b11001000; end
			endcase
			
		end
	end
endmodule

module test_meminstr;
	reg [7:0] pc;
	reg clk;
	
	wire [7:0] instr;
	
	always begin
		clk = 0;
		#1 clk = 1;
		#1 clk = 0;
	end
	
	integer i;
	initial begin
		pc = 128;
		for(i = 1; i < 128; i = i+1)
		begin
			#2 pc = pc + 1;
		end
	end
	
	initial begin
 		$monitor("Time=%0d pc=%b clk=%b instr=%b",$time, pc, clk, instr);
 	end
	
	mem_instr mod1(pc, instr, clk);

endmodule

