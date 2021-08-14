#!/usr/bin/env bash

set -e
set -o pipefail
set -x

CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# shellcheck disable=SC1090
source "$CURR_DIR/common.sh"

SCRIPTNAME=$(basename "$0")
echo "$SCRIPTNAME"

exit 0

pwd
ls -la

skaffold version

rm -rf ~/.skaffold/config

#profile=local
skaffold config set --global collect-metrics false
skaffold config set --global local-cluster true
#skaffold config set --global default-repo k3d-registry.localhost:5000/skaffold
#skaffold run -p $profile

#k3d kubeconfig get "$CLUSTER_NAME" > _config
skaffold run --kubeconfig=_config --kube-context=k3d-"$CLUSTER_NAME" --verbosity='debug'

#curl -sL http://k3d-registry.localhost:5000/v2/_catalog
