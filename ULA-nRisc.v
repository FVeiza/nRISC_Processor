/*
	CEFET-MG
	Disciplina de Laboratório de Arquitetura e Organização de Computadores I
	Data: 14/08/2021
	Aluno: Fernando Veizaga
	Matricula: 20203001902
*/

module ula (Fonte1, Fonte2, ULAOp, Resultado, Zero);
	input [7:0] Fonte1, Fonte2;
	input [1:0] ULAOp;
	
	output reg [7:0] Resultado;
	output Zero;

	always @(*) begin
		case (ULAOp)
			2'b00: Resultado = Fonte1 + Fonte2;
			2'b01: Resultado = Fonte1 - Fonte2;
			2'b10: begin
						if (Fonte1 < Fonte2)
							Resultado = 8'd1;
                  else
							Resultado = 8'd0;
                end
			endcase
	end
	
	assign Zero = (Resultado == 8'd0) ? 1'b1: 1'b0;

endmodule

module test_ULA;
	reg [7:0] fnt1, fnt2;
	reg [1:0] ulaop;
	reg clk;
	
	wire [7:0] res;
	wire zero;
	
	always begin
		clk = 0;
		#1 clk = 1;
		#1 clk = 0;
	end
	
	initial begin
		fnt1 = 2;
		fnt2 = 4;
		ulaop = 2'b00;
		#2 ulaop = 2'b01;
		#2 ulaop = 2'b10;
		#2 fnt1 = 3;
		fnt2 = 5;
		ulaop = 2'b00;
		#2 ulaop = 2'b01;
		#2 ulaop = 2'b10;
		#2 fnt1 = 6;
		fnt2 = 6;
		ulaop = 2'b01;
	end
	
	initial begin
		$monitor("Time=%0d Fonte1=%b Fonte2=%b ULAOp=%b Resultado=%b Zero=%b Clock=%b", $time, fnt1, fnt2, ulaop, res, zero, clk);
	end
	
	ula mod1(fnt1, fnt2, ulaop, res, zero);
	
endmodule
