module top_FSM_wr (
	input MAX10_CLK1_50,
	input [4:0] SW,
	output [9:0] LEDR,
	output [0:6] HEX0,HEX1
);
	
top_FSM (
	.clk(MAX10_CLK1_50), .rst(SW[4]), 
	.switches(SW[3:0]),
	.led_out(LEDR[6:0]),
	.D1(HEX0),
	.D2(HEX1)
);

endmodule