# CDYstack — CEO Decision Toolkit for Claude Code

A collection of 9 Claude Code skills designed for startup CEOs who juggle a mature main product alongside multiple exploratory products. Built for speed, clarity, and ruthless prioritization.

---

## Install

```bash
curl -sL https://raw.githubusercontent.com/aaronpan007/CDYstack/main/install.sh | bash
```

Install to a specific project:

```bash
curl -sL https://raw.githubusercontent.com/aaronpan007/CDYstack/main/install.sh | bash -s /path/to/your/project
```

Or clone and install locally:

```bash
git clone https://github.com/aaronpan007/CDYstack.git
cd CDYstack && ./install.sh /path/to/your/project
```

**What it does:** Creates 9 skills in `.claude/skills/`, 8 memory templates in `memory/ceo/`, and appends a CDYstack block to `CLAUDE.md`. Skips existing files — safe to re-run.

**After install:** Open Claude Code, type `/ceo`. You'll see the welcome guide.

---

## Quick Start

### 1. First Use

Type `/ceo` in Claude Code. You'll see a welcome guide and be prompted to set up your product portfolio — this takes about 2 minutes and everything else builds on it.

### 2. Daily Use

Just describe what you need in natural language after `/ceo`:

```
/ceo Should we launch the new onboarding flow?
/ceo What's blocking our mobile app release?
/ceo Help me rank this week's priorities
/ceo Write an investor update for March
/ceo Weekly review
```

Or call any skill directly:

```
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

All your data is stored in `memory/ceo/`. It carries across sessions — your portfolio, decisions, weekly reviews, and learnings accumulate over time.

---

## Overview

CDYstack covers four domains:

| Domain | Tools | Core Question |
|--------|-------|---------------|
| **Strategy** | `ceo-decide`, `ceo-portfolio` | "Should we?" "What are we building?" |
| **Execution** | `ceo-action`, `ceo-prioritize` | "Why isn't it done?" "What matters most?" |
| **Intelligence** | `ceo-compete`, `ceo-market` | "What are they doing?" "Where is the market going?" |
| **Content** | `ceo-comm`, `ceo-review` | "What do I say?" "How did we do?" |

Every skill has persistent memory across sessions. Your portfolio, decisions, and weekly reviews accumulate over time — the toolkit gets smarter the more you use it.

---

## Tools Reference

### `/ceo` — Router

The entry point. Classifies your intent and dispatches to the right tool.

```
/ceo I need to decide on pricing
/ceo Look at my products
/ceo Help me think through something
```

**No analysis, no advice. Just routing.**

---

### `/ceo-decide` — Decision Making

Go/no-go decisions with a two-stage framework:

1. **Dissolution check** — Is the question even valid? (language trap → hidden assumption → reversal test)
2. **YC forcing questions** — 6 stress tests (specific user → do-nothing cost → smallest test → failure mode → confidence → disconfirm criteria)

Output: One-page decision brief with GO/NO-GO/DEFER verdict and first action.

| Mode | Trigger | Purpose |
|------|---------|---------|
| quick (default) | `/ceo-decide` | Full cycle in one pass |
| deep | `/ceo-decide deep` | + scenario planning, second-order effects, reversibility |

---

### `/ceo-portfolio` — Product Portfolio Management

Manage a multi-product portfolio with 5 stages: **Explore → Validate → Scale → Mature → Sunset**

Tracks kill/continue/accelerate signals and recommends CEO attention allocation.

| Mode | Trigger | Purpose |
|------|---------|---------|
| dashboard (default) | `/ceo-portfolio` | Portfolio overview + attention heatmap |
| review | `/ceo-portfolio review` | Deep review of one or all products |
| alloc | `/ceo-portfolio alloc` | Optimize CEO time allocation (70/20/10 rule) |
| kill | `/ceo-portfolio kill` | Evaluate a product for sunsetting |

---

### `/ceo-action` — Execution Blocker Diagnosis

Detects why things aren't getting done. Diagnoses 6 blocker patterns:

| Blocker | Signal |
|---------|--------|
| Delegation failure | "I need to do this myself" |
| Analysis paralysis | "I need more data" |
| Priority diffusion | Everything feels urgent |
| Decision debt | "Let's revisit this later" |
| Perfectionism by proxy | "The team needs more time" |
| Meeting addiction | Calendar is back-to-back |

| Mode | Trigger | Purpose |
|------|---------|---------|
| self (default) | `/ceo-action` | CEO's own blockers |
| team | `/ceo-action team` | Team execution issues |
| process | `/ceo-action process` | Organizational process bottlenecks |

---

### `/ceo-prioritize` — Priority Framework

Forced ranking with the **ICE scoring** framework: Impact x Confidence x Ease (max 1000).

Hard limit: 3 active priorities. Everything else goes to the parking lot.

| Mode | Trigger | Purpose |
|------|---------|---------|
| weekly (default) | `/ceo-prioritize` | Rank this week's work |
| quarterly | `/ceo-prioritize quarterly` | Set quarterly themes and milestones |
| firefight | `/ceo-prioritize firefight` | Emergency triage (A/B/C/D categorization) |

---

### `/ceo-compete` — Competitive Intelligence

5-filter analysis that eliminates noise:

1. Are they making money?
2. Are they growing or shrinking?
3. What can they actually do?
4. What are they NOT doing? (your opportunity)
5. Does this matter to us?

| Mode | Trigger | Purpose |
|------|---------|---------|
| dashboard (default) | `/ceo-compete` | Threat matrix overview |
| analyze | `/ceo-compete analyze` | Deep analysis of one competitor |
| compare | `/ceo-compete compare` | Head-to-head comparison |

---

### `/ceo-market` — Market Intelligence

3-perspective trend analysis:

1. **Technology** — What's the actual capability? How mature?
2. **Market** — Who's making money? Is there a gap between hype and revenue?
3. **User behavior** — Are real users adopting? Vitamin or painkiller?

Hype filter: 5 questions to separate signal from noise (4-5 yes = real opportunity).

| Mode | Trigger | Purpose |
|------|---------|---------|
| dashboard (default) | `/ceo-market` | Trend radar + opportunity pipeline |
| scan | `/ceo-market scan` | Scan a specific market/topic |
| opportunity | `/ceo-market opportunity` | Deep-dive into one opportunity |

---

### `/ceo-comm` — Communication Preparation

Drafts and reviews memos, investor updates, and social posts.

**Core principle:** The CEO's words carry disproportionate weight. Every communication should be intentional.

| Mode | Trigger | Purpose |
|------|---------|---------|
| default | `/ceo-comm` | Assess what's needed, route to mode |
| memo | `/ceo-comm memo` | Internal memo (context → core message → action) |
| investor | `/ceo-comm investor` | Investor update (metrics → narrative → ask) |
| social | `/ceo-comm social` | Social media post (X/Twitter, LinkedIn) |
| review | `/ceo-comm review` | Review and improve existing draft |

---

### `/ceo-review` — Weekly Review Ritual

Structured weekly review that surfaces patterns, catches priority drift, and maintains accountability.

Tracks 3 scores: **Energy**, **Clarity**, **Momentum** (1-10 each). Detects drift by comparing to previous weeks.

| Mode | Trigger | Purpose |
|------|---------|---------|
| weekly (default) | `/ceo-review` | Standard weekly review |
| quarterly | `/ceo-review quarterly` | + strategy check, portfolio health score |
| trend | `/ceo-review trend` | Analyze patterns across 4-8 weeks |

---

## Architecture

```
                      /ceo (router)
                          |
           ┌──────────────┼──────────────┐
           │              │              │
      STRATEGY       EXECUTION    INTELLIGENCE
      ceo-decide     ceo-action   ceo-compete
      ceo-portfolio  ceo-prioritize ceo-market
           │              │              │
           └──────────────┼──────────────┘
                          │
                     CONTENT
                     ceo-comm
                     ceo-review
