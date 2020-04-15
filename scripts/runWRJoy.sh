# !/bin/bash

#
# Warthog Robotics - University of Sao Paulo - Sao Carlos (SP)
# http://www.warthog.sc.usp.br/
# This file is part of warthog-dia scripts.
#

process=(`ps -ef | awk '/[W]RBackbone/{print $8}'` `ps -ef | awk '/[W]RStation/{print $8}'` `ps -ef | awk '/[W]RJoy/{print $8}'`)
wrbackbone=1
wrstation=1
wrjoy=1
for proc in ${process[@]}; do
	case $proc in
		*WRBackbone) wrbackbone=0
		;;
		*WRStation) wrstation=0
		;;
		*WRJoy) wrjoy=0
		;;
	esac
done

echo "[runWRJoy] Starting..."

echo "[runWRJoy] Compiling softwares..."
tput setaf 2
sh compileAll.sh
tput sgr0

echo "[runWRJoy] Creating symbolic links..."
tput setaf 2
sh setupSymLinks.sh
tput sgr0

echo "[runWRJoy] Granting serial port access..."
tput setaf 2
sh setupSerialPortAccess.sh
tput sgr0

echo "[runWRJoy] Cleaning omniORB..."
sudo rm -rf /var/log/omniORB/*
sleep 0.25

echo "[runWRJoy] Starting omniNames service..."
sudo systemctl start omniNames
sleep 0.25

echo "[runWRJoy] Starting WRBackbone..."
tput setaf 2
if [ $wrbackbone -ne 0 ]; then
        tput setaf 2
	echo "[WRBackbone] Executing..."
	WRBackbone &> /dev/null &
	sleep 0.5
fi
echo "[WRBackbone] OK!"
tput sgr0

echo "[runWRJoy] Starting WRStation..."
tput setaf 2
if [ $wrstation -ne 0 ]; then
	echo "[WRStation] Executing..."
	WRStation &> /dev/null &
	sleep 0.5
fi
echo "[WRStation] OK!"
tput sgr0

echo "[runWRJoy] Starting WRJoy..."
tput setaf 2
if [ $wrjoy -ne 0 ]; then
	echo "[WRJoy] Executing..."
	WRJoy &> /dev/null &
	sleep 0.5
fi
echo "[WRJoy] OK!"
tput sgr0

echo "[runWRJoy] Started successfully!"
echo "[runWRJoy] Press 'q' to exit..."

while IFS= read -r -n1 c
do
  if [ "$c" == "q" ]; then
    echo ""
    tput setaf 2
    sh killWR.sh
    tput sgr0
    echo "[runWRJoy] Finished!"
    exit 0
  fi
  sleep 0.1
done

exit 0
