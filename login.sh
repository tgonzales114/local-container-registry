#!/bin/bash
export SCRIPT_DIR="$(dirname ${BASH_SOURCE[0]})"
source $SCRIPT_DIR/vars.env

podman login $FQDN:5000
