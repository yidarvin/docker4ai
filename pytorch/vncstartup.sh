#!/usr/bin/env bash

sudo vncserver
sudo vncserver -kill :1
mv xstartup /root/.vnc/xstartup
chmod +x ~/.vnc/xstartup
sudo vncserver :1 -geometry 1600x900 -depth 24
