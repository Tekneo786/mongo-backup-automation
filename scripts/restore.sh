#!/usr/bin/env bash
set -e

# ------------------------
# Logging
# ------------------------
LOG_DIR="$HOME/mongo-logs"
mkdir -p "$LOG_DIR"

log() {
  echo "[$(date)] $1" >> "$LOG_DIR/backup.log"
}

# ------------------------
# Variables
# ------------------------
BACKUP_DIR="$HOME/mongo-backups"

# ------------------------
# Find latest backup directory
# ------------------------
LATEST_BACKUP=$(ls -td "$BACKUP_DIR"/mongo_backup_* | head -n 1 || true)

if [ -z "$LATEST_BACKUP" ]; then
  log "ERROR: No MongoDB backups found to restore"
  exit 1
fi

# ------------------------
# Verify backup directory
# ------------------------
if [ ! -d "$LATEST_BACKUP" ] || [ -z "$(ls -A "$LATEST_BACKUP")" ]; then
  log "ERROR: Invalid or empty backup directory: $LATEST_BACKUP"
  exit 1
fi

log "Starting MongoDB restore from $LATEST_BACKUP"

# ------------------------
# Restore using mongorestore
# ------------------------
mongorestore \
  --host localhost \
  --port 27017 \
  --drop \
  "$LATEST_BACKUP"

log "MongoDB restore completed successfully from $LATEST_BACKUP"

echo "Restore completed successfully"

