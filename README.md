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

---

## How to Use

```bash
# Make scripts executable
chmod +x scripts/backup.sh scripts/restore.sh

# Run a new backup
./scripts/backup.sh

# Restore the most recent backup
./scripts/restore.sh

---

## 🕒 Version 2 – Cron Automation Update

In this update, I integrated **cron scheduling** to make the backup process fully automated.  
Now the scripts run automatically at **9 AM, 1 PM, and 8 PM** every day.  
Each run:
- Creates a new backup file  
- Immediately restores it for verification  
- Logs all actions to `logs/cron.log`

his upgrade turns the project from a manual Bash script into a real **DevOps-style automation workflow**, simulating how production systems handle regular data backups and integrity checks.

---

 *Created by Hamid Haider (Tekneo786)*  
 **DevOps Learner | Cloud Enthusiast | Automation Advocate**
