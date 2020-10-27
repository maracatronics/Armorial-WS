
scriptWD=`pwd`

# sh ./InstallAllDependencies.sh

cd $scriptWD/..
echo "Installing GEARSystem"

sh ./scripts/InstallGearSystem.sh

cd $scriptWD/..
echo "Installing WRBackbone"

sh ./scripts/InstallWRBackbone.sh

cd $scriptWD/..
echo "Installing Armorial-Carrero"

sh ./scripts/InstallArmorialCarrero.sh

cd $scriptWD/..
echo "Installing Armorial-Suassuna"

sh ./scripts/InstallArmorialSuassuna.sh

cd $scriptWD/..
echo "Installing Armorial-Actuator"

sh ./scripts/InstallArmorialActuator.sh


# read -p "Do you wish to install the Armorial-chico firmware repository?" yn
# case $yn in
#     [Yy]* ) echo "Downloading Armorial-Chico"; git clone https://github.com/maracatronics/Armorial-Chico.git;;
#     [Nn]* ) echo "Bye-bye :)";;
#     * ) echo "Please answer yes or no.";;
# esac


cd $scriptWD/..
cd ..
sudo chmod -R a+rwx ./Armorial-WS/
