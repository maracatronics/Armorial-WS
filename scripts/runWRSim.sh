# !/bin/bash

#
# Warthog Robotics - University of Sao Paulo - Sao Carlos (SP)
# http://www.warthog.sc.usp.br/
# This file is part of warthog-dia scripts.
#

process=(`ps -ef | awk '/[g]rsim/{print $8}'` `ps -ef | awk '/[W]Backbone/{print $8}'` `ps -ef | awk  '/[W]REye/{print $8}'` `ps -ef | awk '/[s]slrefbox/{print $8}'`)
grsim=1
backbone=1
wreye=1
refbox=1
wrsimactuator=1
for proc in ${process[@]}; do
	case $proc in
		*grsim) 
			grsim=0
		;;
		*WRBackbone) 
			backbone=0
		;;
		*WREye) 
			wreye=0
		;;
		*sslrefbox) 
			refbox=0
		;;
		*WRSimActuator)
                        wrsimactuator=0
	esac
done

echo "[runWRSim] Starting..."

echo "[runWRSim] Compiling softwares..."
tput setaf 2
sh compileAll.sh
tput sgr0

echo "[runWRSim] Creating symbolic links..."
tput setaf 2
sh setupSymLinks.sh
tput sgr0

echo "[runWRSim] Cleaning omniORB..."
sudo rm -rf /var/log/omniORB/*
sleep 0.25

echo "[runWRSim] Starting omniNames service..."
sudo systemctl start omniNames
sleep 0.25

echo "[runWRSim] Starting grsim..."
tput setaf 2
if [ $grsim -ne 0 ]; then
	echo "[grsim] Executing..."
	grsim &> /dev/null &
	sleep 0.5
fi
echo "[grsim] OK!"
tput sgr0

echo "[runWRSim] Starting WRBackbone..."
tput setaf 2
if [ $backbone -ne 0 ]; then
	echo "[WRBackbone] Executing..."
	WRBackbone &> /dev/null &
	sleep 0.5
fi
echo "[WRBackbone] OK!"
tput sgr0

echo "[runWRSim] Starting WRSimActuator..."
tput setaf 2
if [ $wrsimactuator -ne 0 ]; then
	echo "[WRSimActuator] Executing..."
	WRSimActuator &> /dev/null &
	sleep 0.5
fi
echo "[WRSimActuator] OK!"
tput sgr0

echo "[runWRSim] Starting WREye..."
tput setaf 2
if [ $wreye -ne 0 ]; then
        echo "[WREye] Executing..."
        WREye 10020 &> /dev/null &
	sleep 0.5
fi
echo "[WREye] OK!"
tput sgr0

echo "[runWRSim] Starting ssl-refbox..."
tput setaf 2
if [ $refbox -ne 0 ]; then
        echo "[ssl-refbox] Executing..."
        sslrefbox &> /dev/null &
	sleep 0.5
fi
echo "[ssl-refbox] OK!"
tput sgr0

echo "[runWRSim] Started successfully!"
echo "[runWRSim] Press 'q' to exit..."

while IFS= read -r -n1 c
do
    if [ "$c" == "q" ]; then
        echo ""
        tput setaf 2
        sh killWR.sh
        tput sgr0
        echo "[runWRSim] Finished!"
        exit 0
    fi
    sleep 0.1
done

exit 0
