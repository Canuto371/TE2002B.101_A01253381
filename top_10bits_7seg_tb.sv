module top_10bits_7seg_tb#(parameter N=10, ITERACIONES=10)();
	reg  [N-1:0] BCD_in_sw;
	wire [0:6] Display_unidad;
	wire [0:6] Display_decena;
	wire [0:6] Display_centena;
	wire [0:6] Display_millar;

	top_10bits_7seg DUT (.A(BCD_in_sw),.D1(Display_unidad),.D2(Display_decena),.D3(Display_centena),.D4(Display_millar));
	
	task set_input();
		BCD_in_sw=$urandom_range(2**N-1);
		$display("Valor a probar= %d",BCD_in_sw);
		#10;
	endtask
	
	integer i;
	
	initial begin
		for(i=0;i<ITERACIONES;i=i+1)
		begin
			set_input();
		end
	end
endmodule