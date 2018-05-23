#!bin/bash


## Install OpenAI  Enviorments ##


# Roboschool #

PATH=~/Documents/RL

cd $PATH
git clone https://github.com/openai/roboschool.git

ROBOSCHOOL_PATH=~/Documents/RL/roboschool

## RoboSchool ##
sudo apt-get update && apt-get install -y \
    zlib1g-dev \
    libjpeg-dev \
    xvfb \
    libav-tools \
    xorg-dev \
    python-opengl \
    libboost-all-dev \
    libsdl2-dev swig 

cd $ROBOSCHOOL_PATH

git clone https://github.com/olegklimov/bullet3 -b roboschool_self_collision
mkdir bullet3/build
cd    bullet3/build
cmake -DBUILD_SHARED_LIBS=ON \
    -DUSE_DOUBLE_PRECISION=1 -DCMAKE_INSTALL_PREFIX:PATH=$ROBOSCHOOL_PATH/roboschool/cpp-household/bullet_local_install -DBUILD_CPU_DEMOS=OFF -DBUILD_BULLET2_DEMOS=OFF -DBUILD_EXTRAS=OFF  -DBUILD_UNIT_TESTS=OFF -DBUILD_CLSOCKET=OFF -DBUILD_ENET=OFF -DBUILD_OPENGL3_DEMOS=OFF ..
make -j4
make install
cd ../..

pip3 install -e $ROBOSCHOOL_PATH
