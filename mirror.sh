#!/bin/bash
export SCRIPT_DIR="$(dirname ${BASH_SOURCE[0]})"
source $SCRIPT_DIR/vars.env

mkdir -p $MIRROR
for IMAGE in $(find $MIRROR -mindepth 1 -maxdepth 1 -type d -exec basename {} \;); do
    skopeo sync --src dir --dest docker $MIRROR/$IMAGE $HOSTNAME:5000/
done
