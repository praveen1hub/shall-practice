#!/bin/bash

echo "All variables passed to the sript: $@"
echo "Number of variables passed: $#"
echo "Name of the script: $0"
echo "Current working directory: $PWD"
echo "Home directory of current user: $HOME"
echo "PID of the script executing now: $$"
sleep 100 &
echo "PID of last background command: $!"