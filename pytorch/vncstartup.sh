#!/usr/bin/env bash

USER=bmcv vncserver
USER=bmcv vncserver -kill :1
mv ./xstartup /home/bmcv/.vnc/xstartup
chmod +x ~/.vnc/xstartup
USER=bmcv vncserver :1 -geometry 1600x900 -depth 24
