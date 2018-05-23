#!/bin/bash

## Essentials ##

sudo apt-get update && apt-get install -y \
    git \
    wget \
    curl \
    cmake 
 
 ## Other ##
 
 sudo apt-get update && apt-get install -y \
    libhdf5-dev \
    graphviz \
    qt5-default \
    doxygen \
    caffe-cuda 