```

### Cross-skill Collaboration

Skills recommend each other when a boundary is hit:

| From → To | Trigger |
|-----------|---------|
| ceo-decide → ceo-prioritize | Decision made, need to prioritize execution |
| ceo-decide → ceo-compete | Decision involves competitive move |
| ceo-portfolio → ceo-decide | Kill/continue decision needed |
| ceo-action → ceo-decide | Blocker caused by unmade decision |
| ceo-compete → ceo-decide | Analysis reveals strategic decision needed |
| ceo-market → ceo-compete | Trend involves specific competitors |
| ceo-review → ceo-prioritize | Review shows priority drift |
| ceo-review → ceo-decide | Recurring deferred decisions |
| ceo-review → ceo-action | Recurring blockers need diagnosis |

---

## Memory System

All state persists in `memory/ceo/`:

| File | Purpose |
|------|---------|
| `portfolio-state.md` | Product stages, metrics, owners, attention allocation |
| `competitive-intel.md` | Competitor profiles, analysis history |
| `market-intel.md` | Trends, opportunity pipeline |
| `decision-log.md` | All decisions with context, rationale, and outcomes |
| `weekly-log.md` | Weekly review archive |
| `priorities.md` | Current and past priority stacks |
| `comm-archive.md` | Communication drafts |
| `learnings.md` | Cross-session insights and pattern detection |

Memory files start as templates and get populated as you use the tools. The more you use CDYstack, the more context it accumulates.

---

## File Structure

```
CDYstack/
├── README.md                          # This file
├── skills/
│   ├── ceo/
│   │   └── skill.md                   # Router
│   ├── ceo-decide/
│   │   └── skill.md                   # Decision making
│   ├── ceo-portfolio/
│   │   └── skill.md                   # Portfolio management
│   ├── ceo-action/
│   │   └── skill.md                   # Execution unblock
│   ├── ceo-prioritize/
│   │   └── skill.md                   # Priority ranking
│   ├── ceo-compete/
│   │   └── skill.md                   # Competitive intel
│   ├── ceo-market/
│   │   └── skill.md                   # Market intel
│   ├── ceo-comm/
│   │   └── skill.md                   # Communication
│   └── ceo-review/
│       └── skill.md                   # Weekly review
└── memory/
    └── ceo/
        ├── portfolio-state.md
        ├── competitive-intel.md
        ├── market-intel.md
        ├── decision-log.md
        ├── weekly-log.md
        ├── priorities.md
        ├── comm-archive.md
        └── learnings.md
```

---

## Design Principles

1. **Route, don't analyze.** The router (`/ceo`) never gives advice. It just finds the right tool.
2. **Blunt over polite.** Skills are direct and action-oriented. No fluff.
3. **3 is the magic number.** 3 priorities. Max 3 options. 3 quarterly themes.
4. **Structural over personal.** Execution blockers are structure problems, not character flaws.
5. **Memory compounds.** Weekly reviews and decision logs build institutional memory over time.
6. **Cross-reference, don't silo.** Skills suggest each other when a boundary is hit.

---

## Requirements

- Claude Code CLI
- A Claude Code project (any directory with `.claude/` folder)

---

## Credits

Adapted from:
- **gstack** — engineering workflow skill set (retro, plan-ceo-review, office-hours)
- **dbs (dontbesilent)** — business thinking toolkit (diagnosis, benchmark, deconstruct, action)

Built for a startup CEO managing a mature main product + multiple exploratory products.
