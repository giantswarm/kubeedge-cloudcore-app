#!/usr/bin/env bash
set -euo pipefail

CONTAINERD_VERSION="2.4.1"
RUNC_VERSION="1.5.1"
CNI_VERSION="1.9.1"
CRICTL_VERSION="1.32.0" # Kubernetes version of KubeEdge v1.23

[ "$EUID" -eq 0 ] || { echo "Run as root."; exit 1; }

case "$(uname -m)" in
  x86_64) CPU_ARCH=amd64 ;;
  aarch64) CPU_ARCH=arm64 ;;
  *) echo "Unsupported architecture: $(uname -m)"; exit 1 ;;
esac

cd "$(mktemp -d)"

# containerd with systemd cgroups
curl -sfLO "https://github.com/containerd/containerd/releases/download/v${CONTAINERD_VERSION}/containerd-${CONTAINERD_VERSION}-linux-${CPU_ARCH}.tar.gz"
tar Cxzf /usr/local "containerd-${CONTAINERD_VERSION}-linux-${CPU_ARCH}.tar.gz"
mkdir -p /etc/containerd
containerd config default | sed 's/SystemdCgroup = false/SystemdCgroup = true/' > /etc/containerd/config.toml
curl -sfL "https://raw.githubusercontent.com/containerd/containerd/v${CONTAINERD_VERSION}/containerd.service" -o /etc/systemd/system/containerd.service
systemctl daemon-reload
systemctl enable --now containerd

# runc
curl -sfLO "https://github.com/opencontainers/runc/releases/download/v${RUNC_VERSION}/runc.${CPU_ARCH}"
install -m 755 "runc.${CPU_ARCH}" /usr/local/sbin/runc

# CNI plugins
curl -sfLO "https://github.com/containernetworking/plugins/releases/download/v${CNI_VERSION}/cni-plugins-linux-${CPU_ARCH}-v${CNI_VERSION}.tgz"
mkdir -p /opt/cni/bin
tar Cxzf /opt/cni/bin "cni-plugins-linux-${CPU_ARCH}-v${CNI_VERSION}.tgz"

# crictl
curl -sfLO "https://github.com/kubernetes-sigs/cri-tools/releases/download/v${CRICTL_VERSION}/crictl-v${CRICTL_VERSION}-linux-${CPU_ARCH}.tar.gz"
tar Cxzf /usr/local/bin "crictl-v${CRICTL_VERSION}-linux-${CPU_ARCH}.tar.gz"
cat > /etc/crictl.yaml <<EOF
runtime-endpoint: unix:///run/containerd/containerd.sock
image-endpoint: unix:///run/containerd/containerd.sock
EOF

# Raspberry Pi: enable memory cgroups (needs a reboot)
if [ -f /boot/firmware/cmdline.txt ] && ! grep -q cgroup_enable=memory /boot/firmware/cmdline.txt; then
  sed -i '$ s/$/ cgroup_enable=cpuset cgroup_enable=memory cgroup_memory=1 swapaccount=1/' /boot/firmware/cmdline.txt
  echo "Updated /boot/firmware/cmdline.txt. Reboot before you join the node."
fi
