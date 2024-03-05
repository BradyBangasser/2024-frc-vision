# !/usr/bin/env sh

ip="10.34.7.69"

if make; then 
    if ! sshpass -p raspberry scp -O ./server pi@$ip:~/server_tmp; then 
        # attempt to remount fs in rw mode
        sshpass -p raspberry ssh pi@$ip < server_remount &
        sleep 1

        if ! sshpass -p raspberry scp -O ./server pi@$ip:~/server_tmp; then 
            echo "failed"
            exit
        fi
    fi
    sshpass -p raspberry ssh pi@$ip < server_ssh
fi