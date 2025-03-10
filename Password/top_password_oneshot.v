module top_password_oneshot (
    input clk, rst,
    input [9:0] switches,
    output [9:0] led_out,
    output [6:0] HEX0,
    output [6:0] HEX1,
    output [6:0] HEX2,
    output [6:0] HEX3,
    output [6:0] HEX4
);

wire clk_div;
wire [9:0] sw_debouncer;

//clk_divider #(.FREQ(10)) CLOCK_DIVIDER (.clk(clk), .rst(rst), .clk_div(clk_div));

genvar i;
generate
    for (i = 0; i < 10; i = i + 1) begin: one_shot_instanciado
        oneshot U (
            .clk(clk/*clk_div*/),
            .button_a(switches[i]),
            .salida_xor_and(sw_debouncer[i])
        );
    end
endgenerate

Password A1 (
    .clk(clk/*clk_div*/),
    .rst(rst),
    .switches(sw_debouncer),
    .led_out(led_out),
    .HEX0(HEX0),
    .HEX1(HEX1),
    .HEX2(HEX2),
    .HEX3(HEX3),
    .HEX4(HEX4)
);


endmodule