$ErrorActionPreference = "Stop"

Set-Location (Split-Path $PSScriptRoot -Parent)

$Branch = git branch --show-current

if ($Branch -eq "experimental") {
    Write-Host "Nicht gespeicherte Experimental-Änderungen werden verworfen..."

    git reset --hard HEAD
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

    git clean -fd
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

    git switch main
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
}

git pull --ff-only origin main
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

if (git branch --list experimental) {
    git branch -D experimental
}

git ls-remote --exit-code --heads origin experimental *> $null
if ($LASTEXITCODE -eq 0) {
    git push origin --delete experimental
}

Write-Host ""
Write-Host "=== TESTSERVER WIRD AUF MAIN ZURÜCKGESETZT ==="

ssh root@192.168.31.6 "cd /root/admin && git fetch origin main && git switch -C main FETCH_HEAD && git status --short --branch && git log -1 --oneline"

Write-Host ""
Write-Host "=== EXPERIMENT VERWORFEN ==="
git status --short --branch
git log -1 --oneline
