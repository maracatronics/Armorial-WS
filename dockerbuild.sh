xhost +local:docker

docker build . -f dockerfile --no-cache -t maracatronics_ssl_larc2020
