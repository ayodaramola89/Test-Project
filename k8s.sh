#!/bin/bash
# Common stages for both master and worker nodes
# This can be used as user data as launch template/configuration

sudo hostname master
sudo swapoff -a
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

sudo apt update -y
sudo apt install -y apt-transport-https -y

sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -y

sudo cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main

EOF
sudo apt update -y
sudo apt install -y kubelet kubeadm containerd kubectl

sudo apt-mark hold kubelet kubeadm containerd kubectl

sudo cat <<EOF | sudo tee /etc/modules-load.d/containerd.conf
overlay
br_netfilter
EOF

sudo modprobe overlay
sudo modprobe br_netfilter

sudo <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf
net.bridge.bridge-nf-call-iptables = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward = 1
EOF

sudo sysctl --system

sudo mkdir -p /etc/containerd
sudo containerd config default | sudo tee /etc/containerd/config.toml
sudo systemctl restart containerd

sudo systemctl daemon-reload
sudo systemctl start kubelet
sudo systemctl enable kubelet.service

# =====common commands ends here======

# ===In the master node=====

sudo kubeadm init 











