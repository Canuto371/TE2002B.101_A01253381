module counter (
    input clk, rst, enable,
    output reg [9:0] count = 0 
);

always @(posedge clk or posedge rst) 
	begin
		 if (rst)
			  count <= 0;
		 else if (enable && count < 999) 
			 count <= count + 1;
	end
endmodule