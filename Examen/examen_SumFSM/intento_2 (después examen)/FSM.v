module FSM(
    input clk, rst, // SW[4]
    input [3:0] switches, // SW[3:0]
    output [0:6] display_u,
    output [0:6] display_d
);

// Definición de estados
parameter A = 0, B = 1, C = 2, D = 3;

reg [1:0] current_state;
reg [1:0] next_state;

reg [6:0] contador_suma_interna;
reg [9:0] FSM_out;
reg [3:0] i;

always @(posedge clk or posedge rst) begin
    if (rst) 
        current_state <= A;
    else 
        current_state <= next_state;
end

always @(posedge clk or posedge rst) begin
    if (rst) begin
        contador_suma_interna <= 0;
        i <= 0;
        FSM_out  <= 0;
        next_state <= A;
    end else begin
        case (current_state)
            A: begin
                contador_suma_interna <= 0;
                i <= switches; 
                FSM_out  <= 0;
                if (switches == 0)
                    next_state <= A;
                else
                    next_state <= B;
            end
            B: begin
                if (i > 0) begin
                    contador_suma_interna <= contador_suma_interna + i;
                    i <= i - 1;
                    next_state <= B;
                end else begin
                    next_state <= C;
                end
            end
            C: begin
                FSM_out <= contador_suma_interna;
                next_state <= D;
            end
            D: begin
                // Se queda mostrando el resultado hasta un reset
                next_state <= D;
            end
            default: next_state <= A;
        endcase
    end
end

top_10bits_7seg display_module (
    .A(FSM_out),
    .D1(display_u),
    .D2(display_d)
);

endmodule
