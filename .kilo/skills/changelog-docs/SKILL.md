---
name: changelog-docs
description: Anleitung zum Führen von CHANGELOG.md. Laden, nachdem dauerhafte Änderungen an Server, Diensten, Paketen oder Konfigurationen tatsächlich umgesetzt wurden, um sie chronologisch und nachvollziehbar zu protokollieren.
---

# CHANGELOG.md pflegen

Diese Anleitung ergänzt die Dokumentationspflicht aus `AGENTS.md`. Sie gilt für `/root/admin/docs/CHANGELOG.md`.

## Zweck

`CHANGELOG.md` dokumentiert chronologisch, welche dauerhaften Änderungen an diesem Server tatsächlich umgesetzt wurden. Die Datei muss aus sich heraus verständlich bleiben: Wer sie später liest, soll verstehen, was geändert wurde, warum und mit welchem Ergebnis.

## Wann laden

Laden, sobald eine Aufgabe eine dauerhafte Änderung an einem der folgenden Bereiche tatsächlich umgesetzt hat:

- Server- oder Systemkonfiguration
- installierte, entfernte oder aktualisierte Pakete und Dienste
- dauerhafte Konfigurationsdateien, systemd-Units, Timer, Netzwerk- oder Firewall-Regeln
- dauerhafte Änderungen am Verzeichnis `/root/admin` (Skripte, Agents, Skills, Dokumentation)

Nicht laden für reine Diagnosen, Lesevorgänge, fehlgeschlagene Versuche oder geplante, aber noch nicht umgesetzte Änderungen.

## Vorgehen

1. `docs/CHANGELOG.md` auf Existenz prüfen und vorhandenen Inhalt zuerst lesen; Stil und Reihenfolge übernehmen. Fehlt sie nach einer tatsächlich umgesetzten dokumentationspflichtigen Änderung, `docs/` und die Datei selbstständig mit `# Änderungsprotokoll` sowie dem untenstehenden Eintragsformat anlegen. Keine Datei für bloße Vorhaben oder rein lesende Aufgaben erstellen. Fehlende Schreibrechte als Blocker melden; bestehende Inhalte niemals durch eine Vorlage ersetzen.
2. Die tatsächlich durchgeführten Änderungen zusammenstellen: betroffene Dateien, Dienste, Pakete, Konfigurationen.
3. Prüfen, welche Validierung erfolgt ist: Dienststatus, Tests, Neustart, Funktionsprüfung.
4. Einen neuen Eintrag am Ende der Datei ergänzen, chronologisch aufsteigend.
5. Vorhandene Einträge nur korrigieren, wenn sie sachlich falsch sind. Keine Umsortierung ohne Not.

## Format

Solange die Datei kein eigenes Format vorgibt, einen Eintrag pro Vorgang anlegen:

```markdown
## JJJJ-MM-TT

### <Kurztitel der Änderung>

- Bereich: <Server, Dienst, Paket oder Konfiguration>
- Änderung: <was konkret geändert wurde>
- Grund: <warum die Änderung erfolgte>
- Validierung: <wie die Funktion geprüft wurde, z. B. Dienststatus, Test>
```

Bei mehreren Änderungen am selben Tag entweder einen Datumsabschnitt mit mehreren Unterpunkten oder mehrere Einträge mit demselben Datum verwenden. Die bestehende Struktur der Datei ist maßgeblich.

## Grenzen

- Nur tatsächlich umgesetzte und überprüfte Änderungen dokumentieren.
- Keine Absichten, Vermutungen oder unbestätigten Erfolgsmeldungen eintragen.
- Keine trivialen Diagnosebefehle protokollieren.
- Keine Passwörter, Tokens, API-Keys, privaten Schlüssel oder sonstigen Geheimnisse aufnehmen. Auf betroffene Bereiche nur ohne konkrete Werte verweisen.
- Keine Änderung an `CHANGELOG.md` erzwingen, wenn keine dauerhafte Änderung vorliegt.
