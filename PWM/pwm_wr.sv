module pwm_wr(
	input [1:0] KEY,
	input MAX10_CLK1_50,
	input [9:0] SW,
	output PIN_W6
);
	
pwm MODULO_ASIGNACION (.pb_inc(KEY[0]),.pb_dec(KEY[1]),.clk(MAX10_CLK1_50),.rst(SW[0]),.pwm_out(PIN_W6));	

endmodule