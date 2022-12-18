#!/bin/bash
set -e
export SCRIPT_DIR="$(dirname ${BASH_SOURCE[0]})"
source $SCRIPT_DIR/vars.env

podman load < $BOOTSTRAP/registry.tar

podman pod create --name $POD -p 5000:5000
podman run --pod registry --name registry01 \
-v $ROOT/data:/var/lib/registry:z \
-v $ROOT/auth:/auth:z \
-e "REGISTRY_AUTH=htpasswd" \
-e "REGISTRY_AUTH_HTPASSWD_REALM=Registry Realm" \
-e REGISTRY_AUTH_HTPASSWD_PATH=/auth/htpasswd \
-v $ROOT/certs:/certs:z \
-e "REGISTRY_HTTP_TLS_CERTIFICATE=/certs/$FQDN.crt" \
-e "REGISTRY_HTTP_TLS_KEY=/certs/$FQDN.key" \
-e REGISTRY_COMPATIBILITY_SCHEMA1_ENABLED=true \
-d \
docker.io/library/registry:latest
