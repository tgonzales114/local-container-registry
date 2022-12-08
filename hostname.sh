#!/bin/bash
export SCRIPT_DIR="${BASH_SOURCE[0]}"
source $SCRIPT_DIR/vars.env

nmcli general hostname $FQDN
hostnamectl set-hostname $FQDN
echo "127.0.0.1 $FQDN" >> /etc/hosts
