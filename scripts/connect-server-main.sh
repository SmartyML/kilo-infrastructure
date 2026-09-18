#!/bin/bash
#vorhandener /root/admin-Bestand
#→ Git-Inhalt ermitteln
#→ gleichnamige vorhandene Dateien/Ordner nach .local/legacy-before-git verschieben
#→ .local bleibt unangetastet
#→ Git-Zugang einrichten
#→ /root/admin an main anbinden
#→ main auschecken

set -euo pipefail

ADMIN_DIR="/root/admin"
LOCAL_DIR="$ADMIN_DIR/.local"
LEGACY_DIR="$LOCAL_DIR/legacy-before-git"

GIT_HOST="github-kilo-infrastructure"
GIT_REPO="git@github-kilo-infrastructure:SmartyML/kilo-infrastructure.git"
BRANCH="main"

SOURCE_GIT_HOST="${1:-192.168.31.6}"
SOURCE_GIT_KEY="/root/.ssh/kilo_infrastructure_ed25519"
TARGET_GIT_KEY="/root/.ssh/kilo_infrastructure_ed25519"

echo "=== SERVER AN KILO-INFRASTRUCTURE ANBINDEN ==="
echo "Host:       $(hostname)"
echo "Admin:      $ADMIN_DIR"
echo "Branch:     $BRANCH"
echo "Key-Quelle: $SOURCE_GIT_HOST"
echo

mkdir -p "$ADMIN_DIR" "$LEGACY_DIR"
cd "$ADMIN_DIR"

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y git openssh-client rsync

# ------------------------------------------------------------
# 1. Git-Key übernehmen, falls auf diesem Server noch nicht da
# ------------------------------------------------------------

mkdir -p /root/.ssh
chmod 700 /root/.ssh

if [ ! -s "$TARGET_GIT_KEY" ]; then
    echo "Übernehme Git-Key von $SOURCE_GIT_HOST ..."

    scp \
        "root@${SOURCE_GIT_HOST}:${SOURCE_GIT_KEY}" \
        "$TARGET_GIT_KEY"

    chmod 600 "$TARGET_GIT_KEY"
else
    echo "Git-Key bereits vorhanden."
fi

cat > /root/.ssh/config <<EOF
Host $GIT_HOST
    HostName github.com
    User git
    IdentityFile $TARGET_GIT_KEY
    IdentitiesOnly yes
EOF

chmod 600 /root/.ssh/config

touch /root/.ssh/known_hosts
ssh-keygen -F github.com -f /root/.ssh/known_hosts >/dev/null 2>&1 ||
    ssh-keyscan -H github.com >> /root/.ssh/known_hosts

chmod 600 /root/.ssh/known_hosts

# ------------------------------------------------------------
# 2. Temporär main laden, um dessen Pfade zu kennen
# ------------------------------------------------------------

TMP_REPO="$(mktemp -d)"
trap 'rm -rf "$TMP_REPO"' EXIT

git clone \
    --depth 1 \
    --branch "$BRANCH" \
    "$GIT_REPO" \
    "$TMP_REPO"

# ------------------------------------------------------------
# 3. Vorhandene kollidierende Pfade nach .local sichern
# ------------------------------------------------------------

echo
echo "Sichere vorhandene Git-Pfade ..."

while IFS= read -r -d '' ITEM; do
    REL="${ITEM#"$TMP_REPO"/}"

    case "$REL" in
        .git|.git/*|.local|.local/*)
            continue
            ;;
    esac

    # Nur oberste Pfade behandeln.
    TOP="${REL%%/*}"

    if [ -e "$ADMIN_DIR/$TOP" ] &&
       [ ! -e "$LEGACY_DIR/$TOP" ]; then

        echo "  $TOP -> .local/legacy-before-git/"

        mv \
            "$ADMIN_DIR/$TOP" \
            "$LEGACY_DIR/$TOP"
    fi
done < <(find "$TMP_REPO" -mindepth 1 -maxdepth 1 -print0)

# ------------------------------------------------------------
# 4. Bereits vorhandenes Git sauber behandeln
# ------------------------------------------------------------

cd "$ADMIN_DIR"

if [ -d .git ]; then
    echo
    echo "Vorhandenes Git-Repository erkannt."

    git remote remove origin 2>/dev/null || true
else
    git init
fi

git remote add origin "$GIT_REPO"

# ------------------------------------------------------------
# 5. main anbinden
# ------------------------------------------------------------

echo
echo "Binde $BRANCH an ..."

git fetch origin "$BRANCH"
git checkout -B "$BRANCH" "origin/$BRANCH"

# ------------------------------------------------------------
# 6. Abschlussprüfung
# ------------------------------------------------------------

echo
echo "========================================"
echo " SERVER ERFOLGREICH ANGEBUNDEN"
echo "========================================"

echo
echo "Host:"
hostname

echo
echo "Git:"
git status --short --branch

echo
echo "Remote:"
git remote -v

echo
echo "Commit:"
git log -1 --oneline

echo
echo "Gesicherter Altbestand:"
find "$LEGACY_DIR" -mindepth 1 -maxdepth 2 -print 2>/dev/null | sort || true