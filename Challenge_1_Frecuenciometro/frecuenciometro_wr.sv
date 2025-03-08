module frecuenciometro_wr (
	input MAX10_CLK1_50,
	input [1:0] KEY,
	input [35:0] GPIO,
	output [0:6] HEX0,HEX1,HEX2,HEX3,HEX4,HEX5
);

	frecuenciometro MODULO_ASIGNACION (
		.clk(MAX10_CLK1_50),
		.rst(KEY[0]),
		.signal_in(GPIO[27]),
		.display1(HEX0),
		.display2(HEX1),
		.display3(HEX2),
		.display4(HEX3),
		.display5(HEX4),
		.display6(HEX5)
	);

endmodule
