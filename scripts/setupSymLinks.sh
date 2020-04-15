# !/bin/bash

#
# Warthog Robotics - University of Sao Paulo - Sao Carlos (SP)
# http://www.warthog.sc.usp.br/
# This file is part of warthog-dia scripts.
#

# get full current path
cd ..
path=${PWD}

echo "[setupSymLink] Installing..."

# Armorial-Actuator
sudo rm -f /usr/bin/Armorial-SimActuator
sudo ln -s ${path}/Armorial-Actuator/bin/Armorial-SimActuator /usr/bin/Armorial-SimActuator

# Armorial-Carrero
sudo rm -f /usr/bin/Armorial-Carrero
sudo ln -s ${path}/Armorial-Carrero/bin/Armorial-Carrero /usr/bin/Armorial-Carrero

# WRBackbone
sudo rm -f /usr/bin/WRBackbone
sudo ln -s ${path}/WRBackbone/trunk/build/bin/WRBackbone /usr/bin/WRBackbone

# WRCoach
sudo rm -f /usr/bin/Armorial-Suassuna
sudo ln -s ${path}/Armorial-Suassuna/bin/Armorial-Suassuna /usr/bin/Armorial-Suassuna

# ssl-refbox
#sudo rm -f /usr/bin/sslrefbox
#sudo ln -s ${path}/utils/refbox/ssl-refbox/sslrefbox /usr/bin/sslrefbox

# vss-refbox
#sudo rm -f /usr/bin/vssrefbox
#sudo ln -s ${path}/utils/refbox/vss-refbox/vssrefbox /usr/bin/vssrefbox

# WRJoy
#sudo rm -f /usr/bin/WRJoy
#sudo ln -s ${path}/WRTools/WRJoy/trunk/bin/WRJoy /usr/bin/WRJoy

# WRTest
#sudo rm -f /usr/bin/WRTest
#sudo ln -s ${path}/WRTools/WRTest/trunk/bin/WRTest /usr/bin/WRTest



# WRSimActuator
# sudo rm -f /usr/bin/WRSimActuator
# sudo ln -s ${path}/WRTools/WRSimActuator/trunk/bin/WRSimActuator /usr/bin/WRSimActuator

echo "[setupSymLink] OK!"

exit 0

