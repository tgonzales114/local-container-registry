# local-container-registry
Tools to self-host a simple container registry

### configure
make any customizations in the `vars.env` file

### procedures

```bash
# install dependencies
sudo ./install-deps.sh

# open port in firewalld
sudo ./firewall.sh

# re-configure system hostname (optional)
sudo ./hostname.sh

# create directories and certificate
sudo ./setup.sh

# save registry image tar locally
./bootstrap-registry.sh

# mirror images to a local directory
./bootstrap-mirror.sh

# load local registry image tar and run pod for registry
./start.sh

# test connection
./curl.sh

# login to local registry
./login.sh

# turn local registry into a systemd service
./systemd.sh

# load locally mirrored images to local registry
./mirror.sh

# remove existing data
./clean.sh
```
