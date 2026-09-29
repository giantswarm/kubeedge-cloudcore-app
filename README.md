[![CircleCI](https://dl.circleci.com/status-badge/img/gh/giantswarm/kubeedge-cloudcore-app/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/giantswarm/kubeedge-cloudcore-app/tree/main)

[Guide about how to manage an app on Giant Swarm](https://handbook.giantswarm.io/docs/dev-and-releng/app-developer-processes/adding_app_to_appcatalog/)

# kubeedge-cloudcore chart

## Configuring

The following applies when `.cni.cilium.enabled: true` is set in `values.yaml`. This is the default value.

In order to schedule Cilium agent pods correctly, we need to stop them from running on KubeEdge nodes. A separate DaemonSet will be created automatically for any edge nodes. To do this, add the following to the Cilium chart's values:

### values.yaml

Note that the `podAntiAffinity` is taken from the [cilium-app](https://github.com/giantswarm/cilium-app/blob/main/helm/cilium/values.yaml) values - this is to ensure it doesn't get overwritten.

```yaml
affinity:
  podAntiAffinity:
    requiredDuringSchedulingIgnoredDuringExecution:
      - topologyKey: kubernetes.io/hostname
        labelSelector:
          matchLabels:
            k8s-app: cilium
  nodeAffinity:
    requiredDuringSchedulingIgnoredDuringExecution:
      nodeSelectorTerms:
        - matchExpressions:
          - key: node-role.kubernetes.io/edge
            operator: DoesNotExist

```

## Updating

> [!WARNING]
> DO NOT merge Renovate PRs without following the instructions below.
>
> Failure to do so will not update the chart itself.

### Renovate updates

1. Check out the PR created by Renovate.
2. Run `sync/sync.sh` which will retrieve the upstream chart, customize it for Giant Swarm, and update the chart files.

### Manual updates

1. Update the `tag` field in [`vendir.yml`](vendir.yml) to the desired upstream version.
2. Run `sync/sync.sh` which will retrieve the upstream chart, customize it for Giant Swarm, and update the chart files.

## Connecting an edge node

Note that `keadm` can change across versions and cilium support _matures_ over time. So it is best to check this procedure against upstream release notes when deploying a new version.

### Edge node prerequisites setup

SSH into the edge node and run the script to install the prerequisites. Change the value of `$CPU_ARCH` and tool versions if necessary.

Run this on the edge node:

```sh
./edgecore/edgecore_prerequisites.sh
```

### Get the cloudcore address and token

The chart creates:

- `cloudcore` Service of type `LoadBalancer` in the release namespace. The edge node must be able to reach its external IP on ports `10000` (cloudhub) and `10002` (certificates).
- Join token and keeps it in the Secret `tokensecret` in the `kubeedge` namespace. The token has the CA hash and a signed token. Cloudcore replaces the token every 12 hours (`cloudHub.tokenRefreshDuration`), so get a new token immediately before you join a node. The token is necessary only for the join. After the join, the node uses its certificate.

Run this with the kubeconfig of the cluster where cloudcore runs:

```sh
IFS=":" read -r image tag <<< "$(kubectl get pod -n kubeedge -o jsonpath='{.items[0].spec.containers[0].image}' -l kubeedge=cloudcore)"
CLOUDCORE_VERSION=$tag
CLOUDCORE_IP=$(kubectl get svc cloudcore -o jsonpath='{.status.loadBalancer.ingress[0].ip}' -n kubeedge)
CLOUDCORE_JOIN_TOKEN=$(kubectl -n kubeedge get secret tokensecret -o jsonpath='{.data.tokendata}' | base64 -d)
```

### Join the node

Run this on the edge node:

```sh
export CLOUDCORE_VERSION=<$CLOUDCORE_VERSION from previous run>
export CLOUDCORE_IP=<$CLOUDCORE_IP from previous run>
export CLOUDCORE_JOIN_TOKEN=<$CLOUDCORE_JOIN_TOKEN from previous run>

./edgecore/edgecore_join.sh
```

To make sure that the node is connected, do `kubectl get nodes`. The node has the label `node-role.kubernetes.io/edge`.

## Credit

- https://github.com/kubeedge/kubeedge
