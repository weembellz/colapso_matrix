#!/bin/bash
MOUNT_POINT="/media/usb"

# Buscar dispositivo USB automáticamente
DEVICE=$(lsblk -o NAME,MOUNTPOINT | grep -v '/\|NAME' | head -n1 | awk '{print "/dev/"$1"1"}')

if [ -z "$DEVICE" ]; then
    echo "No se encontró dispositivo USB"
    exit 1
fi

if [ ! -d "$MOUNT_POINT" ]; then
    sudo mkdir -p "$MOUNT_POINT"
fi

# Montar con opciones seguras
sudo mount -o uid=1000,gid=1000,umask=022 "$DEVICE" "$MOUNT_POINT"

if [ $? -eq 0 ]; then
    echo "USB montado correctamente en $MOUNT_POINT"
else
    echo "Error al montar el USB"
fi
