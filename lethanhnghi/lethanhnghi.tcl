set val(chan)           Channel/WirelessChannel    ;# channel type
set val(prop)           Propagation/TwoRayGround   ;# radio-propagation model
set val(netif)          Phy/WirelessPhy            ;# network interface type
set val(mac)            Mac/802_11                 ;# MAC type
set val(ifq)            Queue/DropTail/PriQueue    ;# interface queue type
set val(ll)             LL                         ;# link layer type
set val(ant)            Antenna/OmniAntenna        ;# antenna model
set val(ifqlen)         50                         ;# max packet in ifq
set val(nn)             48                         ;# number of mobilenodes
set val(rp)             AODV                       ;# routing protocol
set opt(x) 1904;
set opt(y) 2355;
set val(stop) 100;


#
# Initialize Global Variables
#
set ns_		[new Simulator]
set tracefd     [open lethanhnghi.tr w]
$ns_ trace-all $tracefd

set namf     [open lethanhnghi.nam w]
$ns_ namtrace-all-wireless $namf $opt(x) $opt(y)

# set up topography object
set topo       [new Topography]

$topo load_flatgrid $opt(x) $opt(y)

#
# Create God
#
create-god $val(nn)

#
#  Create the specified number of mobilenodes [$val(nn)] and "attach" them
#  to the channel. 
#  Here two nodes are created : node(0) and node(1)

# configure node

        $ns_ node-config -adhocRouting $val(rp) \
			 -llType $val(ll) \
			 -macType $val(mac) \
			 -ifqType $val(ifq) \
			 -ifqLen $val(ifqlen) \
			 -antType $val(ant) \
			 -propType $val(prop) \
			 -phyType $val(netif) \
			 -channelType $val(chan) \
			 -topoInstance $topo \
			 -agentTrace ON \
			 -routerTrace ON \
			 -macTrace OFF \
			 -movementTrace ON			
			 
	for {set i 0} {$i < $val(nn) } {incr i} {
		set node_($i) [$ns_ node]	
		$node_($i) random-motion 0		;# disable random motion
        $ns_ initial_node_pos $node_($i) 20
	}   

#
# Provide initial (X,Y, for now Z=0) co-ordinates for mobilenodes
#

source mobility.tcl


# Setup traffic flow between nodes
source cbr48m.tcl

# UDP connection between node_(0) and node_(1)
# set udp0 [new Agent/UDP]
# $ns_ attach-agent $node_(0) $udp0

# set udp1 [new Agent/UDP]
# $ns_ attach-agent $node_(1) $udp1

# set null0 [new Agent/Null]
# $ns_ attach-agent $node_(1) $null0

# set null1 [new Agent/Null]
# $ns_ attach-agent $node_(0) $null1

# $ns_ connect $udp0 $null0
# $ns_ connect $udp1 $null1
# $udp0 set fid_ 1

# set cbr [new Application/Traffic/CBR]
# $cbr attach-agent $udp0
# $cbr set type_ CBR
# $cbr set packet_size_ 512

#
# Tell nodes when the simulation ends
#
for {set i 0} {$i < $val(nn) } {incr i} {
    $ns_ at $val(stop) "$node_($i) reset";
}
$ns_ at $val(stop) "stop"
$ns_ at 100.01 "puts \"NS EXITING...\" ; $ns_ halt"
proc stop {} {
    global ns_ tracefd
    $ns_ flush-trace
    close $tracefd
}

puts "Starting Simulation..."
$ns_ run
