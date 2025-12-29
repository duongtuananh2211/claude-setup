#!/bin/bash
# Helper script to analyze current git changes and suggest commit type

set -e

echo "=== Git Status ==="
git status --short

echo -e "\n=== File Type Analysis ==="
# List changed files with types
git diff --name-only --cached 2>/dev/null | while read file; do
    echo "[STAGED] $file"
done

git diff --name-only 2>/dev/null | while read file; do
    echo "[UNSTAGED] $file"
done

echo -e "\n=== Line Changes Summary ==="
# Show line changes
git diff --stat 2>/dev/null || true
git diff --stat --cached 2>/dev/null || true

echo -e "\n=== Recent Commit Style ==="
echo "Recent commit messages for style reference:"
git log --oneline -5 2>/dev/null || echo "No recent commits"
