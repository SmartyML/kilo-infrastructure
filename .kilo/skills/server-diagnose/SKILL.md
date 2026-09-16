---
name: server-diagnose
description: Bei Serverstörungen, Dienstfehlern, Erreichbarkeits- oder Performanceproblemen laden. Führt eine zunächst rein lesende Diagnose durch und trennt Befunde, Hypothesen und Reparaturvorschläge.
---

# Serverdiagnose

Diese Anleitung legt fest, wie Störungen auf Servern untersucht werden. Sie ergänzt `docs/SERVER.md` und die dort referenzierten Host-Steckbriefe.

## Grundregeln

- Diagnose ist von Reparatur getrennt.
- Diese Phase ist ausschließlich lesend. Keine Neustarts, keine Updates, keine Konfigurationsänderungen, keine Bereinigungen, keine Restores.
- Befunde, Vermutungen und ungeprüfte Aussagen werden ausdrücklich unterschieden.
- Nicht wahllos Standardbefehle abarbeiten; die nächste Prüfung aus den bisherigen Befunden ableiten.
- Abfragen zeitlich und mengenmäßig begrenzen, um Logausgaben nicht zu sprengen.

## A. Ziel und Umfang bestätigen

1. Aktuellen Host feststellen: `hostname`
2. Passenden Steckbrief lesen: `docs/servers/<host>.md`. Existiert keine passende Datei, das Fehlen melden und aktuelle Fakten lesend erheben; keinen fremden Steckbrief übernehmen und in der Diagnose keine Datei oder Verzeichnisse anlegen. Für spätere beauftragte schreibende Aufgaben gelten die Anlageregeln aus `AGENTS.md` und die Grundstruktur aus `docs/SERVER.md`.
3. Betroffenen Dienst, Symptom und Störungszeitraum bestimmen.
4. Zeitzone des Systems prüfen (`timedatectl`) und Zeitangaben darauf beziehen.
5. Bei unklarem Zielhost oder unklarem Symptom vor jeder weiteren Aktion nachfragen.

Steckbriefe sind Orientierung, kein Ersatz für aktuelle Prüfungen.

## B. Belege sammeln

Zielgerichtet prüfen, passend zum Symptom:

- Dienststatus und fehlgeschlagene Units: `systemctl status <dienst>`, `systemctl --failed`
- Logs im betroffenen Zeitraum: `journalctl -u <dienst> --since ... --until ... --no-pager`
- Ressourcen nur soweit relevant: `free -h`, `df -h`, `df -i`, `uptime`
- Erreichbarkeit und Bindung: `ss -lntup`, gezielte Verbindungsprüfung
- Abhängigkeiten in Kette betrachten: Client → Proxy → Anwendung → Datenbank/Externdienst
- Letzte Änderungen: `docs/CHANGELOG.md`, Deployment-Informationen, Paket-Historie (`/var/log/apt/history.log`), Dateiänderungszeiten
- Container- und Virtualisierungsgrenzen beachten: Ressourcenlimits des Hosts sind von innen nicht immer sichtbar

Für jeden Befund notieren: Quelle, Zeitpunkt, was genau beobachtet wurde.

## C. Hypothesen testen

Für jede relevante Hypothese festhalten:

```text
Hypothese:
Dafür sprechende Belege:
Dagegen sprechende Belege:
Nächste möglichst risikoarme Prüfung:
Ergebnis:
```

Zeitliche Zusammenhänge sind keine Beweisführung für Kausalität. Mehrere gleich wahrscheinliche Ursachen offen benennen.

## D. Diagnose abschließen

Ausgabe in dieser Struktur:

```text
Zielserver und betroffener Dienst:
Symptom und Zeitraum:
Bestätigte Befunde:
Wahrscheinliche Ursache und Unsicherheit:
Offene Punkte:
Kleinster sinnvoller Reparaturvorschlag:
Risiko und Rückweg:
Validierung nach einer Reparatur:
```

Vor riskanten oder destruktiven Änderungen zusätzlich den Skill `backup-docs` laden und vorhandene Sicherungs- oder Wiederherstellungsmöglichkeit prüfen. Ist keine ausreichende Sicherung belegt, die Änderung nicht ausführen, sondern den Nutzer informieren.

## E. Reparatur und Nachprüfung

- Eine Reparatur erfolgt nur, wenn sie ausdrücklich beauftragt wurde.
- Kleinste passende Änderung wählen, Risiko und Rückweg vorher benennen.
- Nach der Reparatur den ursprünglichen Fehlerfall erneut prüfen, nicht nur den Dienststatus.
- Dauerhafte Änderungen mit den Skills `changelog-docs`, `commands-docs` und `backup-docs` dokumentieren; betroffenen Server-Steckbriefe bei relevanten Änderungen aktualisieren.

## Grenzen dieser Anleitung

Ein Skill ist eine Arbeitsanweisung, keine technische Rechtebegrenzung. Eine technisch erzwungene Read-only-Umgebung erfordert zusätzliche Berechtigungsmaßnahmen außerhalb dieses Skills.
