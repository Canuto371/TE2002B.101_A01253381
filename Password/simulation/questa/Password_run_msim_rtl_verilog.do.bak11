transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/quartus_practicas/Password {C:/quartus_practicas/Password/Password.v}
vlog -vlog01compat -work work +incdir+C:/quartus_practicas/Password {C:/quartus_practicas/Password/oneshot.v}
vlog -vlog01compat -work work +incdir+C:/quartus_practicas/Password {C:/quartus_practicas/Password/top_password_oneshot.v}

vlog -vlog01compat -work work +incdir+C:/quartus_practicas/Password {C:/quartus_practicas/Password/password_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  password_tb

add wave *
view structure
view signals
run -all
