# CDYstack — CEO Decision Toolkit for Claude Code

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

Or call any skill directly:

```text
/ceo-decide Should we hire a VP of Engineering?
/ceo-portfolio review
/ceo-action team
/ceo-prioritize firefight
/ceo-compete analyze Discord
/ceo-market scan AI for social apps
/ceo-comm investor
/ceo-review quarterly
```

### 3. Data Persists

All your data is stored in `memory/ceo/`. It carries across sessions. Your portfolio, decisions, weekly reviews, and learnings accumulate over time.

---

## Overview

CDYstack covers four domains:

| Domain | Tools | Core Question |
|--------|-------|---------------|
| Strategy | `ceo-decide`, `ceo-portfolio` | Should we? What are we building? |
| Execution | `ceo-action`, `ceo-prioritize` | Why is this blocked? What matters most? |
| Intelligence | `ceo-compete`, `ceo-market` | What are they doing? Where is the market going? |
| Content | `ceo-comm`, `ceo-review` | What do I say? How did we do? |

Every skill has persistent memory across sessions. Your portfolio, decisions, and weekly reviews accumulate over time.

---

## Tools Reference

### `/ceo` — Router

The entry point. Classifies your intent and dispatches to the right tool.

```text
/ceo I need to decide on pricing
/ceo Look at my products
/ceo Help me think through something
```

### `/ceo-decide` — Decision Making

Go/no-go decisions with a two-stage framework:

1. Dissolution check
2. YC forcing questions

Output: a one-page decision brief with GO / NO-GO / DEFER and the next action.

### `/ceo-portfolio` — Product Portfolio Management

Manage a multi-product portfolio across five stages:

Explore -> Validate -> Scale -> Mature -> Sunset

### `/ceo-action` — Execution Blocker Diagnosis

Diagnoses why things are not getting done across self, team, and process.

### `/ceo-prioritize` — Priority Framework

Forced ranking with ICE scoring.

### `/ceo-compete` — Competitive Intelligence

Five-filter analysis that eliminates noise.

### `/ceo-market` — Market Intelligence

Three-perspective trend analysis:

1. Technology
2. Market
3. User behavior

### `/ceo-comm` — Communication Preparation

Drafts and reviews memos, investor updates, and social posts.

### `/ceo-review` — Weekly Review Ritual

Structured weekly review that catches drift and maintains accountability.

---

## Memory System

All state persists in `memory/ceo/`:

- `portfolio-state.md`
- `competitive-intel.md`
- `market-intel.md`
- `decision-log.md`
- `weekly-log.md`
- `priorities.md`
- `comm-archive.md`
- `learnings.md`

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
|   |   `-- skill.md
|   |-- ceo-decide/
|   |   `-- skill.md
|   |-- ceo-portfolio/
|   |   `-- skill.md
|   |-- ceo-action/
|   |   `-- skill.md
|   |-- ceo-prioritize/
|   |   `-- skill.md
|   |-- ceo-compete/
|   |   `-- skill.md
|   |-- ceo-market/
|   |   `-- skill.md
|   |-- ceo-comm/
|   |   `-- skill.md
|   `-- ceo-review/
|       `-- skill.md
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
