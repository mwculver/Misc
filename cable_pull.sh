#!/bin/bash


ticket=$1
logdir="/Users/mich8699/EA_QCs/qc/${ticket}-logs/cableout"
serverlist=$(/Users/mich8699/git/eascripts/utilities/devices_on $ticket)


mkdir -p $logdir
echo 'Ticket #'$ticket
for server in ${serverlist[@]}
do
        ht -c $server:/home/rack/cable_check.out $logdir/cable_check.out.$server &
        sleep 2
done
