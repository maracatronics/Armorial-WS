git clone https://github.com/MaracatronicsRobotics/GEARSystem.git
cd GEARSystem
cd trunk

sh build/corba_skeletons.sh
qmake install_path=/usr/lib/
make -j4
sudo sh install.sh