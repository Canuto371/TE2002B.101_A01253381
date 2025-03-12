module top_FSM (
	input clk, rst, 
	input [3:0] switches,
	output [9:0] led_out,
	output D1, D2
);

wire [6:0] FSM_out;

FSM instancia_1 (
    .clk(clk),
	 .rst(rst), //SW[4]
    .switches(switches), //SW[3:0]
    .led_out(led_out),
	 .FSM_out(FSM_out)
);

top_10bits_7seg #(.N(7)) instancia_2 (
	.A(FSM_out), 
	.D1(D1),
	.D2(D2)
);

endmodule