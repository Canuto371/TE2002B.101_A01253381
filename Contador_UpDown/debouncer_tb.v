module debouncer_tb();
	reg clk; 
	reg rst_a_p; 
	reg debouncer_in;
	wire debouncer_out;

debouncer DUT (.clk(clk),.rst_a_p(rst_a_p),.debouncer_in(debouncer_in),.debouncer_out(debouncer_out));

always begin
		#5 clk=~clk; //Cambio de estado cada 5 tiempos
	end
	
initial begin
	clk=0;
	rst_a_p = 1;
	debouncer_in = 0;
	#10 rst_a_p = 0;
	
	debouncer_in = 1; // Cambiar la entrada
	#10000;  // Esperar hasta que el contador llegue a 1000 ciclos
	debouncer_in = 0; // Cambiar la entrada
	#10000;  // Esperar más ciclos para ver cómo se mantiene la salida
	$display("Time=%0t, debouncer_in=%b, debouncer_out=%b, counter_out=%d", $time, debouncer_in, debouncer_out, DUT.counter_out);
	#10000; // Esperar más ciclos
	$stop;

end
endmodule