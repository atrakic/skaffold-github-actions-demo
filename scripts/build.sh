#!/usr/bin/env bash

set -e
set -o pipefail

CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# shellcheck disable=SC1090
source "$CURR_DIR/common.sh"

SCRIPTNAME=$(basename "$0")
echo "$SCRIPTNAME"

#k3d image import $APP -c $CLUSTER_NAME --verbose

skaffold config set --kube-context k3d-"$CLUSTER_NAME" local-cluster true 
skaffold run #--tail
