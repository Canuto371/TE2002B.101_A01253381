//debouncer
module debouncer2 (
    input pb_1, clk, rst,
    output reg pb_out
);

    wire Q0, Q1, Q2, Q2_bar, slow_clk;
    
    // Reducir el reloj
    clk_divider #(.FREQ(20)) u1 (.clk(clk), .rst(rst), .clk_div(slow_clk));
    
    // Flip-flops
    d_ff d0 (.slow_clk(slow_clk), .D(pb_1), .Q(Q0)); // Entrada pb_1 y salida Q0
    d_ff d1 (.slow_clk(slow_clk), .D(Q0), .Q(Q1)); // Entrada Q0 y salida Q1
    d_ff d2 (.slow_clk(slow_clk), .D(Q1), .Q(Q2)); // Entrada Q1 y salida Q2
    
    assign Q2_bar = ~Q2;

    // Siempre actualizar pb_out, con control de reset
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            pb_out <= 0;  // Cuando el reset está activo, pb_out es 0
        end else begin
            pb_out <= Q1 & Q2_bar;  // De lo contrario, lógica normal
        end
    end

endmodule
