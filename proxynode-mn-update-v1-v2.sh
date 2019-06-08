#!/bin/bash
# Find location of prx-cli scripts
cd "$(dirname "$(find / -type f -name prx-cli_*.sh | head -1)")"
# Stop daemon
bash prx-cli*.sh stop
# Get new prxd and prx-cli
wget https://github.com/ProxyNode/proxynode/releases/download/v2.0.0/Proxynode-Linux-MN-v2.0.0.zip
unzip Proxynode-Linux-MN-v2.0.0.zip
# Set permissions
chmod +x prx*
# Remove prx v1 and replace with v2
sudo rm /usr/local/bin/prx*
sudo mv prx* /usr/local/bin
# Tidy up
rm Proxynode-Linux-MN-v2.0.0.zip

# Relaunch masternode
./prxd*.sh