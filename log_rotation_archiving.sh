#!/bin/bash
# Automated Log Rotation and Archiving
# This script rotates log files by compressing them and moving them to an archive directory.
# It then truncates the original log files.

# Configuration
LOG_DIR="/var/log/myapp"
ARCHIVE_DIR="/var/log/myapp/archive"
DATE=$(date +'%Y-%m-%d_%H-%M-%S')

# Ensure archive directory exists
mkdir -p "$ARCHIVE_DIR"

# Rotate each .log file
for logfile in "$LOG_DIR"/*.log; do
    if [ -f "$logfile" ]; then
        base=$(basename "$logfile" .log)
        archive_file="${ARCHIVE_DIR}/${base}_${DATE}.log.gz"
        # Compress the log file and store in archive directory
        gzip -c "$logfile" > "$archive_file"
        # Truncate the original log file
        > "$logfile"
        echo "Rotated and archived $logfile to $archive_file"
    fi
done
