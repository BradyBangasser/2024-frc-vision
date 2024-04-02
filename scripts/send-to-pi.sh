#!/bin/bash

source ./scripts/variables.sh

if make; then 
    if ! sshpass -p raspberry scp -O ./server pi@$PI_IP:~/server-tmp; then 
        # attempt to remount fs in rw mode
        sshpass -p raspberry ssh pi@$PI_IP < ./scripts/server-remount.sh &
        sleep 1

        if ! sshpass -p raspberry scp -O ./server pi@$PI_IP:~/server-tmp; then 
            echo "failed"
            exit
        fi
    fi
    sshpass -p raspberry ssh pi@$PI_IP < ./scripts/server-ssh.sh
fi