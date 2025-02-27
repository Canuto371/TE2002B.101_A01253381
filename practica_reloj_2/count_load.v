module count_load(
	input rst, //sw0 primer switch
			up_down, //segundo switch
			load, //tercer switch
			clk, //reloj
	input [3:0] data_in, //número de 4 bits -- 4to, 5to, 6to y 7to switch
	output reg [3:0] count //contador de 4 bits 
);

//
always @(posedge clk or posedge rst)
	begin
	if (rst) //si rst está en 0, se pone el contador en 0
		count = 4'b0000;
	else if (load) //si load está en 1, se asigna el valor de data_in en count
		count <= data_in;
	else if (up_down) //si up_down está en 1, se incrementa el contador por 1 y si está en 0 se decrementa por 1
		count <= count + 1;
	else if (up_down == 0)
		count <= count - 1;
	end
endmodule