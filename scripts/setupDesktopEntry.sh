#!/bin/bash
FOLDER=$(pwd)

echo "#!/usr/bin/env xdg-open
[Desktop Entry]
Type=Application
Icon=/usr/share/icons/wrlogo.png
Name=WRJoy
Comment=WRJoy laucher for lazy people
Exec=sh $FOLDER/runWRJoy.sh
Terminal=True
Categories=Development;" > wrjoy.desktop

sudo /bin/cp $FOLDER/../WRTools/WRJoy/trunk/img/warthog_logo.png /usr/share/icons/wrlogo.png
sudo /bin/mv $FOLDER/wrjoy.desktop /usr/share/applications/wrjoy.desktop
