module count_load_tb();
	reg rst;
	reg up_down;
	reg load;
	reg clk;
	reg [3:0] data_in;
	wire [3:0] count;
	
count_load DUT (.rst(rst),.up_down(up_down),.load(load),.clk(clk),.data_in(data_in),.count(count));


endmodule