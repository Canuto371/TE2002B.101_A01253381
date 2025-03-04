module pwm(
	input pb_inc, pb_dec, clk, rst,
	output reg pwm_out = 1'b0
);

// Señales auxiliares
wire neg_pb_inc = ~pb_inc;
wire neg_pb_dec = ~pb_dec;
wire slow_clk;
wire debounced_pb_inc;
wire debounced_pb_dec;

reg [31:0] DC = 32'd25_000;
reg [31:0] count = 0;

// Parámetros para el duty cycle
parameter base_freq = 'd50_000_000;
parameter target_freq = 'd50;
parameter counts = base_freq / target_freq;

// Reducir reloj (Frecuencia mayor en simulación)
`ifdef SIMULATION
clk_divider #(.FREQ(100_000)) u1 (.clk(clk), .rst(rst), .clk_div(slow_clk));
`else
clk_divider #(.FREQ(20)) u1 (.clk(clk), .rst(rst), .clk_div(slow_clk));
`endif

// Instancias del debouncer
`ifdef SIMULATION
assign debounced_pb_inc = pb_inc; // En simulación, los botones se leen directamente
assign debounced_pb_dec = pb_dec;
`else
    debouncer2 d0 (.pb_1(neg_pb_inc), .clk(clk), .rst(rst), .pb_out(debounced_pb_inc));
    debouncer2 d1 (.pb_1(neg_pb_dec), .clk(clk), .rst(rst), .pb_out(debounced_pb_dec));
`endif

// Modificación de DC en función de los botones
always @(posedge slow_clk or posedge rst) begin
	if (rst)
		DC <= 32'd25_000;
	else begin
		if (debounced_pb_inc && DC < 32'd150_000)
			DC <= DC + 32'd2_500;
		else if (debounced_pb_dec && DC > 32'd5_000)
			DC <= DC - 32'd2_500;
	end
end

// Generación de la señal PWM
always @(posedge clk) begin
	if (count <= counts - 1)
		count <= count + 1;
	else
		count <= 32'd0;

	if (count > DC)
		pwm_out <= 1'b0;
	else
		pwm_out <= 1'b1;
end

endmodule

