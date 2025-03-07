module pwm (
	input pb_inc,pb_dec,clk,rst,
	output reg pwm_out
);

wire neg_pb_inc=~pb_inc;
wire neg_pb_dec=~pb_dec;
wire slow_clk;
wire debounced_pb_inc,debounced_pb_dec;

reg [31:0] DC=25_000;
reg [31:0] counter;

parameter base_freq=50_000_000;
parameter target_freq=50;
parameter countsT=base_freq/target_freq; 


///////////////////////////////Instancias
clkdiv #(.FREQ(20)) u1(
	.clk(clk),
	.rst(rst),
	.clk_div(slow_clk)
);

debouncer d0(
	.pb1(neg_pb_inc),
	.clk(clk),
	.rst(rst),
	.pbout(debounced_pb_inc)
);

debouncer d1(
	.pb1(neg_pb_dec),
	.clk(clk),
	.rst(rst),
	.pbout(debounced_pb_dec)
);

///////////////////////////////Duty Cycle
always @(posedge slow_clk or posedge rst)
	begin
	if (rst)
		DC<=25_000;
	else
		begin
			if (debounced_pb_inc && DC<150_000) 
				DC<=DC+5_000;
			else if (debounced_pb_dec && DC>5_000)
				DC<=DC-5_000;
		end
end

///////////////////////////////Señales PWM
always @(posedge clk)
	begin
		if (counter<countsT-1)
			counter<=counter+1;
		else
			counter<=0;
		if (counter>DC)
			pwm_out<=0;
		else
			pwm_out<=1;
	end
	
endmodule