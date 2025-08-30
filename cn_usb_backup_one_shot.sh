#!/bin/bash
set -e

# Configuración
USB_MOUNT="/media/weem/A47E1FA77E1F71721"
SRC_BUNDLE="$HOME/ColapsoNeuronal/ready_to_sell_bundle_20250821_131717.tar.gz"
DEST_DIR="$USB_MOUNT/CN_Essentials_Backup"
MIN_SPACE_GB=2

echo "🔧 CN USB Backup One-Shot"
echo "========================="

# Verificaciones iniciales
if ! mountpoint -q "$USB_MOUNT"; then
    echo "❌ USB no montado en $USB_MOUNT"
    exit 1
fi

if [ ! -f "$SRC_BUNDLE" ]; then
    echo "❌ Bundle no encontrado: $SRC_BUNDLE"
    exit 1
fi

# Limpieza automática de backups antiguos
echo "🗑️  Limpiando backups duplicados..."
OLD_BACKUPS=(
    "$USB_MOUNT/backup/ready_to_sell_bundle_20250821_125140.tar.gz"
    "$USB_MOUNT/ColapsoNeuronal/Workspace/app/ready_to_sell_bundle_20250821_125140.tar.gz"
    "$USB_MOUNT/ColapsoNeuronal/Current/ready_to_sell_bundle_20250821_125140.tar.gz"
)

for backup in "${OLD_BACKUPS[@]}"; do
    if [ -f "$backup" ]; then
        echo "Eliminando: $(basename "$backup")"
        rm -f "$backup"
    fi
done

# Crear directorio destino
mkdir -p "$DEST_DIR"

# Copia con verificación
echo "📦 Copiando bundle..."
rsync -avh --progress "$SRC_BUNDLE" "$DEST_DIR/"

# Verificación de integridad
echo "🔍 Verificando checksum..."
ORIG_HASH=$(sha256sum "$SRC_BUNDLE" | awk '{print $1}')
COPY_HASH=$(sha256sum "$DEST_DIR/$(basename "$SRC_BUNDLE")" | awk '{print $1}')

if [ "$ORIG_HASH" = "$COPY_HASH" ]; then
    echo "✅ ✅ CHECKSUM COINCIDEN - Backup válido"
    echo "📊 Espacio disponible:"
    df -h "$USB_MOUNT" | grep -v tmpfs
else
    echo "❌ ❌ ERROR: Checksums no coinciden"
    echo "Original: $ORIG_HASH"
    echo "Copia:    $COPY_HASH"
    exit 1
fi
