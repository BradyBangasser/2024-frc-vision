# !/usr/bin/env bash

initTime=5
sudo kill `ps -o pid= -N T`

echo "Starting Software in $initTime seconds"

sleep $initTime

sudo ldconfig ~/share

sudo mount -o remount,rw '/dev/sda2'

./server