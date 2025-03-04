module pwm_tb();

reg pb_inc = 0;
reg pb_dec = 0;
reg clk = 0;
reg rst = 1;
wire pwm_out;

pwm DUT(.pb_inc(pb_inc), .pb_dec(pb_dec), .clk(clk), .rst(rst), .pwm_out(pwm_out));

always begin
	#10 clk = ~clk;
end

initial begin
    $monitor("Time = %0t | pwm_out = %b | DC = %d | pb_inc = %b | pb_dec = %b", 
             $time, pwm_out, DUT.DC, pb_inc, pb_dec);

    // Inicialización
    rst = 1;
    #20 rst = 0;
    #20 rst = 1;

    // Simulación de incremento y decremento
    #20 pb_inc = 1; #20 pb_inc = 0;
    #20 pb_inc = 1; #20 pb_inc = 0;
    #50 pb_dec = 1; #20 pb_dec = 0;
    #20 pb_dec = 1; #20 pb_dec = 0;
    #100 pb_inc = 1; #20 pb_inc = 0;
    
    #200 $stop;
end

endmodule
