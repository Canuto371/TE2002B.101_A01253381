module top_password_oneshot_wr (
	input MAX10_CLK1_50, KEY[0],
	input [9:0] SW,
	output [9:0] LEDR,
	output [6:0] HEX0, 
	output [6:0] HEX1, 
	output [6:0] HEX2, 
	output [6:0] HEX3, 
	output [6:0] HEX4
);

top_password_oneshot MODULO_ASIGNACION (.clk(MAX10_CLK1_50)
													,.rst(KEY[0])
													,.switches(SW[9:0])
													,.led_out(LEDR[9:0])
													,.HEX0(HEX0[6:0])
													,.HEX1(HEX1[6:0])
													,.HEX2(HEX2[6:0])
													,.HEX3(HEX3[6:0])
													,.HEX4(HEX4[6:0]));

endmodule