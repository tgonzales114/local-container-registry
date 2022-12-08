#!/bin/bash
export SCRIPT_DIR="${BASH_SOURCE[0]}"
source $SCRIPT_DIR/vars.env

curl https://$FQDN:5000/v2/_catalog
