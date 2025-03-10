# TE2002B (Grupo 101)
Elizabeth Jauregui Zarate
A01253381
-
Password

Descripción:
*    El proyecto adjunto utiliza una maquina de estados para verificar la introducción de un número binario de 10 bits (contraseña).
*    La programación del hardware fue realizado utilizando Quartus y Verilog y probado en una FPGA.
    
Requisitos:
*	Quartus Prime (Intel FPGA)
*	FPGA compatible (DE10-Lite, MAX10 10M50DAF484C7G)
*	Cable de programación JTAG

Estructura del Proyecto:
*	Password.v -> Máquina de estados que modela el cambio de estado y de salida dependiendo de la introducción de un número binario de 10 bits.
*	oneshot.v -> Módulo que genera un pulso único cuando detecta un flanco de subida en button_a.
*	top_password_oneshot.v -> Módulo top donde se instancian todos los módulos secundarios, utilizando señales auxiliares para unir las entradas y salidas.
*	clk_divider.v -> Módulo que crea una señal con menor frecuencia a partir de una señal de reloj.
*	top_password_oneshot_wr.sv -> Módulo wrapper donde se asignan los pines de entrada y salida.
*	password_tb.v -> Módulo test bench, donde se simulan mediante pulsaciones los valores de salida.

Evidencia Link:
*   https://drive.google.com/file/d/11vQPnaNHqT0V9Ux_MTHzCVuPNMV8MyMj/view?usp=sharing

RTL Viewer:
![image](https://github.com/user-attachments/assets/c7b2b66c-689a-48a4-8d4d-d3590e79c63f)

RTL Simulation:
![Captura de pantalla 2025-03-10 135728](https://github.com/user-attachments/assets/2d57c88b-4b58-4393-be48-540606d72c49)


