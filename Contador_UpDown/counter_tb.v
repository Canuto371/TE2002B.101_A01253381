module counter_tb();
	reg clk_reg, rst_reg, enable_reg;
	wire [2:0] count_wire;

	counter DUT (.clk(clk_reg),.rst(rst_reg),.enable(enable_reg),.count(count_wire));
	
	always begin
		#5 clk_reg=~clk_reg; //Cambio de estado cada 5 tiempos
	end
	
	initial begin 
	//Inicializar señales en 0
		clk_reg=0;
		enable_reg=0;
		rst_reg=0;
		
		#5 rst_reg=1;
		#10 rst_reg=0;
		#10 enable_reg=1;
		#20 enable_reg=0;
		//$stop;
		//$finish;
	end
endmodule