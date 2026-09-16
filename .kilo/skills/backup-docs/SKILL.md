---
name: backup-docs
description: Anleitung zum Führen von BACKUP.md. Vor riskanten oder destruktiven Änderungen sowie bei Änderungen an Diensten, Daten oder Speicherorten laden, um Sicherungs- und Wiederherstellungswege zu prüfen und zu dokumentieren.
---

# BACKUP.md pflegen

Diese Anleitung ergänzt die Dokumentationspflicht aus `AGENTS.md`. Sie gilt für `/root/admin/docs/BACKUP.md`.

## Zweck

`BACKUP.md` beschreibt, wie relevante Dienste und Daten gesichert und wiederhergestellt werden. Die Datei muss klar zwischen belegten, geprüften Verfahren und noch offenen Punkten unterscheiden. Ein dokumentiertes Verfahren ist nicht automatisch ein getestetes Verfahren.

## Wann laden

Laden, wenn eine der folgenden Bedingungen zutrifft:

- Vor einer riskanten oder destruktiven Änderung, um die vorhandene Sicherungs- oder Wiederherstellungsmöglichkeit zu prüfen.
- Nach einer Änderung an Diensten, Datenbanken, Volumes, Speicherorten oder an `/root/admin`, die den Sicherungsumfang betrifft.
- Wenn für einen Dienst erstmals ein Sicherungs- oder Wiederherstellungsweg festgelegt wird.

## Vorgehen

1. `docs/BACKUP.md` auf Existenz prüfen und vorhandenen Inhalt zuerst lesen. Fehlt sie bei tatsächlichem Dokumentationsbedarf in einer schreibenden Aufgabe, `docs/` und die Datei selbstständig mit `# Backup und Wiederherstellung` sowie dem untenstehenden Bereichsformat anlegen. Unbekannte Verfahren und ungetestete Wiederherstellung als offen kennzeichnen. Bei rein lesenden Aufgaben nur das Fehlen melden; bei fehlenden Schreibrechten einen Blocker melden. Bestehende Inhalte niemals durch eine Vorlage ersetzen.
2. Den betroffenen Bereich bestimmen: Dienst, Anwendungsdaten, Datenbank, Volume oder Verzeichnis.
3. Erfassen, was tatsächlich bekannt und belegt ist: Sicherungsumfang, Verfahren, Speicherort, Ablauf, Aufbewahrung.
4. Prüfen, ob eine Wiederherstellung bereits getestet wurde. Wenn nicht, dies ausdrücklich als offen kennzeichnen.
5. Ausschließlich den betroffenen Abschnitt ergänzen oder präzisieren. Die Gesamtstruktur der Datei beibehalten.
6. Wenn nicht genügend belegte Informationen vorliegen, die offenen Punkte benennen, statt Verfahren zu erfinden.

## Format

Solange die Datei kein eigenes Format vorgibt, einen Abschnitt pro Dienst oder Datenbereich anlegen:

```markdown
## <Dienst oder Datenbereich>

Sicherungsumfang: <was gesichert wird>
Verfahren: <wie gesichert wird>
Speicherort: <wo die Sicherung liegt>
Aufbewahrung: <wie lange, falls festgelegt>
Wiederherstellung: <Schritte oder Verweis>
Status: <geprüft / ungeprüft / offen>
```

Für die Wiederherstellung die Schritte nachvollziehbar und in der richtigen Reihenfolge notieren.

## Grenzen

- Keine Sicherungen, Wiederherstellungen oder Tests erfinden.
- Nur Verfahren dokumentieren, die belegt sind. Unklare oder offene Punkte klar kennzeichnen.
- Keine Sicherungen, Wiederherstellungen, Installationen oder Dienständerungen allein zum Zweck der Dokumentation ausführen.
- Keine Passwörter, Tokens, API-Keys, privaten Schlüssel oder Zugangsdaten zu Sicherungszielen dokumentieren. Speicherorte ohne Zugangsdaten beschreiben.
- Keine Änderung an `BACKUP.md` erzwingen, wenn kein relevanter Bereich betroffen ist.
- Bei tatsächlicher Gefährdung ohne ausreichende Sicherung die Aufgabe anhalten und den Nutzer informieren, statt die Änderung durchzuführen.
