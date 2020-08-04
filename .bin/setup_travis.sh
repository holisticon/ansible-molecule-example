#!/bin/bash

# See https://github.com/travis-ci/travis-ci/issues/1066
# Fail if one of the commands of this script fails
set -e

# Avoid storage driver issues in docker in docker
# https://github.com/geerlingguy/raspberry-pi-dramble/issues/166
sudo tee /etc/docker/daemon.json << EOF
{
  "experimental": true,
  "storage-driver" : "aufs"
}
EOF
sudo systemctl restart docker

set +e
