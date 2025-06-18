onerror {exit -code 1}
vlib work
vcom -work work AND2Gate.vho
vcom -work work NOTGate.vwf.vht
vsim -voptargs="+acc" -c -t 1ps -L cycloneive -L altera -L altera_mf -L 220model -L sgate -L altera_lnsim work.NOTGate_vhd_vec_tst
vcd file -direction VHDLDemo.msim.vcd
vcd add -internal NOTGate_vhd_vec_tst/*
vcd add -internal NOTGate_vhd_vec_tst/i1/*
proc simTimestamp {} {
    echo "Simulation time: $::now ps"
    if { [string equal running [runStatus]] } {
        after 2500 simTimestamp
    }
}
after 2500 simTimestamp
run -all
quit -f
