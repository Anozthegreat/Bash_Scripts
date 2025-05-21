#!/bin/bash

# Define paths
SOURCE_DIR="the source directory here"
DEST_DIR="the destination directory here"

# Informative messages
echo -e "\e[1mTorrent Migration Script\e[0m"
echo "Source directory: $SOURCE_DIR"
echo "Destination directory: $DEST_DIR"
echo "---------------------------------"

# Directory checks
if [ ! -d "$SOURCE_DIR" ] || [ ! -d "$DEST_DIR" ]; then
  echo "One of the directories doesn't exist. Exiting..."
  exit 1
fi

# Enable nullglob to handle no match cases
shopt -s nullglob
files=( "$SOURCE_DIR"/*.torrent )

# Check for files
file_count=${#files[@]}
if ((file_count == 0)); then
  echo "➖ Found 0 files to move."
else
  echo "➤ Found $file_count .torrent files:"
  echo "(${files[*]})" # Show found files
  for file in "${files[@]}"; do
    if mv -- "$file" "$DEST_DIR"; then
      echo "$file → transferred successfully"
    else
      echo "$file → move failed"
    fi
  done
  echo "Migration complete"
fi

echo "---------------------------------"
#echo "Check files at destination: $DEST_DIR"
