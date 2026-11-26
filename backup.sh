#!/usr/bin/env bash
set -euo pipefail

SOURCE_DIR="$1"
PARENT_DIR="$(dirname "$SOURCE_DIR")"
BACKUP_DIR="$PARENT_DIR/backups"
TIMESTAMP=$(date +"%Y-%m-%d-%H-%M-%S")
FILENAME="backup_${TIMESTAMP}.tar.gz"

mkdir -p "$BACKUP_DIR"
tar -czf "$BACKUP_DIR/$FILENAME" "$SOURCE_DIR"

echo "Backup saved: $BACKUP_DIR/$FILENAME"
