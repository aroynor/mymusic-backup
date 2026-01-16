#!/bin/bash
SOURCE_DIR="/mymusic"
BACKUP_DIR="/usbbak3/mymusic"
LOG_FILE="/var/log/mymusic-backup.log"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Log start
echo "$(date): Starting mymusic backup..." >> "$LOG_FILE"

# Sync files from source to backup using rsync
# Skip permissions/ownership for external drives
rsync -avh --no-perms --no-owner --no-group "$SOURCE_DIR/" "$BACKUP_DIR/" >> "$LOG_FILE" 2>&1

# Check if rsync was successful
if [ $? -eq 0 ]; then
    echo "$(date): Backup completed successfully" >> "$LOG_FILE"
else
    echo "$(date): Backup failed with errors" >> "$LOG_FILE"
fi

echo "---" >> "$LOG_FILE"
