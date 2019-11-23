
scriptWD=`pwd`

echo "Installing SFML and Qt5"
sudo apt-get update
sudo apt-get upgrade

sudo apt-get install build-essential libsfml-dev

wget http://download.qt.io/official_releases/qt/5.13/5.13.2/qt-opensource-linux-x64-5.13.2.run

chmod +x qt-opensource-linux-x64-5.13.2
./qt-opensource-linux-x64-5.13.2

sudo rm qt-opensource-linux-x64-5.13.2.run

echo "Installing dependencies to GEARSystem and WRBackbone"
sudo apt-get update
sudo apt-get upgrade

sudo apt-get install omniorb omniidl omniorb-nameserver libomniorb4-dev

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

cd trunk/
mkdir build
cd build/

qmake ..
make -j4


cd $scriptWD/..

echo "Installing Armorial-Carrero"

git clone https://github.com/maracatronics/Armorial-Carrero.git
sudo sh protobuf.sh
cd build
qmake ..
make

cd $scriptWD/..
echo "placeHolder to Armorial-Suassuna"

read -p "Do you want to install the Armorial-chico firmware repository?" -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
    echo "Downloading Armorial-Chico"
    git clone https://github.com/maracatronics/Armorial-Carrero.git
then
    echo "Bye-bye :)"
    exit 1
fi

