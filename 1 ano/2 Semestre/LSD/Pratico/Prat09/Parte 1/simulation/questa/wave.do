onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /seqdetfsm_tb/s_x
add wave -noupdate /seqdetfsm_tb/s_rst
add wave -noupdate /seqdetfsm_tb/s_clk
add wave -noupdate /seqdetfsm_tb/s_y
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {317 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {384 ns} {708 ns}
