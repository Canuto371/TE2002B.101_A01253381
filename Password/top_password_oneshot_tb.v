`timescale 1ns / 1ps

module top_password_oneshot_tb();
    reg clk, rst;
    reg [9:0] switches;
    wire [9:0] led_out;
    wire [6:0] HEX0, HEX1, HEX2, HEX3, HEX4;

    
    top_password_oneshot DUT (
        .clk(clk),
        .rst(rst),
        .switches(switches),
        .led_out(led_out),
        .HEX0(HEX0),
        .HEX1(HEX1),
        .HEX2(HEX2),
        .HEX3(HEX3),
        .HEX4(HEX4)
    );

    // Generar el reloj
    always #10 clk = ~clk;

    // Simulación
    initial begin
        // Inicialización
        clk = 0;
        rst = 1;
        switches = 10'b0000000000;

        // Esperar un poco y quitar reset
        #10 rst = 0;

        // Simular entrada de contraseña correcta: 3 → 7 → 1
        #20 switches = 10'b0000001000; // switches[3] = 1
        
        #20 switches = 10'b0001000000; // switches[7] = 1

        #20 switches = 10'b0000000010; // switches[1] = 1

        // Esperar para ver resultado en display
        #200;

        $stop;
    end
endmodule
