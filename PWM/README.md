# TE2002B (Grupo 101)
Elizabeth Jauregui Zarate
A01253381
-
PWM

Descripción:
*    El proyecto adjunto convierte la introducción de señal de 2 botones (uno de incremento y otro de decremento) que modifican el valor del Duty Cycle para cambiar el ángulo de posición de un servo motor.
*    La programación del hardware fue realizado utilizando Quartus y Verilog y probado en una FPGA.
    
Requisitos:
*	Quartus Prime (Intel FPGA)
*	FPGA compatible (DE10-Lite, MAX10 10M50DAF484C7G)
*	Cable de programación JTAG

Estructura del Proyecto:
*	d_ff.v -> Módulo de flip flops auxiliares para el manejo del debouncer.
*	debouncer.v -> Módulo que mantiene estable la señal de entrada para evitar transiciones no deseadas, debido a que la mecánica de un interruptor no cambia de 0 a 1 de forma instantánea.
*	clkdiv.v -> Módulo que crea una señal con menor frecuencia a partir de una señal de reloj.
*	pwm.v -> Módulo que describe el cambio de valor del Duty Cycle dependiendo de la introducción de señales de botón
*	pwm_tb.v -> Módulo test bench, donde se simulan mediante pulsaciones los valores de salida.
*	pwm_wr.v -> Módulo wrapper de asignación de pines de entrada y salida.

Evidencia Link:
*   https://drive.google.com/file/d/1QhCXykJFKaUMfL4bdPcZDfRx7InFnv1h/view?usp=sharing

RTL Viewer:
![Captura de pantalla 2025-03-04 140238](https://github.com/user-attachments/assets/0706f6c8-b90c-4491-b967-de948386d757)


RTL Simulation:
![Captura de pantalla 2025-03-05 075458](https://github.com/user-attachments/assets/13808d9d-23f1-402a-8fcd-dc4a0c9532c3)

