module frecuenciometro(
    input clk,        
    input rst,        
    input signal_in,  
    output [9:0] led_out, 
    output [6:0] display1,  
    output [6:0] display2, 
    output [6:0] display3,  
    output [6:0] display4,  
    output [6:0] display5, 
    output [6:0] display6   
);
    wire [22:0] pulse_count;
    reg [22:0] pulse_freq;

    // Sincronización de la señal de entrada
    reg signal_in_sync;
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            signal_in_sync <= 0;
        end else begin
            signal_in_sync <= signal_in;
        end
    end

    // Cálculo de la frecuencia
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            pulse_freq <= 0;
        end else begin
            pulse_freq <= pulse_count; 
        end
    end

    
    pulse_counter U2 (.clk(clk),.rst(rst),.signal_in(signal_in_sync),.count_value(pulse_count));
    top_10bits_7seg U3 (.A(pulse_freq),.D1(display1),.D2(display2),.D3(display3),.D4(display4),.D5(display5),.D6(display6));

    assign led_out = pulse_freq[9:0];

endmodule