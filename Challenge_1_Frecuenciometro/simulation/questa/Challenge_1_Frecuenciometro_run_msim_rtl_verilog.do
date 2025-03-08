transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/quartus_practicas/Challenge_1_Frecuenciometro {C:/quartus_practicas/Challenge_1_Frecuenciometro/decoder_7_seg.v}
vlog -vlog01compat -work work +incdir+C:/quartus_practicas/Challenge_1_Frecuenciometro {C:/quartus_practicas/Challenge_1_Frecuenciometro/top_10bits_7seg.v}
vlog -vlog01compat -work work +incdir+C:/quartus_practicas/Challenge_1_Frecuenciometro {C:/quartus_practicas/Challenge_1_Frecuenciometro/pulse_counter.v}
vlog -vlog01compat -work work +incdir+C:/quartus_practicas/Challenge_1_Frecuenciometro {C:/quartus_practicas/Challenge_1_Frecuenciometro/frecuenciometro.v}

vlog -vlog01compat -work work +incdir+C:/quartus_practicas/Challenge_1_Frecuenciometro {C:/quartus_practicas/Challenge_1_Frecuenciometro/frecuenciometro_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  frecuenciometro_tb

add wave *
view structure
view signals
run -all
