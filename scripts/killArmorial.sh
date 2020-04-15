# !/bin/bash

#
# Warthog Robotics - University of Sao Paulo - Sao Carlos (SP)
# http://www.warthog.sc.usp.br/
# This file is part of warthog-dia scripts.
#

echo "[killWR] Stopping all WR softwares..."
if [ $(pidof WRJoy) ]; then
	sudo kill -9 $(pidof WRJoy) &
fi

# sudo killall -q WRTest 
sudo killall -q Armorial-Suassuna 
sudo killall -q Armorial-SimActuator 
sudo killall -q Armorial-Carrero 
sudo killall -q WRBackbone 
# sudo killall -q sslrefbox 
# sudo killall -q vssrefbox 
# sudo killall -q grsim 
# sudo killall -q WRSimActuator 
echo "[killWR] OK!"

exit 0
