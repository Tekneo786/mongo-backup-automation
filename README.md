#  Mongo Backup Automation (Bash Project)


This project simulates an automated backup and restore workflow — built as part of my DevOps learning journey.
It uses Bash scripting to create dummy backups, log actions, and verify restore functionality.

---

##  Project Structure

mongo-backup-practice/
├── scripts/
│ ├── backup.sh # Creates timestamped backups and logs each event
│ └── restore.sh # Restores the most recent backup into verify directory
├── backups/ # Stores created backup files
├── verify/ # Holds restored files for verification
└── logs/
└── backup.log # Log of all backup and restore actions

 *Created by Hamid Haider (Tekneo786)*
 **DevOps Learner | Cloud Enthusiast | Automation Advocate**


---

## How to Use

```bash
# Make scripts executable
chmod +x scripts/backup.sh scripts/restore.sh

# Run a new backup
./scripts/backup.sh

# Restore the most recent backup
./scripts/restore.sh
