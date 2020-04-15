# !/bin/bash

#
# Warthog Robotics - University of Sao Paulo - Sao Carlos (SP)
# http://www.warthog.sc.usp.br/
# This file is part of warthog-dia scripts.
#

#process=(`ps -ef | awk '/[W]RBackbone/{print $8}'` `ps -ef | awk '/[W]RStation/{print $8}'` `ps -ef | awk '/[W]RCoach/{print $8}'` `ps -ef | awk '/[W]REye/{print $8}'`)
wrbackbone=1
armorialactuator=1
armorialsuassuna=1
armorialcarrero=1

echo "[runWRCoach] Starting..."

echo "[runWRCoach] Compiling softwares..."
tput setaf 2
sh compileAll.sh 
tput sgr0

echo "[runWRCoach] Creating symbolic links..."
tput setaf 2
sh setupSymLinks.sh
tput sgr0

echo "[runWRCoach] Granting serial port access..."
tput setaf 2
sh setupSerialPortAccess.sh
tput sgr0

echo "[runWRCoach] Cleaning omniORB..."
#sh runBackbone.sh
sudo systemctl stop omniorb4-nameserver
sleep 1
sudo rm -rf /var/lib/omniorb/*
sleep 1

echo "[runWRCoach] Starting omniNames service..."
sudo systemctl enable omniorb4-nameserver
sleep 1
sudo systemctl start omniorb4-nameserver
sleep 1

echo "[runWRCoach] Starting WRBackbone..."
tput setaf 2
if [ $wrbackbone != 0 ]; then
        tput setaf 2
	echo "[WRBackbone] Executing..."
	WRBackbone &> /dev/null &
	sleep 0.5
fi
echo "[WRBackbone] OK!"
tput sgr0

echo "[runWRCoach] Starting WREye..."
tput setaf 2
if [ $armorialcarrero -eq 1 ]; then
	echo "[WREye] Executing..."
	scriptWD=`pwd`
	cd $scriptWD/..
	cd Armorial-Carrero/bin/
	Armorial-Carrero &> /dev/null &
	sleep 0.5
fi
echo "[WREye] OK!"
tput sgr0

echo "[runWRStation] Starting WRStation..."
tput setaf 2
if [ $armorialactuator -eq 1 ]; then
	echo "[WRStation] Executing..."
	Armorial-SimActuator &> /dev/null &
	sleep 0.5
fi
echo "[WRStation] OK!"
tput sgr0

echo "[runWRCoach] Starting WRCoach..."
tput setaf 2

if [ $armorialsuassuna -eq 1 ]; then
	echo "[WRCoach] Executing..."
	Armorial-Suassuna $1 $2 $3 &> /dev/null &
	sleep 0.5
fi
echo "[WRCoach] OK!"
tput sgr0

echo "[runWRCoach] Started successfully!"
echo "[runWRCoach] Press 'q' to exit..."

while IFS= read -r -n1 c
do

  case $c in
    [Qq]* ) echo "Downloading Armorial-Chico";
	echo ""
    tput setaf 2
    sh killArmorial.sh
    tput sgr0
    echo "[runWRCoach] Finished!"
    exit 0;;
    * ) ;;
esac
  sleep 0.1
done

exit 0
