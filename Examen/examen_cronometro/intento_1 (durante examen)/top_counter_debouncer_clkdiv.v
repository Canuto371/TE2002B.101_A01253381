module top_counter_debouncer_clkdiv(
    input clk,
    input rst,
	 output [6:0] D1, D2, D3, D4    
);

// Señales Auxiliares
wire clk_div;             
wire rst_debouncer;       
wire [22:0] count_wire;   

//50_000_000 es 1seg
//50_000_000 / 1_000
	 
counter U2 (.clk(clk_div),.rst(rst),.enable(1'b1),.count(count_wire));
	 
// Instancia del contador (con la salida de clk_div y rst_debouncer)
//counter CONTADOR_CLK_DIV (.clk(clk_div),.rst(rst),.enable(rst_debouncer),.count(count_wire));

// Instancia del divisor de reloj
clk_divider CONTADOR_DIVIDIDO (.clk(clk),.rst(rst),.clk_div(clk_div));

// Instancia del decodificador de 7 segmentos
top_10bits_7seg DECODIFICADOR (.A(count_wire),.D1(D1),.D2(D2),.D3(D3),.D4(D4));

endmodule