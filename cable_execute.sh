#!/bin/bash


#retieves the ticket # from first argument when executing script
ticket=$1

#uses local script to retieve list of devices attached to ticket 
serverlist=$(/Users/mich8699/git/eascripts/utilities/devices_on $ticket)

echo 'Ticket #'$ticket
for server in ${serverlist[@]}
do
        #Executes the cable_check script on each local device attached to ticket #
        ht -C '/home/rack/cable_check.sh > /home/rack/cable_check.out' --sudo-make-me-a-sandwich --expect-timeout 900 $server &
        #script takes aprox 10mins to finish, so timeout for ht set to 15mins to prevent error messages
        #sleep used to prevent executing to many ht requests to bastion at once
        sleep 2
done
