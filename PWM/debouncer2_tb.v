module pwm_tb();

reg pb_1;
reg clk=0;
reg rst;
wire pb_out;

debouncer2 DUT(.pb_1(pb_1),.clk(clk),.rst(rst),.pb_out(pb_out));

always begin
	#5 clk=~clk;
end

initial 
	begin
		rst=0;
		#100;
		rst=1;
		#100;
		rst=0;
		#100;
		rst=1;
		#100;
		rst=0;
		#100;
		rst=1;
		#100;
		rst=0;
	end
endmodule