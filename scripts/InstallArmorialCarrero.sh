git clone https://github.com/MaracatronicsRobotics/Armorial-Carrero.git
cd Armorial-Carrero
git checkout dev
sudo sh protobuf.sh
cd build
qmake ..
make -j8