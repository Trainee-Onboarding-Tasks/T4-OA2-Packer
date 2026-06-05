#!/bin/bash
set -e


apt update -y
apt install -y \
    curl \
    git \
    python3-boto3 \
    python3-botocore