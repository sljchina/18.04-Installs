#!/bin/bash

# Install pip3
sudo apt-get update && apt-get install -y \
  python3-pip

# Install Packages
pip3 install -r /requirements.txt
