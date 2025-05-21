#!/bin/bash

# Check if two arguments are provided (directory and filename)
if [ $# -ne 2 ]; then
    echo "Usage: $0 <directory> <filename>"
    echo "Example: $0 /path/to/dir file"
    echo "Note: The script will find any file containing 'file' in its name"
    exit 1
fi

# Assign arguments to variables
SEARCH_DIR="$1"
FILE_NAME="$2"

# Echo the search parameters
echo -e "\nSearching for files containing: $FILE_NAME"
echo -e "In directory: $SEARCH_DIR\n"

# Use find command to search for files containing the specified name
FOUND_FILES=$(find "$SEARCH_DIR" -type f -name "*$FILE_NAME*" -print)

# Display the results
echo -e "\nFiles found:"
if [ -z "$FOUND_FILES" ]; then
    echo "No files found containing '$FILE_NAME' in $SEARCH_DIR"
else
    echo "$FOUND_FILES"
    echo -e "\nTotal files found: $(echo "$FOUND_FILES" | wc -l)"
fi

echo -e "\nSearch complete."

# USAGE EXAMPLE : sh find_file.sh /run/media/John/Home/Downloads file
