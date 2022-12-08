#!/bin/bash
firewall-cmd --add-port=5000/tcp --zone=internal --permanent
firewall-cmd --add-port=5000/tcp --zone=public --permanent
firewall-cmd --reload
