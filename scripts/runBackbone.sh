scriptWD=`pwd`

sudo systemctl stop omniorb4-nameserver
sudo rm -rf /var/lib/omniorb/*
sudo systemctl enable omniorb4-nameserver
sudo systemctl start omniorb4-nameserver

cd $scriptWD/..
cd WRBackbone
cd trunk
cd build
cd bin
./WRBackbone
