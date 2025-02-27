module top_counter_debouncer_clkdiv_wr(
    input MAX10_CLK1_50,
    input [9:0] SW,
    output [6:0] HEX0    
);

parameter a=1;

top_counter_debouncer_clkdiv MODULO_ASIGNACION (.clk(MAX10_CLK1_50),.rst(SW[0]),.debouncer_in(a),.load(SW[1]),.up_down(SW[2]),.data_in(SW[6:3]),.display_1(HEX0));

endmodule