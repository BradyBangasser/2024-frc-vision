# !/usr/bin/env sh

sudo mount -o remount,rw '/dev/mmcblk0p2'
fuser server 2> /dev/null | xargs kill
# todo, make this "try harder"
echo "Old server hash: $(sha1sum server)"
sudo chmod 000 server
echo "Tmp server hash: $(sha1sum server_tmp)"
mv server_tmp server
sudo chmod +x server
echo "New Server Hash: $(sha1sum server)"
exit