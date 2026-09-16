# Kilo Infrastructure

Arbeitsverzeichnis auf Servern: `/root/admin`

## Grundregeln

- Änderungen einfach, robust und nachvollziehbar umsetzen.
- Nur notwendige Pakete, Dienste und Abhängigkeiten installieren.
- Bestehenden Zustand vor Änderungen prüfen.
- Vor riskanten oder destruktiven Änderungen Sicherung oder Wiederherstellungsmöglichkeit prüfen.
- Nach Änderungen Funktion und relevante Dienste testen.
- Keine Passwörter, Tokens, API-Keys oder privaten Schlüssel speichern oder dokumentieren.

## Geschützte Basis

Diese zentral verwalteten Dateien und Bereiche nur ändern, wenn die Aufgabe dies ausdrücklich erfordert:

- `/root/admin/AGENTS.md`
- `/root/admin/kilo.jsonc`
- `/root/admin/.kilo/`
- `/root/admin/scripts/`
- `/root/admin/docs/`

## Dokumentation

Nach relevanten dauerhaften Änderungen prüfen, ob Dokumentation angepasst werden muss.

- `CHANGELOG.md`: dauerhafte Änderungen an Server, Diensten, Paketen und Konfigurationen
- `COMMANDS.md`: relevante tatsächlich benötigte Befehle für Wartung, Diagnose, Deployment und Wiederherstellung
- `BACKUP.md`: Sicherungs- und Wiederherstellungsweg für relevante Dienste und Daten

Nur tatsächliche Änderungen dokumentieren. Keine trivialen Diagnosebefehle protokollieren.

## Ablage

- gemeinsame administrative Skripte: `/root/admin/scripts/`
- zusätzliche Dokumentation: `/root/admin/docs/`
- Kilo Agents: `/root/admin/.kilo/agents/`
- Kilo Skills: `/root/admin/.kilo/skills/`
- anwendungsspezifische Dateien gehören in das jeweilige Anwendungsprojekt

## Abschluss einer Aufgabe

Eine Aufgabe ist abgeschlossen, wenn:

1. die gewünschte Funktion umgesetzt ist,
2. relevante Tests erfolgreich sind,
3. notwendige Dokumentation angepasst wurde,
4. geprüft wurde, ob Sicherung oder Wiederherstellung betroffen ist.