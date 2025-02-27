module debouncer(
    input clk, rst_a_p, debouncer_in,
    output reg debouncer_out = 0 
);

//Señales auxiliares
wire [15:0] counter_out;
wire counter_match;	

//Instancia del contador para el debouncer
counter_debouncer CONTADOR_PARA_RATE (.clk(clk),.rst_a_p(rst_a_p),.counter_out(counter_out),.counter_match(counter_match));

reg debouncer_state = 0; 

always @(posedge counter_match or posedge rst_a_p) 
	begin
		 if (rst_a_p) 
			 begin
				  debouncer_out <= 0; 
			 end 
		 else  
			 begin
				  debouncer_out <= debouncer_in;
			 end
	end
endmodule