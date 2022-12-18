#!/bin/bash
echo "checking if firewalld is running..."
if systemctl -q is-active firewalld; then
    echo "firewalld is running, opening port 5000"
    firewall-cmd --add-port=5000/tcp --zone=internal --permanent
    firewall-cmd --add-port=5000/tcp --zone=public --permanent
    firewall-cmd --reload
else
    echo "firewalld is not running, quiting"
    exit 1
fi
