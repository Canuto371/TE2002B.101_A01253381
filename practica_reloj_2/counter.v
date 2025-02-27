module counter (
    input clk, rst, enable,
    output reg [3:0] count = 4'b0000 // Contador de 4 bits (0 a 9)
);

always @(posedge clk or posedge rst) 
	begin
		 if (rst)
			  count <= 4'b0000;
		 else if (enable) 
			 count <= count + 1;
	end
endmodule