# TE2002B (Grupo 101)
Elizabeth Jauregui Zarate
A01253381
-
Evidencia 1 : Reporte de Proyecto Final

Descripción:
*   El proyecto consta del desarrollo pleno de un brazo robótico controlado mediante un FPGA (Field Programmable Gate Array), específicamente una tarjeta DE10-Lite MAX10, que procesa datos de un acelerómetro para mover cuatro servomotores SG90, uno de ellos destinado al funcionamiento de una pinza y los otros tres destinados al movimiento del brazo en tres diferentes grados de movimiento (X, Y y Z). 
*    La programación del hardware fue realizado utilizando Quartus y Verilog y probado en una FPGA.
    
Requisitos:
*	Quartus Prime (Intel FPGA)
*	FPGA compatible (DE10-Lite, MAX10 10M50DAF484C7G)
*	Cable de programación JTAG
*	Cable de visualización VGA
*	Cuatro Servomotores SG90 
*   Protoboard (Placa de pruebas)
*   Jumpers (Cables de conexión)
*   Chasis de Brazo Robótico


Estructura del Proyecto:
*   accel.v -> Interactúa con el acelerómetro, procesa los datos de los ejes X, Y y Z, y los visualiza en una salida VGA mientras controla otros módulos como el brazo y la memoria ROM.
*   ROM.v -> Almacena valores predefinidos de datos de movimiento para el control de servomotores y los distribuye a través de direcciones específicas de la ROM.
*   VGA.v -> Genera la señal VGA para mostrar los datos del acelerómetro en una pantalla, sincronizando la visualización y representando caracteres y cifras.
*   brazo2.v -> Controla los servomotores generando señales PWM basadas en los datos del acelerómetro o la memoria ROM para regular el movimiento del brazo.
