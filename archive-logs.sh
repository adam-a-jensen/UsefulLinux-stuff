#!/bin/bash

# Check if a target archive directory is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 /path/to/archive"
  exit 1
fi

# Define the log directory
LOG_DIR="/var/log"

# Define the archive directory from the first argument
ARCHIVE_DIR="$1"

# Create the archive directory if it doesn't exist
mkdir -p "$ARCHIVE_DIR"

# Get the current date and time
DATE=$(date +"%Y-%m-%d_%H-%M-%S")

# Archive the logs
tar -czf "$ARCHIVE_DIR/logs_$DATE.tar.gz" -C "$LOG_DIR" .

# Output a message indicating the logs have been archived
echo "Logs from $LOG_DIR have been archived to $ARCHIVE_DIR/logs_$DATE.tar.gz"
