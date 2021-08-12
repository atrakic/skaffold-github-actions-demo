#!/bin/bash

PATH=/usr/local/bin:$PATH
export PATH

CMD=k3d
command -v $CMD >/dev/null 2>&1 || ( curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash; )

CMD=skaffold
command -v $CMD >/dev/null 2>&1 || ( curl -sSL -o /usr/local/bin/$CMD \
  https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64  \
  && chmod +x /usr/local/bin/$CMD; )

#CMD=kustomize
#command -v $CMD >/dev/null 2>&1 || curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash

CLUSTER_NAME=${CLUSTER_NAME:-skaffold-demo}
export CLUSTER_NAME

