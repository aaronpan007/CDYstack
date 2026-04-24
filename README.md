# CDYstack - CEO Decision Toolkit for Claude Code

A collection of 9 CEO-focused skills for startup founders and operators who need faster decisions, tighter prioritization, and a persistent operating memory.

## Install

### Claude Code

```bash
claude plugin marketplace add aaronpan007/CDYstack
claude plugin install cdy-stack
```

### Universal Install (Codex / Claude Code)

```bash
npx skills add aaronpan007/CDYstack
```

### Fallback Install

macOS / Linux:

```bash
curl -fsSL https://raw.githubusercontent.com/aaronpan007/CDYstack/main/install.sh | bash
```

Install to a specific project:

```bash
curl -fsSL https://raw.githubusercontent.com/aaronpan007/CDYstack/main/install.sh | bash -s /path/to/your/project
```

Windows PowerShell:

```powershell
irm https://raw.githubusercontent.com/aaronpan007/CDYstack/main/install.ps1 | iex
```

Install to a specific project:

```powershell
& ([scriptblock]::Create((irm https://raw.githubusercontent.com/aaronpan007/CDYstack/main/install.ps1))) -Target "D:\path\to\your\project"
```

Windows CMD:

```bat
powershell -ExecutionPolicy Bypass -Command "irm https://raw.githubusercontent.com/aaronpan007/CDYstack/main/install.ps1 | iex"
```

Install to a specific project:

```bat
powershell -ExecutionPolicy Bypass -Command "& ([scriptblock]::Create((irm https://raw.githubusercontent.com/aaronpan007/CDYstack/main/install.ps1))) -Target 'D:\path\to\your\project'"
```

### Clone And Install Locally

```bash
git clone https://github.com/aaronpan007/CDYstack.git
cd CDYstack
./install.sh /path/to/your/project
```

Windows PowerShell:

```powershell
git clone https://github.com/aaronpan007/CDYstack.git
cd CDYstack
.\install.ps1
```

Windows CMD:

```bat
git clone https://github.com/aaronpan007/CDYstack.git
cd CDYstack
install.cmd
```

What it does:
Creates 9 skills in `.claude/skills/`, 8 memory templates in `memory/ceo/`, and appends a CDYstack block to `CLAUDE.md`. Safe to re-run.

After install:
Open Claude Code and type `/ceo`. You will see the welcome guide.

---

## Quick Start

### 1. First Use

Type `/ceo` in Claude Code. You will see a welcome guide and be prompted to set up your product portfolio. This takes about two minutes and everything else builds on it.

### 2. Daily Use

Just describe what you need in natural language after `/ceo`:

```text
/ceo Should we launch the new onboarding flow?
/ceo What's blocking our mobile app release?
/ceo Help me rank this week's priorities
/ceo Write an investor update for March
/ceo Weekly review
```

### 3. Data Persists

All your data is stored in `memory/ceo/`. It carries across sessions. Your portfolio, decisions, weekly reviews, and learnings accumulate over time.

---

## File Structure

```text
CDYstack/
|-- .codex-plugin/
|   `-- plugin.json
|-- README.md
|-- install.cmd
|-- install.ps1
|-- install.sh
|-- skills/
|   |-- ceo/
|   |   `-- SKILL.md
|   |-- ceo-decide/
|   |   `-- SKILL.md
|   |-- ceo-portfolio/
|   |   `-- SKILL.md
|   |-- ceo-action/
|   |   `-- SKILL.md
|   |-- ceo-prioritize/
|   |   `-- SKILL.md
|   |-- ceo-compete/
|   |   `-- SKILL.md
|   |-- ceo-market/
|   |   `-- SKILL.md
|   |-- ceo-comm/
|   |   `-- SKILL.md
|   `-- ceo-review/
|       `-- SKILL.md
`-- memory/
    `-- ceo/
        |-- portfolio-state.md
        |-- competitive-intel.md
        |-- market-intel.md
        |-- decision-log.md
        |-- weekly-log.md
        |-- priorities.md
        |-- comm-archive.md
        `-- learnings.md
```