#!/usr/bin/env bash

set -e

BACKUP_DIR="$HOME/mongo-backups"
RESTORE_DIR="$HOME/mongo-restores"
LOG_DIR="$HOME/mongo-logs"

mkdir -p "$RESTORE_DIR"
mkdir -p "$LOG_DIR"

log() {
  echo "[$(date)] $1" >> "$LOG_DIR/backup.log"
}

LATEST_BACKUP=$(ls -t "$BACKUP_DIR" | head -n 1 || true)

if [ -z "$LATEST_BACKUP" ]; then
  log "ERROR: No backups found to restore"
  exit 1
fi

cp "$BACKUP_DIR/$LATEST_BACKUP" "$RESTORE_DIR/restore_$LATEST_BACKUP"

log "Restore completed: $LATEST_BACKUP"

echo "Restore successful: $LATEST_BACKUP"
