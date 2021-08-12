#!/usr/bin/env bash

set -e
set -o pipefail

CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# shellcheck disable=SC1090
source "$CURR_DIR/common.sh"

SCRIPTNAME=$(basename "$0")
echo "$SCRIPTNAME"

docker images
kubectl get all -o wide

#APP=pyjokes-app
#export POD=$(kubectl get pods --no-headers -o custom-columns=":metadata.name" -l "app=$APP")
#kubectl exec -it "$POD" -- printenv
#kubectl run --rm curl-test --image radial/busyboxplus:curl -i --restart Never -- sh -c "curl -sSL $APP"
