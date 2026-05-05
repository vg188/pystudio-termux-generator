#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

PKG="${1:-termux-flutter-wsl}"
ABIS="${2:-arm,aarch64,i686,x86_64}"

for ABI in $(echo "$ABIS" | tr ',' ' '); do
  case "$ABI" in
    arm|aarch64|i686|x86_64) ;;
    *)
      echo "Unsupported ABI: $ABI"
      exit 1
      ;;
  esac
  ./scripts/run-docker.sh ./build-package.sh -a "$ABI" "$PKG"
done
