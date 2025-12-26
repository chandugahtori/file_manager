#!/bin/bash

WATCH_DIR="$PWD"
REF_FILE="/tmp/ref_date"

read -p "Enter date (YYYY-MM-DD): " INPUT_DATE

# Validate & convert date (macOS compatible)
date -j -f "%Y-%m-%d" "$INPUT_DATE" +"%Y%m%d%H%M.%S" >/tmp/date_check 2>/dev/null

if [ $? -ne 0 ]; then
  echo "❌ Invalid date format. Use YYYY-MM-DD"
  exit 1
fi

# Create reference timestamp file
touch -t "$(date -j -f "%Y-%m-%d" "$INPUT_DATE" +"%Y%m%d%H%M.%S")" "$REF_FILE"

mkdir -p txt jpg log

# Process ONLY files newer than given date
find "$WATCH_DIR" -type f -newer "$REF_FILE" | while read file
do
  case "$file" in
    *.txt) mv "$file" txt/ ;;
    *.jpg) mv "$file" jpg/ ;;
    *.log) mv "$file" log/ ;;
  esac
done

echo "✅ Done. Only new files processed."

