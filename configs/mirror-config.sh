#!/bin/bash
# Mirror Sync Configuration
# Source this in scripts that need mirroring

MIRROR_REPO="$HOME/instaweb-mirror"
MIRROR_REMOTE="origin"
MIRROR_BRANCH="agency-os"
MIRROR_URL="https://github.com/dbcsec/Instaweb2.0.git"

# Directory mapping
DATA_LEADS="$MIRROR_REPO/data/leads"
DATA_ENRICHED="$MIRROR_REPO/data/enriched"
DATA_DEMOS="$MIRROR_REPO/data/demos"
TEMPLATES_MODERN="$MIRROR_REPO/templates/modern-trade"
TEMPLATES_ELEGANT="$MIRROR_REPO/templates/elegant-food"
SCRIPTS_DIR="$MIRROR_REPO/scripts"
CONFIGS_DIR="$MIRROR_REPO/configs"
DOCS_DIR="$MIRROR_REPO/docs"