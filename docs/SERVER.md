# Server-Steckbriefe

Dieses Verzeichnis enthält kurze Steckbriefe der Server, auf denen `/root/admin` eingesetzt wird.

`/root/admin` wird über ein gemeinsames Git-Repository verteilt. Ein Steckbrief beschreibt deshalb **immer nur einen Host**. Vor jeder serverbezogenen Änderung:

1. Aktuellen Host feststellen: `hostname`
2. Passende Datei `docs/servers/<host>.md` lesen
3. Ist keine Datei vorhanden, Steckbrief nicht auf einen anderen Host übertragen; Annahmen als offen kennzeichnen

Steckbriefe sind Orientierung, kein Ersatz für aktuelle Systemprüfungen. Veränderliche Angaben (Versionen, Ports, Dienstzustand) vor Änderungen am System bestätigen.

## Fehlende Steckbriefe

Bei einer beauftragten Bestandsaufnahme oder einer schreibenden administrativen Aufgabe `docs/servers/` und den passenden Steckbrief selbstständig anlegen, wenn sie fehlen. Aktuellen Host bestätigen und Fakten gezielt lesend erheben. Vorhandene Dateien zuerst lesen und erhalten. In rein lesenden Aufgaben nur das Fehlen melden und keine Dateien anlegen. Fehlende Schreibrechte als Blocker melden.

Keine lokale Hostliste in dieser gemeinsamen Anleitung pflegen. Pro Host diese Grundstruktur verwenden; unbekannte Angaben ausdrücklich als offen kennzeichnen:

```markdown
# Server-Steckbrief: <host>

## Identität und Gültigkeit
- Host: <bestätigter Hostname>
- Rolle und Umgebung: <belegt oder offen>
- Zuletzt geprüft: <Datum>
- Informationsquellen: <tatsächliche Prüfungen>

## Betriebssystem und Laufzeit

## Relevante Dienste und Pfade

## Netzwerk und Erreichbarkeit

## Betrieb und Validierung

## Sicherung und Wiederherstellung
Siehe /root/admin/docs/BACKUP.md; Nachweisstatus ausdrücklich angeben.

## Offene Punkte
```

## Pflege

- Steckbrief bei relevanten dauerhaften Änderungen aktualisieren, insbesondere bei neuen oder entfernten Diensten, geänderten Pfaden oder neuen Abhängigkeiten.
- Nur belegte Informationen aufnehmen, ermittelbar durch lesende Prüfungen.
- Keine Passwörter, Tokens, API-Keys oder privaten Schlüssel dokumentieren.
- Vollständige Inventuren vermeiden: dokumentieren, was für Wartung und Diagnose tatsächlich benötigt wird.
