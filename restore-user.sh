#!/usr/bin/env bash
# Emergency User & System Restoration Script
# Usage: sudo ./restore-user.sh [hostname]

set -e

HOST="${1:-centari}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "==> [1/3] Building NixOS top-level system derivation for host: ${HOST}..."
nix build "${SCRIPT_DIR}#nixosConfigurations.${HOST}.config.system.build.toplevel" -o "${SCRIPT_DIR}/result"

echo "==> [2/3] Activating NixOS system configuration..."
if [ -x "${SCRIPT_DIR}/result/bin/switch-to-configuration" ]; then
  sudo "${SCRIPT_DIR}/result/bin/switch-to-configuration" switch
else
  sudo nixos-rebuild switch --flake "${SCRIPT_DIR}#${HOST}"
fi

echo "==> [3/3] Setting password for hudsonb to 'nixos'..."
echo -e "nixos\nnixos" | sudo passwd hudsonb

echo ""
echo "=========================================================="
echo " SUCCESS: User account 'hudsonb' restored!"
echo " Initial password set to: nixos"
echo " Run 'passwd' after logging in to set your custom password."
echo "=========================================================="
