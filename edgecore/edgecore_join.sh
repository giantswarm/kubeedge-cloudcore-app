#!/usr/bin/env bash
set -e

# Join the edge node to the KubeEdge cluster using keadm
keadm join \
  --cloudcore-ipport=$CLOUDCORE_IP:10000 \
  --token=$CLOUDCORE_JOIN_TOKEN \
  --kubeedge-version=$CLOUDCORE_VERSION

# Download script to configure Cilium for KubeEdge
wget https://raw.githubusercontent.com/kubeedge/kubeedge/master/hack/configure_cilium.sh

# Run script to fix Cilium configuration for KubeEdge node
chmod +x configure_cilium.sh
./configure_cilium.sh edgecore