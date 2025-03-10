module oneshot(
    input clk, button_a,
    output reg salida_xor_and
);

reg delay_b;

always @(posedge clk) 
    begin
        delay_b <= button_a;
        if ((button_a != delay_b) && (button_a == 1))
            salida_xor_and <= 1;
        else
            salida_xor_and <= 0;
    end
endmodule