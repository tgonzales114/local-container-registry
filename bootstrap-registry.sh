#!/bin/bash
export SCRIPT_DIR="$(dirname ${BASH_SOURCE[0]})"
source $SCRIPT_DIR/vars.env

mkdir -p $BOOTSTRAP
#skopeo sync --src docker --dest dir docker.io/library/registry:latest /opt/registry/bootstrap/
podman pull docker.io/library/registry:latest
podman save -o $BOOTSTRAP/registry.tar --format oci-archive  docker.io/library/registry:latest
