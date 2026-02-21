#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="$SCRIPT_DIR/demo/bin/windows"
DST="$SCRIPT_DIR/../MY-PLC-Open-Industry-Project/addons/oip_comms/bin/windows"

echo "Building..."
cd "$SCRIPT_DIR"
scons platform=windows debug_symbols=yes

echo "Build successful. Copying DLL..."
mkdir -p "$DST"
cp "$SRC"/*.dll "$DST/"
echo "Done. Files copied to $DST"
