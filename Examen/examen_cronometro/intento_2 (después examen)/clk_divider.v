module clk_divider(
    input clk,
    input rst,
    output reg clk_div = 0
);

//Frecuencia del reloj 
localparam clk_frq = 50_000_000; 
//Conteo deseado con ayuda de parametro
localparam count_max = clk_frq/(2*1000); 

reg [31:0] count;
//reg [ceillog2(count_max):0] count;

//Primer always: Manejo del contador
always @(posedge clk or negedge rst) 
	begin
		 if (!rst) 
			  count <= 0;
		 else if (count == count_max - 1)
			  count <= 0;
		 else 
			  count <= count + 1;
	end

//Segundo always: Manejo de clk_div
always @(posedge clk or negedge rst) 
	begin
		 if (!rst)
			  clk_div <= 0;
		 else if (count == count_max - 1)
			  clk_div <= ~clk_div;
		 else
			  clk_div <= clk_div;
	end
endmodule