#!/usr/bin/env bash

set -e

# ------------------------
# Logging function (must come first)
# ------------------------
LOG_DIR="$HOME/mongo-logs"
mkdir -p "$LOG_DIR"

log() {
  echo "[$(date)] $1" >> "$LOG_DIR/backup.log"
}

# ------------------------
# Variables
# ------------------------
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_DIR="$HOME/mongo-backups"
mkdir -p "$BACKUP_DIR"

# ------------------------
# Backup
# ------------------------
BACKUP_FILE="$BACKUP_DIR/mongo_backup_$DATE.txt"
echo "Backup taken at $DATE" > "$BACKUP_FILE"
log "Backup created: $BACKUP_FILE"

# ------------------------
# Verification
# ------------------------
if [ ! -s "$BACKUP_FILE" ]; then
  log "ERROR: Backup verification failed for $BACKUP_FILE"
  exit 1
fi

# ------------------------
# Retention policy (delete backups older than 7 days)
# ------------------------
RETENTION_DAYS=7

find "$BACKUP_DIR" -type f -mtime +$RETENTION_DAYS -print -delete | while read -r file; do
  log "Deleted old backup: $file"
done

log "Backup verification passed for $BACKUP_FILE"

# ------------------------
# Completion
# ------------------------
echo "Backup completed successfully at $DATE"

