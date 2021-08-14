#!/usr/bin/env bash

set -e
set -o pipefail
[[ -n $DEBUG ]] && set -x

CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# shellcheck disable=SC1090
source "$CURR_DIR/common.sh"

SCRIPTNAME=$(basename "$0")
echo "$SCRIPTNAME"

skaffold config set --global local-cluster true
#skaffold config set --global default-repo k3d-registry.localhost:5000/skaffold

skaffold version

skaffold run -p local

#curl -sL http://k3d-registry.localhost:5000/v2/_catalog
