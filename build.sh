#!/usr/bin/env bash
# build.sh - Compila el uploader standalone y genera CyboltDFIR-Uploader-v<VERSION>.zip
#
# Uso:
#   ./build.sh                    # usa version leida de VERSION.txt
#   ./build.sh 5.3.1              # fuerza version
#
# Output:
#   dist/CyboltDFIR-Uploader-v<VERSION>.zip
#
# Este proyecto es self-contained: solo compila DFIR_UPLOADER_UI.exe y
# empaqueta. NO incluye kape.zip, Targets/, ni el wizard de triage.
# Para el bundle completo, ver Beacon-Lab-IR/cybolt-dfir-iso.

set -euo pipefail

if [ $# -eq 1 ]; then
    VERSION="$1"
else
    VERSION=$(grep -oE 'v5\.[0-9]+\.[0-9]+' VERSION.txt | head -1 | sed 's/^v//')
    if [ -z "$VERSION" ]; then
        echo "ERROR: no se pudo detectar la version de VERSION.txt"
        echo "Pasala como argumento: $0 5.3.1"
        exit 1
    fi
fi

echo "==================================================================="
echo "  Building CyboltDFIR Uploader v$VERSION"
echo "==================================================================="

# Helper: human-readable size
human_size() {
    local bytes=$1
    if [ -z "$bytes" ] || [ "$bytes" = "0" ]; then echo "0B"
    elif [ "$bytes" -lt 1024 ]; then echo "${bytes}B"
    elif [ "$bytes" -lt 1048576 ]; then echo "$(echo "scale=2; $bytes/1024" | bc)KB"
    else echo "$(echo "scale=2; $bytes/1048576" | bc)MiB"
    fi
}

# 1) Compilar la GUI
echo ">>> [1/2] Compilando DFIR_UPLOADER_UI..."
/Users/rbnetto/.dotnet/dotnet build DfirUploaderUi/DfirUploaderUi.csproj -c Release --nologo 2>&1 | tail -5
mkdir -p staging
cp DfirUploaderUi/bin/Release/DFIR_UPLOADER_UI.exe staging/

# 2) Empaquetar ZIP
echo ">>> [2/2] Empaquetando ZIP..."
cp VERSION.txt staging/
cp LICENSE    staging/

mkdir -p dist
UPLOADER_ZIP="$(pwd)/dist/CyboltDFIR-Uploader-v$VERSION.zip"
rm -f "$UPLOADER_ZIP"
( cd staging && zip -qr "$UPLOADER_ZIP" . -x "*.DS_Store" "*/.DS_Store" )
UPLOADER_SIZE=$(stat -f%z "$UPLOADER_ZIP" 2>/dev/null || stat -c%s "$UPLOADER_ZIP")
UPLOADER_SHA=$( (sha256sum "$UPLOADER_ZIP" 2>/dev/null || shasum -a 256 "$UPLOADER_ZIP") | awk '{print $1}')

cat <<EOF

===================================================================
  BUILD OK: CyboltDFIR Uploader v$VERSION
===================================================================

  File : dist/CyboltDFIR-Uploader-v$VERSION.zip
  Size : $UPLOADER_SIZE bytes ($(echo "scale=2; $UPLOADER_SIZE/1024" | bc) KiB)
  SHA  : $UPLOADER_SHA

  Crea el GitHub Release:
    gh release create v$VERSION \\
      dist/CyboltDFIR-Uploader-v$VERSION.zip \\
      --repo Beacon-Lab-IR/cybolt-dfir-uploader \\
      --title "CyboltDFIR Uploader v$VERSION" \\
      --notes-file RELEASE-NOTES.md
EOF
