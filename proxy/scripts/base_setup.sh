#!/bin/bash
set -e


apt update -y
apt install -y \
    curl \
    wget \
    tar \
    software-properties-common \
    ca-certificates \
    gnupg \
    lsb-release \
    jq \
    nano