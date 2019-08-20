#!/bin/bash

rm -f /tmp/.X99-lock ; export DISPLAY=:99; Xvfb :99 -ac -screen 0 1280x1024x16 & ; jackd -d dummy & ; sleep 5 ; echo SuperDirt.start /tmp/g && sclang /tmp/g & ; sleep 5 ; ffmpeg -f jack -i ffmpeg -f ogg - </dev/null | ezstream -c ~/tidal/ezstream.xml & ; sleep 5 ; jack_connect SuperCollider:out_1 ffmpeg:input_1 ; jack_connect SuperCollider:out_2 ffmpeg:input_2 ; cd ~/extramuros && ( node server.js --password fun & ; node client.js --server 127.0.0.1 --tidalCabal & )
