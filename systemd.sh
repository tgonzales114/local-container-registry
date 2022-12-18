#!/bin/bash
export SCRIPT_DIR="$(dirname ${BASH_SOURCE[0]})"
source $SCRIPT_DIR/vars.env

mkdir -p ~/.config/systemd/user
cd ~/.config/systemd/user
podman generate systemd --new --files --name $POD
cd
systemctl --user daemon-reload
systemctl --user start pod-$POD.service
systemctl --user --no-pager status pod-$POD.service
