#!/usr/bin/env bash
#
# toggle_hdr.sh
# Temporarily swaps "adobe" -> "hdr" in hyprland.lua, saves,
# then swaps it back to "adobe" and saves again.
#
# Usage:
#   ./toggle_hdr.sh /path/to/hyprland.lua
#   ./toggle_hdr.sh /path/to/hyprland.lua 2   # optional: seconds to wait between swaps (default 1)

set -euo pipefail

FILE="${1:-}"
DELAY="${2:-1}"

if [[ -z "$FILE" ]]; then
    echo "Usage: $0 /path/to/hyprland.lua [delay_seconds]"
    exit 1
fi

if [[ ! -f "$FILE" ]]; then
    echo "Error: file not found: $FILE"
    exit 1
fi

# Make a backup just in case
cp "$FILE" "${FILE}.bak"
echo "Backup saved to ${FILE}.bak"

# 1. Replace adobe -> hdr and save
sed -i 's/adobe/hdr/g' "$FILE"
echo "Replaced 'adobe' with 'hdr' in $FILE"

# Optional: reload hyprland config here if desired, e.g.:
# hyprctl reload

sleep "$DELAY"

# 2. Replace hdr -> adobe and save (revert)
sed -i 's/hdr/adobe/g' "$FILE"
echo "Reverted 'hdr' back to 'adobe' in $FILE"

echo "Done."
