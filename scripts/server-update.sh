#!/bin/bash
# Update des Servers mit kilo code Git Repository im Admin-Verzeichnis.
set -euo pipefail

ADMIN_DIR="/root/admin"
BRANCH="main"

echo "=== Server-Update: $(hostname) ==="

if [ ! -d "$ADMIN_DIR/.git" ]; then
    echo "FEHLER: $ADMIN_DIR ist kein Git-Repository."
    exit 1
fi

cd "$ADMIN_DIR"

# Lokale Änderungen an Git-Dateien schützen.
if [ -n "$(git status --porcelain --untracked-files=no)" ]; then
    echo "FEHLER: Lokal geänderte Git-Dateien vorhanden."
    git status --short
    exit 1
fi

echo "Hole aktuellen Git-Stand ..."

git fetch origin "$BRANCH"
git switch "$BRANCH"
git pull --ff-only origin "$BRANCH"

echo
echo "Aktueller Stand:"
git log -1 --oneline

echo
echo "Server-Update abgeschlossen."