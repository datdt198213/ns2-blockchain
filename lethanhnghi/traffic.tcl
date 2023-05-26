for {set i 0} {$i < $val(nn) } {incr i} {
    set udp_($i) [new Agent/UDP]
    set null_($i) [new Agent/Null]
    $ns_ attach-agent $node_($i) $udp_($i)
    $ns_ attach-agent $node_($i) $null_($i)
}

for {set i 0} {$i < $val(nn) } {incr i} {
    set cbr_($i) [new Application/Traffic/CBR]
    $cbr_($i) set packetSize_ 512
    $cbr_($i) set interval_ 0.05
    $cbr_($i) set random_ 1
    $cbr_($i) set maxpkts_ 10000
    $cbr_($i) attach-agent $udp_($i)
    # $ns_ at 2.5568388786897245 "$cbr_($i) start"
}


for {set i 0} {$i < $val(nn) } {incr i} {
    for {set j 0} {$j < $val(nn) } {incr j} {
        if {$i != $j} {
            $ns_ connect $udp_($i) $null_($j)
        } 
    }
}

