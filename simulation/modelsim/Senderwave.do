onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix binary /sender/Ready
add wave -noupdate -radix binary /sender/Transmit
add wave -noupdate -radix binary /sender/Reset
add wave -noupdate -radix binary /sender/Clock
add wave -noupdate -radix decimal /sender/DataIn
add wave -noupdate -radix hexadecimal /sender/Address
add wave -noupdate -radix binary /sender/ReadEnable
add wave -noupdate -radix decimal -childformat {{{/sender/saida[15]} -radix decimal} {{/sender/saida[14]} -radix decimal} {{/sender/saida[13]} -radix decimal} {{/sender/saida[12]} -radix decimal} {{/sender/saida[11]} -radix decimal} {{/sender/saida[10]} -radix decimal} {{/sender/saida[9]} -radix decimal} {{/sender/saida[8]} -radix decimal} {{/sender/saida[7]} -radix decimal} {{/sender/saida[6]} -radix decimal} {{/sender/saida[5]} -radix decimal} {{/sender/saida[4]} -radix decimal} {{/sender/saida[3]} -radix decimal} {{/sender/saida[2]} -radix decimal} {{/sender/saida[1]} -radix decimal} {{/sender/saida[0]} -radix decimal}} -subitemconfig {{/sender/saida[15]} {-radix decimal} {/sender/saida[14]} {-radix decimal} {/sender/saida[13]} {-radix decimal} {/sender/saida[12]} {-radix decimal} {/sender/saida[11]} {-radix decimal} {/sender/saida[10]} {-radix decimal} {/sender/saida[9]} {-radix decimal} {/sender/saida[8]} {-radix decimal} {/sender/saida[7]} {-radix decimal} {/sender/saida[6]} {-radix decimal} {/sender/saida[5]} {-radix decimal} {/sender/saida[4]} {-radix decimal} {/sender/saida[3]} {-radix decimal} {/sender/saida[2]} {-radix decimal} {/sender/saida[1]} {-radix decimal} {/sender/saida[0]} {-radix decimal}} /sender/saida
add wave -noupdate -radix binary /sender/Ack
add wave -noupdate -radix binary /sender/Req
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {947 ps} 0}
quietly wave cursor active 1
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
WaveRestoreZoom {0 ps} {6448 ps}
