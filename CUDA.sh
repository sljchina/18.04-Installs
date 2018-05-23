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
sudo apt-get update && install -y \
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

# Install Cudnn-7.0 (CUDA® Deep Neural Network)

CUDNN_VERSION = 7.1.4.18

sudo apt-get install -y --no-install-recommends \
    libcudnn7=$CUDNN_VERSION-1+cuda9.0 \
    libcudnn7-dev=$CUDNN_VERSION-1+cuda9.0
 
# Install CUPTI (CUDA® Profiling Tools Interface)
sudo apt-get install cuda-command-line-tools

# Environment setup
export PATH=/usr/local/cuda-9.0/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH:+${LD_LIBRARY_PATH}:}/usr/local/cuda/extras/CUPTI/lib64

# Install NVIDIA TensorRT 3.0 (optimized inferencing performance)
wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1404/x86_64/nvinfer-runtime-trt-repo-ubuntu1404-3.0.4-ga-cuda9.0_1.0-1_amd64.deb
sudo dpkg -i nvinfer-runtime-trt-repo-ubuntu1404-3.0.4-ga-cuda9.0_1.0-1_amd64.deb
sudo apt-get update && apt-get install -y \
    libnvinfer-dev

# Install TensorFlow with GPU support
pip3 install --upgrade tensorflow-gpu

