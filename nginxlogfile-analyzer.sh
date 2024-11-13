#!/bin/bash
#Some basic file parsing logic, this one specifically uses NGINX log file as input
echo ""

# Check if a log file is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 /path/to/access.log"
  exit 1
fi

# Define the log file from the first argument
LOG_FILE="$1"

# Top 5 IP addresses with the most requests
echo "Top 5 IP addresses with the most requests:"
grep -oP '(\d{1,3}\.){3}\d{1,3}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | awk '{print $2 " - " $1 " requests"}'
echo ""

# Top 5 most requested paths
echo "Top 5 most requested paths:"
awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | awk '{print $2 " - " $1 " requests"}'
echo ""

# Top 5 response status codes
echo "Top 5 response status codes:"
awk '{print $9}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | awk '{print $2 " - " $1 " requests"}'
echo ""
