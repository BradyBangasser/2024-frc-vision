# !/usr/bin/env sh

piip="10.34.7.31"

sshpass -p raspberry ssh pi@$piip < server_remount &
sleep 2
sshpass -p raspberry scp -O ./calibration.json pi@$piip:~/calibration.json
sshpass -p raspberry scp -O ./runCam.sh pi@$piip:runCam.sh
sshpass -p raspberry scp -O ./share/* pi@$piip:share
sshpass -p raspberry ssh pi@$piip < setup-pi-clientside.sh

./send_to_pi