cd ..
path=${PWD}

echo "[compileAll] Starting..."

# WRBackbone
echo "[compileAll] Compiling WRBackbone..."
cd ${path}/WRBackbone/trunk
mkdir build
cd build/
qmake ..
make -j8 > /dev/null

echo "[compileAll] Compiling Armorial-Actuator..."
cd ${path}/Armorial-Actuator/
sh protobuf.sh
mkdir build
cd build
qmake ..
make -j8 > /dev/null

echo "[compileAll] Compiling Armorial-Carrero..."
cd ${path}/Armorial-Carrero/
sh protobuf.sh
mkdir build
cd build
qmake ..
make -j8 > /dev/null

echo "[compileAll] Compiling Armorial-Suassuna..."
cd ${path}/Armorial-Suassuna/
sh protobuf.sh
mkdir build
cd build
qmake ..
make -j8 > /dev/null
