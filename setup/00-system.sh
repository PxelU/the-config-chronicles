#!/bin/sh
set -e

echo "[setup] Updating system packages..."
sudo apt update
sudo apt upgrade -y

