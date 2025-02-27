module top_counter_debouncer_clkdiv_tb();
	reg clk, rst, up_down, load;
	reg [3:0] data_in;
	wire [6:0] display_1;
	

top_counter_debouncer_clkdiv DUT (.clk(clk),.rst(rst),.up_down(up_down),.load(load),.data_in(data_in),.display_1(display_1));


always begin
	#5 clk = ~clk;
end

initial 
	begin
		clk = 0;
		rst = 1;
		up_down = 0; 
		
		#20 rst = 0;
		#10 up_down = 1;
		#50 up_down = 0;
		#50 rst = 1;
		#10 rst = 0;
		#10 data_in = 4'b1001;
		#10 load = 1;
		#10 up_down = 1;
		
		#50 $stop;
	end
endmodule