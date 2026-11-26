#!/usr/bin/env bash
set -euo pipefail

LOG_DIR="${1:-/var/log}" # use $1 if provided, else default to /var.log
DAYS="${2:-30}"          # use $1 if provided, else default to 30

# Fin files and store in array 
mapfile -t FILES < <(find "$LOG_DIR" -name "*.log" -mtime +"$DAYS")

if [ ${#FILES[@]} -eq 0 ]; then
    echo "No files found."
    exit 0
fi

# Show numbered list
echo "Files to delete:"
for i in "${!FILES[@]}"; do
    echo "  [$i] ${FILES[$i]}"
done

echo ""
read -p "Enter numbers to DELETE (space-separated), 'a' for all, 'q' to quit: " INPUT

if [[ "$INPUT" == "q" ]]; then
    echo "Cancelled."
    exit 0
fi

if [[ "$INPUT" == "a" ]]; then
    DELETE_LIST=("${!FILES[@]}")
else
    read -ra DELETE_LIST <<< "$INPUT"
fi

# Delete selected files
for i in "${DELETE_LIST[@]}"; do
    rm "${FILES[$i]}"
    echo "Deleted: ${FILES[$i]}"
done


