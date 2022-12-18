#!/bin/bash
set -eu
export SCRIPT_DIR="$(dirname ${BASH_SOURCE[0]})"
source $SCRIPT_DIR/vars.env

# directory structure
sudo -E mkdir -p $ROOT/{auth,certs,data}
sudo -E chown -R $OWNER:$OWNER $ROOT/

# authentication
sudo -E htpasswd -bBc $ROOT/auth/htpasswd $REGISTRY_USER $REGISTRY_PASS

# certificate
sudo -E openssl req -newkey rsa:4096 -nodes -sha256 \
    -keyout $KEY \
    -x509 -days 365 \
    -out $CERT \
    -addext "subjectAltName = DNS:$FQDN"

sudo -E chown -R tgonzales:tgonzales $ROOT/

sudo -E cp $CERT /etc/pki/ca-trust/source/anchors
sudo -E update-ca-trust

trust list | grep $FQDN
