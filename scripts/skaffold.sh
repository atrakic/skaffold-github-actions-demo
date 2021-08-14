#!/usr/bin/env bash

set -e
set -o pipefail
[[ -n $DEBUG ]] && set -x

CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# shellcheck disable=SC1090
source "$CURR_DIR/common.sh"

SCRIPTNAME=$(basename "$0")
echo "$SCRIPTNAME"

skaffold version
rm -rf ~/.skaffold/config

skaffold config set --global collect-metrics false
skaffold config set --global local-cluster true
skaffold run --verbosity='debug'
