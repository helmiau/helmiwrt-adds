#!/bin/sh

parms="$1"

echo "*Hosts*"

if [ "$parms" != "" ]; then
	cat /tmp/dhcp.leases | grep "$parms" | awk '{gsub("*","\\*"); gsub( "_","\\_" );  printf "Acquire Date: " ; system("date \"+%d/%m/%Y %T %Z\" -d \"@$(( "$1" - 43200))\"");printf "Device: " $4 "\nIP: " $3 "\nMac: " toupper($2)"\nState: "; system("./get_ping "$4" 1") ;printf "\n\n" }'
else
	cat /tmp/dhcp.leases | awk '{gsub("*","\\*"); gsub( "_","\\_" );  printf "Acquire Date: " ; system("date \"+%d/%m/%Y %T %Z\" -d \"@$(( "$1" - 43200))\"");printf "Device: " $4 "\nIP: " $3 "\nMac: " toupper($2)"\nState: "; system("./get_ping "$4" 1") ;printf "\n\n" }'
fi