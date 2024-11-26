#!/usr/bin/env bash

# Check input
if [[ $# -eq 0 ]] ; then
	echo 'No config name defined'
	exit 1
fi

# Define variables for directories and files
USER_HOME=$(eval echo ~$SUDO_USER)
SYSTEM1_DIR="$USER_HOME/system1"

# Run nixos-generate-config command
sudo nixos-generate-config --show-hardware-config > "$SYSTEM1_DIR/hosts/$1/hardware-configuration.nix" || { echo "Failed to generate hardware configuration"; exit 1; }

# Navigate to home directory
cd "$USER_HOME" || { echo "Failed to cd to home directory"; exit 1; }

# Navigate back to ~/system1
cd "$SYSTEM1_DIR" || { echo "Failed to cd to $SYSTEM1_DIR"; exit 1; }

# Rebuild NixOS configuration
sudo nixos-rebuild switch --flake .#$1 || { echo "Failed to rebuild NixOS configuration"; exit 1; }

echo "Script completed successfully."
