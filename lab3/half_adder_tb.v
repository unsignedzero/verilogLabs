// Lab 3
// Created by David Tran
// Last Modified 01-30-2014

// extras
`timescale 1 ms /1 us
`include "half_adder.v"

// Testbench Module

module half_adder_tb (A, B);

	output A, B;
	reg A, B;

	wire S, C;

	reg t_A [5000:0];
	reg t_B [5000:0];
	reg t_clock;
	reg [31:0] vectornum; //Values from 0 -> 2^31

	half_adder I1 (A, B, S, C);

	initial #1000 $finish;

	initial
	begin
		t_clock=0;
		forever #5 t_clock=~t_clock;
	end

	initial
	begin
		$readmemb("./bit_str_a_0.txt",t_A);
		$readmemb("./bit_str_a_1.txt",t_B);
		vectornum=0; // Set test vector 0
	end

	always @(negedge t_clock)
	begin
		A<=t_A[vectornum];
		B<=t_B[vectornum];
		vectornum<=vectornum+1;
	end

	initial
	begin
		$monitor("time=%0d", $time,, "A=%b B=%b S=%b C=%b", A, B, S, C);
	end

endmodule
