git clone https://github.com/maracatronics/Armorial-Actuator.git
cd Armorial-Actuator
sudo sh protobuf.sh
mkdir build && cd build
qmake ..
make -j8