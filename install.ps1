param(
    [string]$Target = (Get-Location).Path
)

$ErrorActionPreference = "Stop"

$RepoRaw = "https://raw.githubusercontent.com/aaronpan007/CDYstack/main"

if (-not (Test-Path -LiteralPath $Target -PathType Container)) {
    throw "Target directory does not exist: $Target"
}

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$LocalRoot = $ScriptDir

$Skills = @(
    "ceo",
    "ceo-decide",
    "ceo-portfolio",
    "ceo-action",
    "ceo-prioritize",
    "ceo-compete",
    "ceo-market",
    "ceo-comm",
    "ceo-review"
)

$MemoryFiles = @(
    "portfolio-state.md",
    "competitive-intel.md",
    "market-intel.md",
    "decision-log.md",
    "weekly-log.md",
    "priorities.md",
    "comm-archive.md",
    "learnings.md"
)

function Install-File {
    param(
        [string]$RelativePath,
        [string]$Destination
    )

    $destinationDir = Split-Path -Parent $Destination
    if ($destinationDir) {
        New-Item -ItemType Directory -Force -Path $destinationDir | Out-Null
    }

    if (Test-Path -LiteralPath $Destination) {
        Write-Host "  [skip] $Destination"
        return
    }

    $localSource = Join-Path $LocalRoot $RelativePath
    if (Test-Path -LiteralPath $localSource) {
        Copy-Item -LiteralPath $localSource -Destination $Destination -Force
        Write-Host "  [done] $Destination"
        return
    }

    $remoteSource = "$RepoRaw/$($RelativePath -replace '\\','/')"
    Invoke-WebRequest -Uri $remoteSource -OutFile $Destination | Out-Null
    Write-Host "  [done] $Destination"
}

Write-Host ""
Write-Host "CDYstack"
Write-Host "Installing to: $Target"
Write-Host ""

New-Item -ItemType Directory -Force -Path (Join-Path $Target ".claude/skills") | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $Target "memory/ceo") | Out-Null

Write-Host "Installing skills..."
foreach ($skill in $Skills) {
    Install-File "skills/$skill/SKILL.md" (Join-Path $Target ".claude/skills/$skill/SKILL.md")
}

Write-Host ""
Write-Host "Installing memory templates..."
foreach ($memfile in $MemoryFiles) {
    Install-File "memory/ceo/$memfile" (Join-Path $Target "memory/ceo/$memfile")
}

$ClaudeMd = Join-Path $Target "CLAUDE.md"
$Marker = "# CDYstack"
$NeedsBlock = $true

if (Test-Path -LiteralPath $ClaudeMd) {
    $existing = Get-Content -LiteralPath $ClaudeMd -Raw
    if ($existing -match [regex]::Escape($Marker)) {
        $NeedsBlock = $false
        Write-Host ""
        Write-Host "  [skip] CLAUDE.md already contains the CDYstack block"
    }
}

if ($NeedsBlock) {
    Write-Host ""
    Write-Host "Adding CDYstack block to CLAUDE.md..."
    @'

# CDYstack â€?CEO Decision Toolkit
# Start with /ceo as the router. Full docs: https://github.com/aaronpan007/CDYstack

## CEO Assistant
- `/ceo` - Router: classify intent -> dispatch
- `/ceo-decide` - Go/no-go decisions
- `/ceo-portfolio` - Multi-product portfolio management
- `/ceo-action` - Execution blocker diagnosis
- `/ceo-prioritize` - Priority ranking with ICE
- `/ceo-compete` - Competitive intelligence
- `/ceo-market` - Market trend analysis
- `/ceo-comm` - Communication preparation
- `/ceo-review` - Weekly review ritual

Memory: `memory/ceo/` (`portfolio-state.md`, `competitive-intel.md`, `market-intel.md`, `decision-log.md`, `weekly-log.md`, `priorities.md`, `comm-archive.md`, `learnings.md`)
'@ | Add-Content -LiteralPath $ClaudeMd
    Write-Host "  [done] CLAUDE.md updated"
}

Write-Host ""
Write-Host "CDYstack installed successfully."
Write-Host ""
Write-Host "Next steps:"
Write-Host "  1. Open Claude Code"
Write-Host "  2. Type: /ceo"
Write-Host "  3. Follow the welcome guide"
Write-Host ""
