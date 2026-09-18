#!/bin/bash
set -e

ADMIN_DIR="/root/admin"
DOCS_DIR="$ADMIN_DIR/docs"

cd "$ADMIN_DIR"

mkdir -p "$DOCS_DIR"

[ -f "$DOCS_DIR/SERVER.md" ] || cat > "$DOCS_DIR/SERVER.md" <<'EOF'
# Server

Serverlokale technische Dokumentation.

EOF

[ -f "$DOCS_DIR/BACKUP.md" ] || cat > "$DOCS_DIR/BACKUP.md" <<'EOF'
# Backup

Serverlokale Sicherungs- und Wiederherstellungsdokumentation.

EOF

[ -f "$DOCS_DIR/CHANGELOG.md" ] || cat > "$DOCS_DIR/CHANGELOG.md" <<'EOF'
# Changelog

Serverlokale Dokumentation dauerhafter Änderungen.

EOF

[ -f "$DOCS_DIR/COMMANDS.md" ] || cat > "$DOCS_DIR/COMMANDS.md" <<'EOF'
# Commands

Serverlokale Befehle für Wartung, Diagnose und Wiederherstellung.

EOF

echo "Serverinitialisierung abgeschlossen."