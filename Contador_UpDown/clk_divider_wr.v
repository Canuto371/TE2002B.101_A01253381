module clk_divider_wr #(parameter FREQ = 1)(
    input MAX10_CLK1_50,
    input LEDR[9:0],
    output SW[9:0]
);

clk_divider_wr #(.FREQ(FREQ)) MODULO_ASIGNACION (.clk(MAX10_CLK1_50),.rst(SW[0]),.clk_div(LEDR[0])); 

endmodule