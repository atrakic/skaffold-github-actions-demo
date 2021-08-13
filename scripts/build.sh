#!/usr/bin/env bash

set -e
set -o pipefail

CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# shellcheck disable=SC1090
source "$CURR_DIR/common.sh"

SCRIPTNAME=$(basename "$0")
echo "$SCRIPTNAME"

#skaffold config set --global local-cluster true
skaffold config set --global default-repo localhost:5000/skaffold

skaffold version

skaffold run #--tail