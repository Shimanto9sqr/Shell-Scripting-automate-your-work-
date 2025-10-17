#!/bin/bash

echo -n "How old file in days: "
read DAYS

# Check if input is a number
if ! [[ "$DAYS" =~ ^[0-9]+$ ]]; then
  echo "Error: Please enter a valid number."
  exit 1
fi

# Current date in seconds
current=$(date +%s)

# Seconds to compare
seconds_old=$(( DAYS * 24 * 60 * 60 ))

# Loop through files
for file in *; do
  if [ -f "$file" ]; then
    file_time=$(date +%s -r "$file")
    age=$(( current - file_time ))

    if [ $age -gt $seconds_old ]; then
      rm "$file"
      echo "Deleted: $file"
    fi
  fi
done
