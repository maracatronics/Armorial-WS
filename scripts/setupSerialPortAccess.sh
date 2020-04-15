# !/bin/bash

#
# Warthog Robotics - University of Sao Paulo - Sao Carlos (SP)
# http://www.warthog.sc.usp.br/
# This file is part of warthog-dia scripts.
#

echo "[setupSerialPortAccess] Adding user '$USER' to dialout group..."
echo "[setupSerialPortAccess] This will allow non-root access to USB ports."
sudo usermod -a -G dialout $USER > /dev/null
echo "[setupSerialPortAccess] OK!"

exit 0
