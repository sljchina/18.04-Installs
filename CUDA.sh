#!/bin/bash 

# Check if Nvidia Drivers are installed
nvidia-smi

echo -e \
    " Is no driver are found install Nvidia Drivers \
    \
    sudo apt purge nvidia-* \
    && add-apt-repository ppa:graphics-drivers/ppa \
    && apt update \
    && apt install nvidia-390 \"
    
read

# Install wget
sudo apt-get update && apt-get install -y \
    wget
   
# Download Cuda-9.0
cd ~/Downloads   
wget https://developer.nvidia.com/compute/cuda/9.0/Prod/local_installers/cuda_9.0.176_384.81_linux-run

# Install Cuda-9.0
echo -e \
    "Select the folowwing: \
    Yes to installing with an unsupported configuration, \
    No to “Install NVIDIA Accelerated Graphics Driver for Linux-x86_64 384.81?”. \n
    Don’t agree to install the new driver"

sudo chmod +x cuda_9.0.176_384.81_linux.run

./cuda_9.0.176_384.81_linux.run --override

# Install Cudnn-7.0 (CUDA® Deep Neural Network) & Stop it from Updating

CUDNN_VERSION = 7.1.4.18

sudo apt-get install -y --no-install-recommends --allow-downgrades \
    libcudnn7=$CUDNN_VERSION-1+cuda9.0 \
    libcudnn7-dev=$CUDNN_VERSION-1+cuda9.0 \
    && apt-mark hold \
    libcudnn7=$CUDNN_VERSION-1+cuda9.0 \
    libcudnn7-dev=$CUDNN_VERSION-1+cuda9.0
 
# Install CUPTI (CUDA® Profiling Tools Interface)
sudo apt-get install libcupti-dev

# Environment setup (If you have to run more than once go and clean up ~/.profile)
export PATH=/usr/local/cuda-9.0/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

# Install TensorFlow with GPU support
pip3 install --upgrade tensorflow-gpu

