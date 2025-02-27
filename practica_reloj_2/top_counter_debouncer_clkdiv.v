module top_counter_debouncer_clkdiv(
    input clk,
    input rst,    
	 input up_down,
	 input load,
	 input [3:0] data_in,
    output [6:0] display_1    
);

// Señales Auxiliares
wire clk_div;             
wire rst_debouncer;       
wire [3:0] count_wire; 
parameter debouncer_in=1;  
    
// Instancia del contador (con la salida de clk_div y rst_debouncer)
//counter CONTADOR_CLK_DIV (.clk(clk_div),.rst(rst),.enable(rst_debouncer),.count(count_wire));

// Instancia del divisor de reloj
clk_divider CONTADOR_DIVIDIDO (.clk(clk),.rst(rst),.clk_div(clk_div));

// Instancia del debouncer
debouncer DEBOUNCER (.clk(clk),.rst_a_p(rst),.debouncer_in(debouncer_in),.debouncer_out(rst_debouncer));

// Instancia del decodificador de 7 segmentos
decoder_7_seg DECODIFICADOR (.decoder_in(count_wire),.decoder_out(display_1));

//Instancia count_load
count_load CONTADOR_LOAD (.clk(clk_div),.rst(rst),.up_down(up_down),.load(load),.data_in(data_in),.count(count_wire));

endmodule