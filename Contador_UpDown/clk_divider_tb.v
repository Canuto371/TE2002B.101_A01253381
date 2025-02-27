module clk_divider_tb();
	reg clk_reg, rst_reg; 
	wire clk_div_wire;

	clk_divider DUT (.clk(clk_reg),.rst(rst_reg),.clk_div(clk_div_wire));
	
	always begin
		#5 clk_reg=~clk_reg; //Cambio de estado cada 5 tiempos
	end

	initial begin
	//Inicializar señales en 0
		clk_reg=0;
		rst_reg=0;
		//clk_div_wire=0;
		
		#5 rst_reg=1;
		#10 rst_reg=0;
		
		//$stop;
		//$finish;
	end
endmodule