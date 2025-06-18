onerror {exit -code 1}
vlib work
vcom -work work Guiao11a13.vho
vcom -work work SeqDetSim.vwf.vht
vsim -voptargs="+acc" -c -t 1ps -L cycloneive -L altera -L altera_mf -L 220model -L sgate -L altera_lnsim work.SeqDet1011completo_vhd_vec_tst
vcd file -direction Guiao11a13.msim.vcd
vcd add -internal SeqDet1011completo_vhd_vec_tst/*
vcd add -internal SeqDet1011completo_vhd_vec_tst/i1/*
proc simTimestamp {} {
    echo "Simulation time: $::now ps"
    if { [string equal running [runStatus]] } {
        after 2500 simTimestamp
    }
}
after 2500 simTimestamp
run -all
quit -f
