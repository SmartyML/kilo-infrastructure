# kilo-infrastructure

Zentrale Quelle für die gemeinsame Server- und Kilo-Konfiguration.

Der Inhalt von `root-admin/` wird auf Zielsystemen nach `/root/admin/` ausgerollt.

Workflow:

test -> Prüfung auf kilo-test -> main -> produktive Verteilung

Secrets, Passwörter, Tokens, API-Keys und private Schlüssel werden nicht in Git gespeichert.
