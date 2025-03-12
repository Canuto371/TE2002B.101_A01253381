module top_counter(
    input clk,
    input rst,
	 input enable,
	 output [6:0] D1, D2, D3, D4, D5, D6    
);

// Señales Auxiliares
wire clk_div;             
wire rst_debouncer;       
wire [9:0] count_m;
wire [6:0] count_s;

//50_000_000 es 1seg
//50_000_000 / 1_000
	 
counter U2 (.clk(clk_div),.rst(rst),.enable(enable),.mili_segundos(count_m),.segundos(count_s));
	 
// Instancia del divisor de reloj
clk_divider CONTADOR_DIVIDIDO (.clk(clk),.rst(rst),.clk_div(clk_div));

// Instancia del decodificador de 7 segmentos
top_10bits_7seg DECODIFICADOR_1 (.A(count_m),.D1(D1),.D2(D2),.D3(D3));

top_10bits_7seg DECODIFICADOR_2 (.A(count_s),.D1(D4),.D2(D5),.D3(D6));

endmodule