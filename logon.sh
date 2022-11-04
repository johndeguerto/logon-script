#!/bin/bash

ts=$(date +"%m-%d-%Y %T %Z")
u="$USER"
log_file="t3logs.log"
rip=$(who --ips am i | awk '{print $5}')
echo .
echo "Logged in as: $u"


log(){
  echo "[$ts] - $1"
  echo "[$ts] - $1" >> $log_file
}


trap "echo No no..." SIGINT SIGTERM
yn=""
while [ "$yn" == "" ]; do
        read -p "Enter Zendesk #" zd
        if [ "$zd" != "" ];then
           log "User $u logged in from $rip for ZD # $zd"
           yn=$zd
           trap SIGINT
        fi
done

last $u | head -n 2
