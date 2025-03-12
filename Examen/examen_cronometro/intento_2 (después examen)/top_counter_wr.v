module top_counter_wr (
	input MAX10_CLK1_50,
	input [1:0] KEY,
	input [9:0] SW,
	output [0:6] HEX3,
	output [0:6] HEX0,HEX1,HEX2,HEX4,HEX5
);

	top_counter MODULO_ASIGNACION (
		.clk(MAX10_CLK1_50),
		.rst(KEY[0]),
		.enable(SW[0]),
		.D1(HEX0),
		.D2(HEX1),
		.D3(HEX2),
		.D4(HEX3),
		.D5(HEX4),
		.D6(HEX5)
	);

endmodule