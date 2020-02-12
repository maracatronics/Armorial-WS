
scriptWD=`pwd`

echo "updating apt repo"
sudo apt update
sudo apt upgrade

echo "Installing Dependencies"



sudo apt install build-essential libsfml-dev g++ libqt4-dev libeigen3-dev protobuf-compiler libprotobuf-dev libdc1394-22 libdc1394-22-dev cmake libv4l-0 libopencv-dev freeglut3-dev qt5-default omniorb omniidl omniorb-nameserver libomniorb4-dev

read -p "Do you wish to install QT Creator?" yn
case $yn in
    [Yy]* ) echo "Downloading QT"; 
        wget http://download.qt.io/official_releases/qt/5.13/5.13.2/qt-opensource-linux-x64-5.13.2.run;
        chmod +x ./qt-opensource-linux-x64-5.13.2.run;
        ./qt-opensource-linux-x64-5.13.2.run;
        sudo rm qt-opensource-linux-x64-5.13.2.run;;
    [Nn]* ) echo "Bye-bye :)";;
    * ) echo "Please answer yes or no.";;
esac

echo "Installing dependencies to GEARSystem and WRBackbone"

cd $scriptWD/..

echo "Installing GEARSystem"
git clone https://github.com/maracatronics/GEARSystem.git
cd GEARSystem
rm -r branches
rm -r tags
cd trunk

sh build/corba_skeletons.sh
qmake install_path=/usr/lib/
make -j4
sudo sh install.sh

cd $scriptWD/..
echo "Installing WRBackbone"
git clone https://github.com/maracatronics/WRBackbone.git

cd WRBackbone
cd trunk/
mkdir build
cd build/

qmake ..
make -j4


cd $scriptWD/..

echo "Installing Armorial-Carrero"
git clone https://github.com/maracatronics/Armorial-Carrero.git
cd Armorial-Carrero
sudo sh protobuf.sh
cd build
qmake ..
make

cd $scriptWD/..
git clone https://github.com/maracatronics/Armorial-Suassuna.git
cd Armorial-Suassuna
sudo sh protobuf.sh
cd build
qmake ..
make


read -p "Do you wish to install the Armorial-chico firmware repository?" yn
case $yn in
    [Yy]* ) echo "Downloading Armorial-Chico"; git clone https://github.com/maracatronics/Armorial-Chico.git;;
    [Nn]* ) echo "Bye-bye :)";exit;;
    * ) echo "Please answer yes or no.";;
esac


cd $scriptWD/..
cd ..
sudo chmod -R a+rwx ./Armorial-WS/