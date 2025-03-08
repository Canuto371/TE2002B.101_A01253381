# TE2002B (Grupo 101)
Elizabeth Jauregui Zarate
A01253381
-
Decodificador Binario a Decimal

Descripción:
*    El proyecto adjunto despliega en formato decimal la frecuencia de una señal (Min 10 Hz, Max 100 KHz), en 6 displays de 7 segmentos.
*    La programación del hardware fue realizado utilizando Quartus y Verilog y probado en una FPGA.
    
Requisitos:
*	Quartus Prime (Intel FPGA)
*	FPGA compatible (DE10-Lite, MAX10 10M50DAF484C7G)
*	Cable de programación JTAG
*	Generador de señal

Estructura del Proyecto:
*	decoder_7_seg.v -> Módulo decodificador que convierte los números decimales del 0 al 9 en displays de 7 segmentos.
*	top_10bits_7seg.v -> Módulo que instancia los 4 displays separandolos en unidades, decenas, centenas y millares.
*	frecuenciometro.v -> Módulo que calcula la frecuencia y sirve como "top module", donde se instancian pulse_counter.v y top_10_bits_7seg.v
*	pulse_counter.v -> Módulo contador que cuenta los pulsos de subida en un intervalo de tiempo.

Evidencia Link:
*   https://drive.google.com/file/d/17Jvi5Ym9lz74kvW_cCaQKgDs5OtFc9TU/view?usp=sharing

Diagrama módulos:
![image](https://github.com/user-attachments/assets/01936b1e-55d1-427e-a305-2e85989138ee)

