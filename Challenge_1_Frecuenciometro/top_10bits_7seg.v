module top_10bits_7seg (
    input [22:0] A, // Número binario de entrada
    output [6:0] D1, D2, D3, D4, D5, D6
);
    wire [3:0] unidades;
    wire [3:0] decenas;
    wire [3:0] centenas;
    wire [3:0] millar;
    wire [3:0] decena_mil;
    wire [3:0] centena_mil;

    // Separar las cifras para el display
    assign unidades = A % 10;         // Unidades
    assign decenas = (A / 10) % 10;   // Decenas
    assign centenas = (A / 100) % 10; // Centenas
    assign millar = (A / 1000) % 10;  // Millar
    assign decena_mil = (A / 10000) % 10; // Decena de millar
    assign centena_mil = A / 100000;  // Centena de millar

    // Instancias del decoder para cada display
    decoder_7_seg DISPLAY_1 (.decoder_in(unidades), .decoder_out(D1));
    decoder_7_seg DISPLAY_2 (.decoder_in(decenas), .decoder_out(D2));
    decoder_7_seg DISPLAY_3 (.decoder_in(centenas), .decoder_out(D3));
    decoder_7_seg DISPLAY_4 (.decoder_in(millar), .decoder_out(D4));
    decoder_7_seg DISPLAY_5 (.decoder_in(decena_mil), .decoder_out(D5));
    decoder_7_seg DISPLAY_6 (.decoder_in(centena_mil), .decoder_out(D6));

endmodule