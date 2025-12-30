#!/usr/bin/env bash
set -e

# ------------------------
# Logging (defined first)
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
RETENTION_DAYS=7

mkdir -p "$BACKUP_DIR"

# ------------------------
# MongoDB Backup
# ------------------------
BACKUP_PATH="$BACKUP_DIR/mongo_backup_$DATE"

mongodump \
  --host localhost \
  --port 27017 \
  --out "$BACKUP_PATH"

log "MongoDB backup completed at $BACKUP_PATH"


# ------------------------
# Verification
# ------------------------
if [ ! -d "$BACKUP_PATH" ] || [ -z "$(ls -A "$BACKUP_PATH")" ]; then
  log "ERROR: MongoDB backup verification failed at $BACKUP_PATH"
  exit 1
fi

log "MongoDB backup verification passed for $BACKUP_PATH"


# ------------------------
# Retention Policy
# ------------------------
find "$BACKUP_DIR" -type f -mtime +$RETENTION_DAYS -print -delete | while read -r file; do
  log "Deleted old backup: $file"
done

# ------------------------
# Completion
# ------------------------
echo "Backup completed successfully at $DATE"



