#!/bin/bash
# restore.sh — restores the most recent dummy backup

BACKUP_DIR="./backups"
VERIFY_DIR="./verify"
LATEST_BACKUP=$(ls -t "$BACKUP_DIR" | head -n 1)

if [ -z "$LATEST_BACKUP" ]; then
  echo "❌ No backups found in $BACKUP_DIR."
  exit 1
fi

cp "$BACKUP_DIR/$LATEST_BACKUP" "$VERIFY_DIR/restore_${LATEST_BACKUP}"
echo "[$(date)] Restored: $LATEST_BACKUP" >> ./logs/backup.log
echo "✅ Restored $LATEST_BACKUP into $VERIFY_DIR"
