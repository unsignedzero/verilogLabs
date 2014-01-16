//Verilog HDL for "es210", "fig3p37", "verilog"
`timescale 1 ms /1 us
module fig3p37_tb (A,B,C);
output A,B,C;
reg A,B,C;

fig3p37 I1 (A,B,C,D,E);

initial
	begin
		$stop;
		A=1'b0; B=1'b0; C=1'b0;
		#100
		A=1'b1; B=1'b1; C=1'b1;
		#100
		$stop;
	end

//initial #200 $finish;

endmodule

module fig3p37 (A,B,C,D,E);
	output D,E;
	input A,B,C;
	wire w1;

	and G1(w1,A,B);
	not G2(E,C);
	xor G3(D,w1,E);

endmodule
