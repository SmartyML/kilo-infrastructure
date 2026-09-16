---
name: commands-docs
description: Anleitung zum Führen von COMMANDS.md. Laden, wenn während Wartung, Diagnose, Deployment oder Wiederherstellung relevante administrative Befehle benötigt wurden, die später erneut gebraucht werden könnten.
---

# COMMANDS.md pflegen

Diese Anleitung ergänzt die Dokumentationspflicht aus `AGENTS.md`. Sie gilt für `/root/admin/docs/COMMANDS.md`.

## Zweck

`COMMANDS.md` sammelt relevante administrative Befehle, die für Wartung, Diagnose, Deployment oder Wiederherstellung tatsächlich benötigt wurden und später erneut gebraucht werden könnten. Die Befehle sollen direkt ausführbar und ohne Rückfragen verständlich sein.

## Wann laden

Laden, wenn im Rahmen einer Aufgabe ein nicht trivialer, wiederverwendbarer Befehl oder eine Befehlsfolge entstanden oder bestätigt worden ist. Dazu gehören insbesondere:

- Wartung und Betrieb von Diensten (Status, Neustart, Logs, Konfigurationsprüfung)
- Deployment- und Aktualisierungsabläufe
- Wiederherstellungsschritte
- wiederkehrende Diagnosen mit nicht offensichtlicher Befehlsfolge

Nicht laden für einmalige Ad-hoc-Befehle, triviale Standardbefehle oder Befehle, die nur der Erkundung dienten.

## Vorgehen

1. `docs/COMMANDS.md` auf Existenz prüfen und vorhandenen Inhalt zuerst lesen. Fehlt sie bei einem relevanten zu dokumentierenden Betriebsbefehl in einer schreibenden Aufgabe, `docs/` und die Datei selbstständig mit `# Relevante Befehle` sowie dem untenstehenden Eintragsformat anlegen. Bei rein lesenden Aufgaben nur das Fehlen melden; bei fehlenden Schreibrechten einen Blocker melden. Bestehende Inhalte niemals durch eine Vorlage ersetzen.
2. Prüfen, ob der Befehl bereits dokumentiert ist. Wenn ja, den vorhandenen Eintrag aktualisieren statt einen neuen anzulegen.
3. Befehl mit Kontext dokumentieren: Zweck, Voraussetzungen, Arbeitsverzeichnis und benötigte Rechte.
4. Den Befehl so notieren, wie er tatsächlich erfolgreich ausgeführt wurde. Platzhalter deutlich kennzeichnen.
5. Risikobehaftete Befehle mit einem Warnhinweis versehen.

## Format

Solange die Datei kein eigenes Format vorgibt, einen Eintrag pro Befehl oder Ablauf anlegen:

```markdown
## <Kurztitel>

Zweck: <wozu der Befehl dient>
Bereich: <Dienst, Anwendung oder Systembereich>
Voraussetzungen: <Rechte, Arbeitsverzeichnis, laufende Dienste>

```bash
<befehl>
```
```

Für mehrschrittige Abläufe die Schritte durchnummerieren und Zwischenprüfungen als eigenen Schritt aufführen.

## Grenzen

- Nur Befehle dokumentieren, die tatsächlich benötigt und wenn möglich ausgeführt wurden.
- Keine Passwörter, Tokens, API-Keys, privaten Schlüssel oder sonstigen Geheimnisse in Befehlen oder Beispielen hinterlegen. Vertrauliche Werte durch Platzhalter ersetzen.
- Keine trivialen Diagnosebefehle protokollieren.
- Keine Befehle aufnehmen, deren Wirkung nicht verstanden oder geprüft wurde.
- Keine Änderung an `COMMANDS.md` erzwingen, wenn kein relevanter Befehl hinzugekommen ist.
- Keine Änderungen am System allein zum Zweck der Dokumentation ausführen.
