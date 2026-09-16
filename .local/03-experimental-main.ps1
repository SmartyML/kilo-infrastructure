$ErrorActionPreference = "Stop"

Set-Location (Split-Path $PSScriptRoot -Parent)

$Branch = git branch --show-current

if ($Branch -ne "experimental") {
    Write-Host "FEHLER: Aktueller Branch ist '$Branch'."
    Write-Host "Erwartet wird: experimental"
    exit 1
}

if (git status --porcelain) {
    Write-Host "FEHLER: Es gibt noch nicht commitete Änderungen."
    Write-Host "Zuerst 02-experimental-test.ps1 ausführen."
    git status --short
    exit 1
}

git push origin experimental
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

git switch main
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

git pull --ff-only origin main
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

git merge --ff-only experimental
if ($LASTEXITCODE -ne 0) {
    Write-Host "FEHLER: Fast-Forward-Merge nicht möglich."
    exit $LASTEXITCODE
}

git push origin main
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

git branch -d experimental
git push origin --delete experimental

Write-Host ""
Write-Host "=== TESTSERVER WIRD AUF MAIN ZURÜCKGESETZT ==="

ssh root@192.168.31.6 "cd /root/admin && git fetch origin main && git switch -C main FETCH_HEAD && git status --short --branch && git log -1 --oneline"

Write-Host ""
Write-Host "=== EXPERIMENT ERFOLGREICH NACH MAIN ÜBERNOMMEN ==="
git status --short --branch
git log -1 --oneline
