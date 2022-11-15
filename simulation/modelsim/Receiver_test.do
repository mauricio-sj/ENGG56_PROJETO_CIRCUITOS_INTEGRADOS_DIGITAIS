onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /receiver/WriteEnable
add wave -noupdate /receiver/Ready
add wave -noupdate /receiver/Ack
add wave -noupdate /receiver/Address
add wave -noupdate /receiver/DataIn
add wave -noupdate /receiver/Entrada
add wave -noupdate /receiver/Clock
add wave -noupdate /receiver/Reset
add wave -noupdate /receiver/Req
add wave -noupdate /receiver/CountFlag
add wave -noupdate /receiver/CountAddress
add wave -noupdate /receiver/Estado
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {0 ps} {1425 ps}
