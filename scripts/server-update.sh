#!/bin/bash
set -euo pipefail

REPO="/root/admin"

cd "$REPO"

if [ ! -d ".git" ]; then
    echo "FEHLER: $REPO ist kein Git-Repository."
    exit 1
fi

BRANCH="$(git branch --show-current)"
REMOTE="origin"

if [ -z "$BRANCH" ]; then
    echo "FEHLER: Detached HEAD. Kein aktiver Branch."
    exit 1
fi

REMOTE_URL="$(git remote get-url "$REMOTE")"
OLD_COMMIT="$(git rev-parse --short HEAD)"

echo "========================================"
echo " SERVER-UPDATE"
echo "========================================"
echo
echo "Host:       $(hostname)"
echo "Repository: $REMOTE_URL"
echo "Branch:     $BRANCH"
echo "Stand:      $OLD_COMMIT"
echo

echo "Lokale Abweichungen vor dem Update:"
git status --short || true

echo
echo "Lade $REMOTE/$BRANCH neu ..."

# Lokale Änderungen an getrackten Dateien verwerfen
git reset --hard HEAD

# Ungetrackte Dateien/Verzeichnisse entfernen.
# Ignorierte Dateien wie .local bleiben erhalten.
git clean -fd

# Aktuellen Remote-Stand holen
git fetch "$REMOTE" "$BRANCH"

# Server exakt auf Remote-Stand setzen
git reset --hard "$REMOTE/$BRANCH"

NEW_COMMIT="$(git rev-parse --short HEAD)"

echo
echo "========================================"
echo " UPDATE ABGESCHLOSSEN"
echo "========================================"
echo
echo "Host:       $(hostname)"
echo "Repository: $REMOTE_URL"
echo "Branch:     $BRANCH"
echo "Vorher:     $OLD_COMMIT"
echo "Jetzt:      $NEW_COMMIT"
echo
git status --short --branch