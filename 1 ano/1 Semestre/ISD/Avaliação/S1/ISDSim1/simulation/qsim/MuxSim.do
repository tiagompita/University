onerror {exit -code 1}
vlib work
vcom -work work MuxSim.vho
vcom -work work Ex4.vwf.vht
vsim -voptargs="+acc" -c -t 1ps -L cycloneive -L altera -L altera_mf -L 220model -L sgate -L altera_lnsim work.MuxSim_vhd_vec_tst
vcd file -direction MuxSim.msim.vcd
vcd add -internal MuxSim_vhd_vec_tst/*
vcd add -internal MuxSim_vhd_vec_tst/i1/*
proc simTimestamp {} {
    echo "Simulation time: $::now ps"
    if { [string equal running [runStatus]] } {
        after 2500 simTimestamp
    }
}
after 2500 simTimestamp
run -all
quit -f
