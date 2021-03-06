#!/usr/bin/env bash

set -e
set -o pipefail
[[ -n $DEBUG ]] && set -x

CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# shellcheck disable=SC1090
source "$CURR_DIR/common.sh"

SCRIPTNAME=$(basename "$0")
echo "$SCRIPTNAME"

k3d cluster create "$CLUSTER_NAME" -c k3d.yaml

kubectl config use-context k3d-"$CLUSTER_NAME"
kubectl cluster-info

k3d registry ls

k3d cluster list

k3d node list

docker ps -a | grep rancher

netstat -tlpn

kubectl get nodes -o wide

docker exec k3d-"$CLUSTER_NAME"-agent-0 sh -c 'ctr version'
#docker exec k3d-"$CLUSTER_NAME"-agent-0 sh -c "nslookup k3d-registry.localhost"
