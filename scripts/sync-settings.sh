#!/bin/bash
# Sync script to copy project settings to Claude's local settings

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
SOURCE_FILE="$PROJECT_ROOT/.claude-settings.json"
TARGET_DIR="$PROJECT_ROOT/.claude"
TARGET_FILE="$TARGET_DIR/settings.local.json"

# Check if source file exists
if [ ! -f "$SOURCE_FILE" ]; then
    echo "Error: Settings file not found at $SOURCE_FILE"
    exit 1
fi

# Create .claude directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Copy the file
cp "$SOURCE_FILE" "$TARGET_FILE"

echo "Settings synced successfully!"
echo "Source: $SOURCE_FILE"
echo "Target: $TARGET_FILE"
