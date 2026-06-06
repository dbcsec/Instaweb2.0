#!/bin/bash
# Instaweb 2.0 — Automated Mirror Sync Script
# Run this after creating/updating any file in the repo
# Usage: bash scripts/mirror-sync.sh [commit-message]

set -e

REPO_DIR="$HOME/instaweb-mirror"
cd "$REPO_DIR" || { echo "ERROR: Cannot cd to $REPO_DIR"; exit 1; }

# Check for changes
if git diff --quiet && git diff --cached --quiet; then
    # No staged changes; check for unstaged
    if [ -z "$(git status --porcelain)" ]; then
        echo "[MIRROR] No changes to sync."
        exit 0
    fi
fi

# Use provided message or auto-generate
if [ -n "$1" ]; then
    COMMIT_MSG="$1"
else
    # Auto-generate from changed files
    CHANGED=$(git status --porcelain | head -5)
    COMMIT_MSG="[mirror] Auto-sync $(date '+%Y-%m-%d %H:%M UTC')"
fi

echo "[MIRROR] Syncing changes to GitHub..."
git add -A

# Only commit if there's something to commit
if git diff --cached --quiet; then
    echo "[MIRROR] No changes to commit."
    exit 0
fi

git commit -m "$COMMIT_MSG"
git push origin agency-os

echo "[MIRROR] Sync complete: $(date)"