# TE2002B (Grupo 101)
Elizabeth Jauregui Zarate
A01253381
-
Contador Up/Down 

Descripción:
*    El proyecto adjunto cuenta de 0 a 15 en sistema hexadecimal. A su vez, el programa incrementa o decrementa el contador dependiendo de la señal que manda el switch SW[2] (Up:1 & Down:0). De igual manera, si el switch SW[1] está activado (load==1), se agrega un valor binario de 4 bits al contador mediante 4 switchs SW[6:3].
*    La programación del hardware fue realizado utilizando Quartus y Verilog y probado en una FPGA.
    
Requisitos:
*	Quartus Prime (Intel FPGA)
*	FPGA compatible (DE10-Lite, MAX10 10M50DAF484C7G)
*	Cable de programación JTAG

Estructura del Proyecto:
*	decoder_7_seg.v -> Módulo decodificador que convierte los números decimales del 0 al 9 en displays de 7 segmentos.
*	counter_debouncer.v -> Módulo que asegura que la señal solo cambie cuando ha sido estable durante un período de tiempo determinado.
*	debouncer.v -> Módulo que mantiene estable la señal de entrada para evitar transiciones no deseadas, debido a que la mecánica de un interruptor no cambia de 0 a 1 de forma instantánea.
*	clk_divider.v -> Módulo que crea una señal con menor frecuencia a partir de una señal de reloj.
*	count_load.v -> Módulo contador donde se define el funcioamiento Up/Down y Load en sincronización con el reloj.
*	top_counter_debouncer_clkdiv.v -> Módulo top donde se instancian todos los módulos individuales y se unen mediante wires.
*	top_counter_debouncer_clkdiv_tb.v -> Módulo test bench, donde se simulan mediante pulsaciones los valores de salida.
*	top_counter_debouncer_clkdiv_wr.sv -> Módulo wrapper donde se asignan los pines de entrada y salida.

Evidencia Link:
*   https://drive.google.com/file/d/1qWOK8eZvvgbCNVGdRA3EKVtdgx3k7Vnk/view?usp=sharing

RTL Viewer:
![Captura de pantalla 2025-02-26 083644](https://github.com/user-attachments/assets/64472f88-2aa9-401a-8c53-e08cb4b8bbbb)


RTL Simulation:
![Captura de pantalla 2025-02-26 085209](https://github.com/user-attachments/assets/8fc8ef3a-40ab-41af-9a61-9d74c52b7464)

