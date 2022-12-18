#!/bin/bash
export SCRIPT_DIR="$(dirname ${BASH_SOURCE[0]})"
source $SCRIPT_DIR/vars.env

mkdir -p $MIRROR
skopeo sync --src docker --dest dir docker.io/$IMAGE $MIRROR
