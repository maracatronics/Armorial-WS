scriptWD=`pwd`

# how to run
# sudo sh suassuna.sh ip-actuator port-actuator ip-vision port-vision teamColor teamSide

sudo rm -rf /var/lib/omniorb/*
sudo service omniorb4-nameserver restart

sleep 5

cd /home/Armorial-WS/
cd WRBackbone
cd trunk
cd build
cd bin
./WRBackbone &> /dev/null &

sleep 5
cd /home/Armorial-WS/
cd Armorial-Actuator/bin
./Armorial-SimActuator $1 $2 &> /dev/null &

sleep 5

cd /home/Armorial-WS/
cd ./Armorial-Carrero/bin
./Armorial-Carrero $3 $4 &> /dev/null &

sleep 5

cd /home/Armorial-WS/
cd ./Armorial-Suassuna/bin
./Armorial-Suassuna $5 $6 false &> /dev/null &
