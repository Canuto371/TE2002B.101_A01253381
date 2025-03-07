module pwm_tb();
	reg pb_inc,pb_dec,clk,rst;
	wire pwm_out;
	
pwm DUT (.pb_inc(pb_inc),.pb_dec(pb_dec),.clk(clk),.rst(rst),.pwm_out(pwm_out));

always begin
		#10 clk=~clk;
	end
	
initial begin
		rst=0;
		clk=0;
		pb_inc=0;
		pb_dec=0;
		
		#20 pb_inc = 1;
		#15 pb_inc = 0;
		#50;
		#15 pb_inc = 1;
		#15 pb_inc = 0;
		
		#10 pb_inc = 1;
		#15 pb_inc = 0;
		
		#20 pb_dec = 1;
		#15 pb_dec = 0;
	end

endmodule

