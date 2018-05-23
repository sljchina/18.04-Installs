#!bin/bash

# Install ROS Melodic

# Setup your sources.list && keys
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' \
    && apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

sudo apt-get update && install -y \
    ros-melodic-desktop-full
    
# To find available packages, use:
apt-cache search ros-melodic   

read

# Initialize rosdep
sudo rosdep init
rosdep update

# Environment setup
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc

# Dependencies for building packages
sudo apt-get install -y \
    python3-rosinstall \
    python3-rosinstall-generator \
    python3-wstool \
    build-essential
    
    
