#!/usr/bin/env bash

set -e
set -o pipefail

CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# shellcheck disable=SC1090
source "$CURR_DIR/common.sh"

SCRIPTNAME=$(basename "$0")
echo "$SCRIPTNAME"

# enable dns resolution
#sudo apt install -y libnss-myhostname

# Create CI registry
k3d registry create registry.localhost --no-help --port 5000

k3d cluster create "$CLUSTER_NAME" -s 1 -a 1 \
  --wait \
  --timeout 60s \
  --port 8080:80@loadbalancer \
  --port 8443:443@loadbalancer \
  --k3s-server-arg "--no-deploy=metrics-server" \
  \
  --registry-use k3d-registry.localhost:5000 \
  --registry-config registries-local.yaml

kubectl config use-context k3d-"$CLUSTER_NAME"
kubectl cluster-info

k3d registry ls

k3d cluster list

k3d node list

docker ps -a | grep rancher

netstat -tlpn

kubectl get nodes -o wide

# docker exec k3d-"$CLUSTER_NAME"-server-0 sh -c 'ctr version'
# docker exec k3d-"$CLUSTER_NAME"-agent-1 sh -c 'ctr image list -q | grep "busybox:latest"'
