# kilo-infrastructure

Zentrales Repository für die Infrastruktur- und Kilo-Konfiguration des Proxmox-Neuaufbaus.

## Struktur

- `kilo/` – gemeinsame Kilo-Konfiguration, Agents, Skills, Prompts und Regeln
- `hosts/` – hostspezifische Zuordnungen und Konfiguration
- `scripts/` – Installation, Synchronisation und Verteilung
- `docs/` – technische Repository-Dokumentation

## Git-Ablauf

Änderungen werden über die Teststrecke geprüft:

test -> Prüfung auf kilo-test -> main -> produktive Verteilung

## Sicherheit

Secrets, API-Keys, Tokens, Passwörter und private SSH-Schlüssel gehören nicht in dieses Repository.
