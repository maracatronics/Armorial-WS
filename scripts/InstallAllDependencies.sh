echo "updating apt repo"
sudo apt update
sudo apt upgrade

echo "Installing Dependencies"

sudo apt install build-essential libsfml-dev g++ libeigen3-dev protobuf-compiler libprotobuf-dev libdc1394-22 libdc1394-22-dev cmake libv4l-0 libopencv-dev freeglut3-dev qt5-default omniorb omniidl omniorb-nameserver libomniorb4-dev

# read -p "Do you wish to install QT Creator?" yn
# case $yn in
#     [Yy]* ) echo "Downloading QT"; 
#         wget http://download.qt.io/official_releases/qt/5.13/5.13.2/qt-opensource-linux-x64-5.13.2.run;
#         chmod +x ./qt-opensource-linux-x64-5.13.2.run;
#         ./qt-opensource-linux-x64-5.13.2.run;
#         sudo rm qt-opensource-linux-x64-5.13.2.run;;
#     [Nn]* ) echo " ";;
#     * ) echo "Please answer yes or no.";;
# esac
