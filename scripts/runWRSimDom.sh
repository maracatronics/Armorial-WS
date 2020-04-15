sudo rm -rf /var/log/omniORB/*
sudo systemctl start omniNames
WRBackbone &> /dev/null &
WREye 10020 &> /dev/null &
grsim &> /dev/null &
sslrefbox &> /dev/null &
WRSimActuator &> /dev/null &

echo "[runWRSim] Press 'q' to exit..."

while IFS= read -r -n1 c
do
    if [ "$c" == "q" ]; then
        echo ""
        tput setaf 2
        sh killWR.sh
        tput sgr0
        echo "[runWRSim] Finished!"
        exit 0
    fi
    sleep 0.1
done

exit 0
