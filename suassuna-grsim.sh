

scriptWD=`pwd`

sudo rm -rf /var/lib/omniorb/*
sudo service omniorb4-nameserver restart

sleep 5

cd WRBackbone
cd trunk
cd build
cd bin
./WRBackbone &> /dev/null &

sleep 5
cd $scriptWD
cd Armorial-Actuator/bin
./Armorial-SimActuator &> /dev/null &

sleep 5
cd $scriptWD

cd ./Armorial-Carrero/bin
./Armorial-Carrero &> /dev/null &

sleep 5
cd $scriptWD
cd ./Armorial-Suassuna/bin
./Armorial-Suassuna &> /dev/null &
