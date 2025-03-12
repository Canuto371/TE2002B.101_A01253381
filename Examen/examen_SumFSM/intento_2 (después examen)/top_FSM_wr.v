module top_FSM_wr (
	input MAX10_CLK1_50,
	input [4:0] SW,
	//output [9:0] LEDR,
	output [0:6] HEX0,HEX1
);
	
FSM u1 (
	.clk(MAX10_CLK1_50), .rst(SW[4]), 
	.switches(SW[3:0]),
	//.led_out(LEDR[6:0]),
	.display_u(HEX0),
	.display_d(HEX1)
);

endmodule