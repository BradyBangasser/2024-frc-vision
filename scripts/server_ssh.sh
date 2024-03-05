# !/usr/bin/env sh

fuser server 2> /dev/null | xargs kill
mv server_tmp server
echo New Server Hash: $(sha1sum server)
exit