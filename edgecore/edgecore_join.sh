#!/usr/bin/env bash
set -euo pipefail

: "${CLOUDCORE_IP:?}" "${CLOUDCORE_VERSION:?}" "${CLOUDCORE_JOIN_TOKEN:?}" "${CLUSTER_DNS:?}"

[ "$EUID" -eq 0 ] || { echo "Run as root."; exit 1; }

case "$(uname -m)" in
  x86_64) CPU_ARCH=amd64 ;;
  aarch64) CPU_ARCH=arm64 ;;
  *) echo "Unsupported architecture: $(uname -m)"; exit 1 ;;
esac

# keadm must have the same version as cloudcore
cd "$(mktemp -d)"
curl -sfL "https://github.com/kubeedge/kubeedge/releases/download/${CLOUDCORE_VERSION}/keadm-${CLOUDCORE_VERSION}-linux-${CPU_ARCH}.tar.gz" | tar xz
install -m 755 "keadm-${CLOUDCORE_VERSION}-linux-${CPU_ARCH}/keadm/keadm" /usr/local/bin/keadm

# metaServer and edgeStream are necessary for Cilium and for kubectl logs/exec.
keadm join \
  --cloudcore-ipport="${CLOUDCORE_IP}:10000" \
  --token="${CLOUDCORE_JOIN_TOKEN}" \
  --kubeedge-version="${CLOUDCORE_VERSION}" \
  --cgroupdriver=systemd \
  --set modules.metaManager.metaServer.enable=true \
  --set modules.edgeStream.enable=true \
  --set "modules.edged.tailoredKubeletConfig.clusterDNS={${CLUSTER_DNS}}"
