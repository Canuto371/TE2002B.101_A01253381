module top_counter_debouncer_clkdiv_wr(
    input MAX10_CLK1_50,
    input [9:0] SW,
    output [0:6] HEX0,
	 output [0:6] HEX1,
	 output [0:6] HEX2,
	 output [0:6] HEX3
);


top_counter_debouncer_clkdiv MODULO_ASIGNACION (.clk(MAX10_CLK1_50),.rst(SW[0]),.D1(HEX0), .D2(HEX1), .D3(HEX2), .D4(HEX3));

endmodule