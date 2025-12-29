#!/bin/bash
# Script to install or update a skill from this repository to Claude Code
# Usage: ./install-skill.sh <skill-name>

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_SKILLS_DIR="$SCRIPT_DIR/skills"
DEST_SKILLS_DIR="$HOME/.claude/skills"

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Ensure destination directory exists
mkdir -p "$DEST_SKILLS_DIR"

# Check if skill name provided
if [ -z "$1" ]; then
    echo -e "${RED}Error: No skill name provided${NC}"
    echo "Usage: $0 <skill-name>"
    echo ""
    echo "Available skills in repository:"
    find "$SOURCE_SKILLS_DIR" -maxdepth 1 -type d ! -name "$SOURCE_SKILLS_DIR" -exec basename {} \; 2>/dev/null || echo "No skills found"
    exit 1
fi

SKILL_NAME="$1"
SOURCE_DIR="$SOURCE_SKILLS_DIR/$SKILL_NAME"
DEST_DIR="$DEST_SKILLS_DIR/$SKILL_NAME"

# Check if skill exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo -e "${RED}Error: Skill '$SKILL_NAME' not found in $SOURCE_SKILLS_DIR${NC}"
    echo "Available skills:"
    find "$SOURCE_SKILLS_DIR" -maxdepth 1 -type d ! -name "$SOURCE_SKILLS_DIR" -exec basename {} \; 2>/dev/null || echo "No skills found"
    exit 1
fi

# Check if skill has SKILL.md
if [ ! -f "$SOURCE_DIR/SKILL.md" ]; then
    echo -e "${RED}Error: Skill '$SKILL_NAME' does not contain SKILL.md${NC}"
    exit 1
fi

# Copy skill to .claude/skills
echo -e "${BLUE}Installing '$SKILL_NAME' skill...${NC}"

# Remove existing skill if present
if [ -d "$DEST_DIR" ]; then
    echo -e "${BLUE}Removing existing '$SKILL_NAME' skill...${NC}"
    rm -rf "$DEST_DIR"
fi

# Copy skill directory
cp -r "$SOURCE_DIR" "$DEST_DIR"

# Make scripts executable
find "$DEST_DIR/scripts" -type f -exec chmod +x {} \; 2>/dev/null || true

echo -e "${GREEN}Skill '$SKILL_NAME' installed successfully!${NC}"
echo ""
echo "Source: $SOURCE_DIR"
echo "Installed to: $DEST_DIR"
echo ""
echo "Skill structure:"
find "$DEST_DIR" -type f | sed 's|'"$DEST_DIR"'/||' | sort
echo ""
echo -e "${GREEN}Restart Claude Code to load the skill${NC}"
