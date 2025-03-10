`timescale 1ns/1ps

module password_tb();

	reg clk=1;
	reg rst=1;
	reg [9:0] switches=0;
	wire [6:0] HEX0,HEX1,HEX2,HEX3,HEX4;
	wire led_out;

	top_password_oneshot DUT (
		.clk(clk),
		.rst(rst),
		.switches(switches),
		.HEX0(HEX0),
		.HEX1(HEX1),
		.HEX2(HEX2),
		.HEX3(HEX3),
		.HEX4(HEX4),
		.led_out(led_out)
	);
	
	always #10 clk=~clk;
	
	initial
	begin
		rst=0;
		#10;
		rst=1;
		#10;
		rst=0;
		#10;
		rst=1;
		
		#30;
		switches=10'b0000001000;
		#30;	switches=0;
		#30;
		switches=10'b0010000000;
		#30;	switches=0;
		#30;
		switches=10'b0000000010;
		#30;	switches=0;
		#30;
		switches=10'b0000100000;
		#30;	switches=0;
		#30;
		$stop;
	end
	
endmodule