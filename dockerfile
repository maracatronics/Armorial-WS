FROM ubuntu:18.04

# dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    nano \
    cmake \
    git \
    qt5-default \
    sudo \
    omniorb \
    omniidl \
    omniorb-nameserver \
    libomniorb4-dev \
    libprotobuf-dev \
    protobuf-compiler \
    freeglut3-dev \
    libgl1-mesa-dev \
    libglm-dev \
    libglew1.5-dev \
    && apt-get clean

# gear system
RUN cd /home && \
    git clone https://github.com/maracatronics/Armorial-WS.git 

# gear system
RUN cd /home/Armorial-WS && \
    git clone https://github.com/MaracatronicsRobotics/GEARSystem.git && \
    cd GEARSystem && \
    cd trunk && \
    sh build/corba_skeletons.sh && \
    qmake install_path=/usr/lib && \
    make -j4 && \
    sh install.sh 

RUN cd /home/Armorial-WS && \ 
    git clone https://github.com/MaracatronicsRobotics/WRBackbone.git && \
    cd WRBackbone && \
    cd trunk && \
    mkdir build && \
    cd build && \
    qmake .. && \
    make -j4

RUN cd /home/Armorial-WS && \ 
    git clone https://github.com/MaracatronicsRobotics/Armorial-Actuator.git && \ 
    cd Armorial-Actuator && \  
    mkdir build && cd build && \ 
    qmake .. && \ 
    make -j8

RUN cd /home/Armorial-WS && \ 
    git clone https://github.com/MaracatronicsRobotics/Armorial-Carrero.git && \ 
    cd Armorial-Carrero && \ 
    mkdir build && cd build && \ 
    qmake .. && \ 
    make -j8

RUN cd /home/Armorial-WS && \ 
    git clone https://github.com/MaracatronicsRobotics/Armorial-Suassuna.git && \ 
    cd Armorial-Suassuna && \ 
    mkdir build && cd build && \ 
    qmake .. && \ 
    make -j8

WORKDIR ./home/Armorial-WS/
