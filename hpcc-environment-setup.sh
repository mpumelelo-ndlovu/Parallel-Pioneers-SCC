#!/bin/bash

# Install required packages
sudo apt-get update
sudo apt-get install -y \
    g++ \
    gcc \
    make \
    cmake \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libxml2-dev \
    libxslt1-dev \
    libicu-dev \
    python3 \
    python3-dev \
    python3-pip

# Install ECL bundle
# Replace with the actual download link
wget https://hpccsystems.com/download/free-community-edition/latest/hpcc-systems-platform-community-edition-8.0.10-linux-x86_64.tar.gz
tar -xzf hpcc-systems-platform-community-edition-8.0.10-linux-x86_64.tar.gz
cd hpcc-systems-platform-community-edition-8.0.10-linux-x86_64

# Install ECL
./install.sh

# Set environment variables
export HPCC_HOME=/path/to/hpcc-systems-platform-community-edition-8.0.10-linux-x86_64
export PATH=$HPCC_HOME/bin:$PATH
export LD_LIBRARY_PATH=$HPCC_HOME/lib:$LD_LIBRARY_PATH

# Optionally, install additional Python packages
pip3 install pandas pyarrow

echo "HPCC environment setup complete."
