#!/usr/bin/env python3
import os
import signal
import subprocess

# Find the process
process = subprocess.Popen(['pgrep', '-f', 'roslaunch rosbridge_server rosbridge_websocket.launch'], stdout=subprocess.PIPE)
pid, err = process.communicate()

# Send SIGINT to the process
if pid:
    os.kill(int(pid), signal.SIGINT)
