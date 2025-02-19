#!/bin/bash
# Backup and Recovery Automation
# This script creates a compressed backup of specified data and (optionally) uploads it to a remote location.

# Configuration
BACKUP_SRC="/path/to/data"         # Directory or file to backup
BACKUP_DEST="/path/to/backup"        # Local backup destination
DATE=$(date +'%Y-%m-%d_%H-%M-%S')
BACKUP_FILE="${BACKUP_DEST}/backup_${DATE}.tar.gz"

# Ensure backup destination exists
mkdir -p "$BACKUP_DEST"

# Create the backup archive
echo "Creating backup archive..."
tar -czf "$BACKUP_FILE" "$BACKUP_SRC"

if [ $? -eq 0 ]; then
    echo "Backup created successfully: $BACKUP_FILE"
else
    echo "Backup failed."
    exit 1
fi

# Optional: Upload the backup to a remote server (uncomment and customize the following lines)
# REMOTE_USER="user"
# REMOTE_HOST="remote.server.com"
# REMOTE_DIR="/remote/backup/directory"
# echo "Uploading backup to remote server..."
# rsync -avz "$BACKUP_FILE" "${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_DIR}"

echo "Backup process completed."
