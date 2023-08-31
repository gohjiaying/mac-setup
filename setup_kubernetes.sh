#!/bin/sh

# Requirement: 
# 1. mac_setup.sh to run first
# 2. make file executable by chmod u+x <filename>


# Install docker
<<comment
Tutorial: https://www.cprime.com/resources/blog/docker-for-mac-with-homebrew-a-step-by-step-tutorial
Learnt that: Homebrew Cask is to install GUI tools..
comment
# Install docker
if ! command -v docker >/dev/null; then
    echo "Installing docker..."
    brew install --cask docker
else
    echo "docker installed"
fi


# Install minikube
# https://minikube.sigs.k8s.io/docs/start/
if ! command -v minkube >/dev/null; then
    echo "Installing minikube..."
    brew install minikube
else
    echo "minkube installed"
fi
