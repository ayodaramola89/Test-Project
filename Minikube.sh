#!/bin/bash
# The following commands are used in installing the Minikube on an Ubuntu sever
sudo apt update
sudo apt install apt-transport-https  wget -y
sudo apt upgrade
sudo apt install virtualbox virtualbox-ext-pack
sudo wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo chmod 777 minikube-linux-amd64
sudo mv minikube-linux-amd64 /usr/local/bin/minikube
minikube --version

# Install kubectl on Ubuntu
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
sudo chmod 777 ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

# Start minikube
minikube start