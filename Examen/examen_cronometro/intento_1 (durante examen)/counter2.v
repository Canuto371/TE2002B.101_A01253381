module counter2(
    input clk, rst,
    output reg [22:0] count_value
);
    reg [22:0] count;
    reg [25:0] timer; // Contador para medir 1 segundo (50 millones de ciclos para 50 MHz)
	 
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            count <= 0;
            count_value <= 0;
            timer <= 0;
        end else begin
            // Contar 1 segundo (50 millones de ciclos para 50 MHz)
            if (timer == 50_000_000_000) begin
                count_value <= count; // Almacenar el valor del contador
                count <= 0; 
                timer <= 0;
            end else begin
                timer <= timer + 1;
            end
        end
    end
endmodule