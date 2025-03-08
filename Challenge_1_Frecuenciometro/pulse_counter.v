module pulse_counter(
    input clk, rst, signal_in,
    output reg [22:0] count_value
);
    reg [22:0] count;
    reg signal_in_prev;
    reg [25:0] timer; // Contador para medir 1 segundo (50 millones de ciclos para 50 MHz)

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            count <= 0;
            count_value <= 0;
            signal_in_prev <= 0;
            timer <= 0;
        end else begin
            // Detectar flanco de subida de signal_in
            signal_in_prev <= signal_in;
            if (signal_in && !signal_in_prev) begin
                count <= count + 1;
            end

            // Contar 1 segundo (50 millones de ciclos para 50 MHz)
            if (timer == 50_000_000) begin
                count_value <= count; // Almacenar el valor del contador
                count <= 0; // Resetear el contador
                timer <= 0; // Resetear el temporizador
            end else begin
                timer <= timer + 1;
            end
        end
    end
endmodule