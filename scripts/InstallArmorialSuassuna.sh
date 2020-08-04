git clone https://github.com/MaracatronicsRobotics/Armorial-Suassuna.git
cd Armorial-Suassuna
git checkout dev
sudo sh protobuf.sh
cd build
qmake ..
make -j8