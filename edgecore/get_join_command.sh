#!/usr/bin/env bash
# Prints the command to run on the edge node. Run it with the workload cluster kubeconfig.
set -euo pipefail

NAMESPACE="${NAMESPACE:-kubeedge}"
SCRIPTS_REF="${SCRIPTS_REF:-main}"

image=$(kubectl -n "$NAMESPACE" get deploy cloudcore -o jsonpath='{.spec.template.spec.containers[0].image}')
ip=$(kubectl -n "$NAMESPACE" get svc cloudcore -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
dns=$(kubectl -n kube-system get svc coredns kube-dns --ignore-not-found -o jsonpath='{.items[0].spec.clusterIP}')
# cloudcore always writes the token to the kubeedge namespace
token=$(kubectl -n kubeedge get secret tokensecret -o jsonpath='{.data.tokendata}' | base64 -d)

echo "curl -sfL https://raw.githubusercontent.com/giantswarm/kubeedge-cloudcore-app/${SCRIPTS_REF}/edgecore/edgecore_join.sh | sudo env CLOUDCORE_IP=${ip} CLOUDCORE_VERSION=${image##*:} CLUSTER_DNS=${dns} CLOUDCORE_JOIN_TOKEN=${token} bash"
