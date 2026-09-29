#!/usr/bin/env bash
set -e

# Configuration & Version Variables
CPU_ARCH="amd64" # Options: amd64, arm64, etc.
CONTAINERD_VERSION="2.4.1"
RUNC_VERSION="1.5.1"
CNI_VERSION="1.9.1"
KEADM_VERSION="1.23.1"
CRICTL_VERSION="v1.32.0" # Keeps alignment with KubeEdge v1.23 (Kubernetes 1.32 compatibility)

# Install containerd
wget "https://github.com/containerd/containerd/releases/download/v${CONTAINERD_VERSION}/containerd-${CONTAINERD_VERSION}-linux-${CPU_ARCH}.tar.gz"
sudo tar Cxzvf /usr/local "containerd-${CONTAINERD_VERSION}-linux-${CPU_ARCH}.tar.gz"

# Switch to systemd cgroups
sudo mkdir -p /etc/containerd
containerd config default | sudo tee /etc/containerd/config.toml > /dev/null
sudo sed -i '/\[plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc.options\]/,/^\s*\[/{s/SystemdCgroup = false/SystemdCgroup = true/}' /etc/containerd/config.toml

# Create systemd unit
wget https://raw.githubusercontent.com/containerd/containerd/main/containerd.service
sudo mv containerd.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable --now containerd

# Install runc
wget "https://github.com/opencontainers/runc/releases/download/v${RUNC_VERSION}/runc.${CPU_ARCH}"
sudo install -m 755 "runc.${CPU_ARCH}" /usr/local/sbin/runc

# Install CNI plugin
wget "https://github.com/containernetworking/plugins/releases/download/v${CNI_VERSION}/cni-plugins-linux-${CPU_ARCH}-v${CNI_VERSION}.tgz"
sudo mkdir -p /opt/cni/bin
sudo tar Cxzvf /opt/cni/bin "cni-plugins-linux-${CPU_ARCH}-v${CNI_VERSION}.tgz"

# Enable cgroup limits (Raspberry Pi/Debian specific - verify with: grep cgroup /proc/cmdline)
if [ -f /boot/firmware/cmdline.txt ]; then
    sudo sed -i '$ s/$/ cgroup_enable=cpuset cgroup_enable=memory cgroup_memory=1 swapaccount=1/' /boot/firmware/cmdline.txt
fi

# Install keadm cli
wget "https://github.com/kubeedge/kubeedge/releases/download/v${KEADM_VERSION}/keadm-v${KEADM_VERSION}-linux-${CPU_ARCH}.tar.gz"
tar -zxvf "keadm-v${KEADM_VERSION}-linux-${CPU_ARCH}.tar.gz"
sudo cp "keadm-v${KEADM_VERSION}-linux-${CPU_ARCH}/keadm/keadm" /usr/local/bin/keadm

# Install crictl client
curl -LO "https://github.com/kubernetes-sigs/cri-tools/releases/download/${CRICTL_VERSION}/crictl-${CRICTL_VERSION}-linux-${CPU_ARCH}.tar.gz"
sudo tar -C /usr/local/bin -xzf "crictl-${CRICTL_VERSION}-linux-${CPU_ARCH}.tar.gz"

sudo tee /etc/crictl.yaml > /dev/null <<EOF
runtime-endpoint: unix:///run/containerd/containerd.sock
image-endpoint: unix:///run/containerd/containerd.sock
timeout: 10
debug: false
EOF