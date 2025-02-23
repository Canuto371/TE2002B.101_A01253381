# TE2002B (Grupo 101)
Elizabeth Jauregui Zarate
A01253381
-
Decodificador Binario a Decimal

Descripción:
*    El proyecto adjunto convierte un número binario de 10 bits en un número decimal de 4 displays de 7 segmentos (de 0 a 1023).
*    La programación del hardware fue realizado utilizando Quartus y Verilog y probado en una FPGA.
    
Requisitos:
*	Quartus Prime (Intel FPGA)
*	FPGA compatible (DE10-Lite, MAX10 10M50DAF484C7G)
*	Cable de programación JTAG

Estructura del Proyecto:
*	decoder_7_seg.v -> Módulo decodificador que convierte los números decimales del 0 al 9 en displays de 7 segmentos.
*	top_10bits_7seg.v -> Módulo que instancia los 4 displays separandolos en unidades, decenas, centenas y millares.
*	top_10bits_7seg_tb.vs -> Módulo de test bench para probar en pulsaciones el funcionamiento del decodificador BCD.

Evidencia Link:
*   https://drive.google.com/file/d/11vQPnaNHqT0V9Ux_MTHzCVuPNMV8MyMj/view?usp=sharing
