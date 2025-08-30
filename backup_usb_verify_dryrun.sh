#!/bin/bash
set -e

USB_MOUNT="/media/weem/A47E1FA77E1F71721"
SRC_BUNDLE="$HOME/ColapsoNeuronal/ready_to_sell_bundle_20250821_131717.tar.gz"
DEST_DIR="$USB_MOUNT/CN_Essentials_Backup"
DEST_BUNDLE="$DEST_DIR/ready_to_sell_bundle_20250821_131717.tar.gz"

echo "1. Verificando espacio libre en USB..."
df -h "$USB_MOUNT"

LIBRE_KB=$(df --output=avail "$USB_MOUNT" | tail -1)
LIBRE_GB=$((LIBRE_KB / 1024 / 1024))
MIN_GB=2

if (( LIBRE_GB < MIN_GB )); then
  echo "❌ ERROR: No hay suficiente espacio libre en el USB. Solo ${LIBRE_GB}GB libres."
  exit 1
fi

echo "2. Simulando creación de carpeta destino: $DEST_DIR"
echo "mkdir -p \"$DEST_DIR\"  # Simulado"

echo "3. Simulando copia del bundle con rsync..."
echo "rsync -avqh --progress \"$SRC_BUNDLE\" \"$DEST_DIR/\"  # Simulado"

echo "4. Verificando tamaño del archivo original:"
ls -lh "$SRC_BUNDLE"

echo "5. Calculando checksum sha256 del archivo original..."
ORIG_HASH=$(sha256sum "$SRC_BUNDLE" | awk '{print $1}')
echo "Checksum original: $ORIG_HASH"

echo "6. Simulando cálculo checksum archivo destino (no existe aún)..."
echo "COPIED_HASH = N/A (simulado)"

echo "⚠️ Dry run completo: no se copiaron archivos ni se crearon directorios."
exit 0
