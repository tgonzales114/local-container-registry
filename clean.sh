#!/bin/bash

# include vars from environment file
export SCRIPT_DIR="$(dirname ${BASH_SOURCE[0]})"
source $SCRIPT_DIR/vars.env

# stop and disable service, which will stop and remove the pod
systemctl --user disable --now pod-$POD.service

# stop and remove all containers
podman container stop --all
echo y | podman container prune
echo

# remove all pods
podman pod rm $POD
echo y | podman pod prune
echo

# remove all other podman state
echo y | podman system reset
echo

# remove filesystem data from pod
shopt -s extglob
sudo -E rm -rf $ROOT/

# reload user specific systemd daemon due to file removals
systemctl --user daemon-reload
