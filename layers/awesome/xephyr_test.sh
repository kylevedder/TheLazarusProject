#!/bin/bash
sudo apt install -y xserver-xephyr
Xephyr :2 -screen 1280x1024 &
DISPLAY=:2 awesome
