git clone https://github.com/MaracatronicsRobotics/Armorial-Actuator.git
cd Armorial-Actuator
git checkout dev
sudo sh protobuf.sh
mkdir build && cd build
qmake ..
make -j8