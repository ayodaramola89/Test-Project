#!/bin/bash
# The following commands is used in installing the helm package on Ubuntu
sudo apt install curl -y
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 777 get_helm.sh
sh get_helm.sh