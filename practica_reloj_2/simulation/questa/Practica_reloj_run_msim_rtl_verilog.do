transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/quartus_practicas/practica_reloj_2 {C:/quartus_practicas/practica_reloj_2/debouncer.v}
vlog -vlog01compat -work work +incdir+C:/quartus_practicas/practica_reloj_2 {C:/quartus_practicas/practica_reloj_2/clk_divider.v}
vlog -vlog01compat -work work +incdir+C:/quartus_practicas/practica_reloj_2 {C:/quartus_practicas/practica_reloj_2/decoder_7_seg.v}
vlog -vlog01compat -work work +incdir+C:/quartus_practicas/practica_reloj_2 {C:/quartus_practicas/practica_reloj_2/top_counter_debouncer_clkdiv.v}
vlog -vlog01compat -work work +incdir+C:/quartus_practicas/practica_reloj_2 {C:/quartus_practicas/practica_reloj_2/counter_debouncer.v}
vlog -vlog01compat -work work +incdir+C:/quartus_practicas/practica_reloj_2 {C:/quartus_practicas/practica_reloj_2/count_load.v}

vlog -vlog01compat -work work +incdir+C:/quartus_practicas/practica_reloj_2 {C:/quartus_practicas/practica_reloj_2/top_counter_debouncer_clkdiv_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  top_counter_debouncer_clkdiv_tb

add wave *
view structure
view signals
run -all
