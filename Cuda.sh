#!/bin/bash 

############################################################################################
################################# NVIDIA CUDA Repository: ##################################
######## http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/ ########
############################################################################################


############################################################################################
############################# NVIDIA's Machine Learning Repo: ##############################
## http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/ ##
############################################################################################


           ######################## For More Detail See: ########################           
           ## https://github.com/NVIDIA/DIGITS/blob/master/docs/InstallCuda.md ##     
           

UBUNTU_VERSION=1604
CUDA_VERSION=9.0

CUDA_VERSION_FULL=9-2_9.2.88-1
CUDNN_VERSION=7.1.4.18-1

CUDA_DEB=cuda-${CUDA_VERSION_FULL}_amd64.deb
CUDNN_DEB=libcudnn7_${CUDNN_VERSION}+cuda${CUDA_VERSION}_amd64.deb

CUDA_REPO=https://developer.download.nvidia.com/compute/cuda/repos/ubuntu${UBUNTU_VERSION}/x86_64/
CUDNN_REPO=https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu${UBUNTU_VERSION}/x86_64/

CUDA_PATH={$CUDA_REPO}{$CUDA_DEB}
CUDNN_PATH={$CUDNN_REPO}{$CUDNN_DEB}

echo -e "\n\n ${FULL_PATH} \n\n If Path is correct "

read -p "Press Enter to continue"

wget ${FULL_PATH}


wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_9.2.88-1_amd64.deb
# or 
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-9-2_9.2.88-1_amd64.deb

     
# wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1404/x86_64/libcudnn7_7.1.4.18-1+cuda9.0_amd64.deb



wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libcudnn7_7.1.4.18-1+cuda9.0_amd64.deb


dpkg -i cuda-repo-ubuntu1404_7.5-18_amd64.deb
apt-get update

apt-get install cuda-toolkit





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
