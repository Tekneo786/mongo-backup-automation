#!/bin/bash
# backup.sh — creates a dummy backup and ensures folders exist

DATE=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_DIR="./backups"
LOG_DIR="./logs"

# Ensure required folders exist
[ ! -d "$BACKUP_DIR" ] && mkdir -p "$BACKUP_DIR"
[ ! -d "$LOG_DIR" ] && mkdir -p "$LOG_DIR"

# Create dummy backup
echo "Backup taken at $DATE" > "$BACKUP_DIR/mongo_backup_$DATE.txt"

# Log the event
echo "[$(date)] Backup created: mongo_backup_$DATE.txt" >> "$LOG_DIR/backup.log"

echo "✅ Dummy backup created successfully at $DATE"
#!/bin/bash
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_DIR="./backups"
echo "Backup taken at $DATE" > "$BACKUP_DIR/mongo_backup_$DATE.txt"
echo "[$(date)] Backup created: mongo_backup_$DATE.txt" >> ./logs/backup.log
echo "✅ Dummy backup created successfully!"

