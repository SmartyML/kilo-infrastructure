# Server-Regeln

Arbeitsverzeichnis: `/root/admin`

## Grundregeln

- Änderungen einfach, robust und nachvollziehbar umsetzen.
- Nur notwendige Pakete, Dienste und Abhängigkeiten installieren.
- Bestehenden Zustand vor Änderungen prüfen.
- Vor riskanten oder destruktiven Änderungen Konfiguration sichern oder Rückfrage stellen.
- Nach Änderungen Funktion und relevante Dienste testen.
- Keine Passwörter, Tokens, API-Keys oder privaten Schlüssel speichern oder dokumentieren.

## Geschützte Basis

Diese Dateien dürfen nur auf ausdrücklichen Auftrag geändert werden:

- `/root/admin/AGENTS.md`
- `/root/admin/README.md`
- `/root/admin/.kilo/kilo.jsonc`
- `/root/admin/.vscode/`

## Dokumentation

Nach relevanten Änderungen selbstständig pflegen:

- `CHANGELOG.md`: dauerhafte Änderungen am Server, an Diensten, Paketen und Konfigurationen.
- `COMMANDS.md`: relevante tatsächlich ausgeführte Befehle für Wartung, Diagnose, Deployment und Wiederherstellung.
- `BACKUP.md`: bei neuen oder geänderten Diensten/Daten Sicherungs- und Wiederherstellungsweg ergänzen.

Nur tatsächliche Änderungen und Befehle dokumentieren. Keine trivialen Diagnosebefehle protokollieren.

## Ablage

- Eigene Admin-Skripte: `/root/admin/scripts/`
- Konfigurationskopien und Exporte: `/root/admin/config/`
- Anwendungen: eigene Unterverzeichnisse unter `/root/admin/`
- Anwendungsspezifische Dokumentation innerhalb des jeweiligen Projekts.

## Abschluss einer Aufgabe

Eine Aufgabe ist erst abgeschlossen, wenn:

1. die gewünschte Funktion umgesetzt ist,
2. relevante Tests erfolgreich sind,
3. `CHANGELOG.md` und `COMMANDS.md` bei Bedarf aktualisiert wurden,
4. geprüft wurde, ob `BACKUP.md` angepasst werden muss.