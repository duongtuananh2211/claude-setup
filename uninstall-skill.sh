#!/bin/bash
# Script to uninstall a skill from Claude Code
# Usage: ./uninstall-skill.sh <skill-name>

set -e

SKILLS_DIR="$HOME/.claude/skills"

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check if skill name provided
if [ -z "$1" ]; then
    echo -e "${RED}Error: No skill name provided${NC}"
    echo "Usage: $0 <skill-name>"
    echo ""
    echo "Installed skills:"
    find "$SKILLS_DIR" -maxdepth 1 -type d ! -name "$SKILLS_DIR" -exec basename {} \; 2>/dev/null || echo "No skills installed"
    exit 1
fi

SKILL_NAME="$1"
SKILL_DIR="$SKILLS_DIR/$SKILL_NAME"

# Check if skill is installed
if [ ! -d "$SKILL_DIR" ]; then
    echo -e "${RED}Error: Skill '$SKILL_NAME' is not installed${NC}"
    echo "Installed skills:"
    find "$SKILLS_DIR" -maxdepth 1 -type d ! -name "$SKILLS_DIR" -exec basename {} \; 2>/dev/null || echo "No skills installed"
    exit 1
fi

# Remove skill
echo -e "${BLUE}Uninstalling '$SKILL_NAME' skill...${NC}"
rm -rf "$SKILL_DIR"

echo -e "${GREEN}Skill '$SKILL_NAME' uninstalled successfully!${NC}"
echo ""
echo -e "${GREEN}Restart Claude Code to apply changes${NC}"
