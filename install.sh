#!/bin/bash
# CDYstack — CEO Decision Toolkit for Claude Code
# Usage: curl -sL https://raw.githubusercontent.com/aaronpan007/CDYstack/main/install.sh | bash
# Or:  ./install.sh              (from local clone)
# Or:  ./install.sh /path/to/project   (specify target project)

set -e

REPO_RAW="https://raw.githubusercontent.com/aaronpan007/CDYstack/main"

# --- Determine target directory ---
if [ -n "$1" ]; then
    TARGET="$1"
else
    TARGET="$(pwd)"
fi

if [ ! -d "$TARGET" ]; then
    echo "Error: $TARGET does not exist."
    exit 1
fi

echo ""
echo "  CDYstack — CEO Decision Toolkit"
echo "  Installing to: $TARGET"
echo ""

# --- Create directories ---
mkdir -p "$TARGET/.claude/skills"
mkdir -p "$TARGET/memory/ceo"

# --- Download functions ---
download() {
    local src="$1"
    local dest="$2"
    if [ -f "$dest" ]; then
        echo "  [skip] $(basename "$dest") (already exists)"
    else
        curl -sL "$src" -o "$dest"
        echo "  [done] $(basename "$dest")"
    fi
}

copy_local() {
    local src="$1"
    local dest="$2"
    if [ -f "$dest" ]; then
        echo "  [skip] $(basename "$dest") (already exists)"
    else
        cp "$src" "$dest"
        echo "  [done] $(basename "$dest")"
    fi
}

# --- Detect: local install or remote? ---
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
LOCAL_SKILLS="$SCRIPT_DIR/skills"
LOCAL_MEMORY="$SCRIPT_DIR/memory/ceo"

SKILLS=(ceo ceo-decide ceo-portfolio ceo-action ceo-prioritize ceo-compete ceo-market ceo-comm ceo-review)
MEMORY_FILES=(portfolio-state.md competitive-intel.md market-intel.md decision-log.md weekly-log.md priorities.md comm-archive.md learnings.md)

# --- Install skills ---
echo "Installing skills..."
for skill in "${SKILLS[@]}"; do
    dest="$TARGET/.claude/skills/$skill/skill.md"
    mkdir -p "$TARGET/.claude/skills/$skill"
    if [ -d "$LOCAL_SKILLS/$skill" ]; then
        copy_local "$LOCAL_SKILLS/$skill/skill.md" "$dest"
    else
        download "$REPO_RAW/skills/$skill/skill.md" "$dest"
    fi
done

# --- Install memory templates ---
echo ""
echo "Installing memory templates..."
for memfile in "${MEMORY_FILES[@]}"; do
    dest="$TARGET/memory/ceo/$memfile"
    if [ -f "$LOCAL_MEMORY/$memfile" ]; then
        copy_local "$LOCAL_MEMORY/$memfile" "$dest"
    else
        download "$REPO_RAW/memory/ceo/$memfile" "$dest"
    fi
done

# --- Update CLAUDE.md ---
CLAUDE_MD="$TARGET/CLAUDE.md"
MARKER="# CDYstack"
if [ -f "$CLAUDE_MD" ] && grep -q "$MARKER" "$CLAUDE_MD"; then
    echo ""
    echo "  [skip] CLAUDE.md (already has CDYstack block)"
else
    echo ""
    echo "Adding CDYstack block to CLAUDE.md..."
    cat >> "$CLAUDE_MD" << 'BLOCK'

# CDYstack — CEO Decision Toolkit
# Start with /ceo as the router. Full docs: https://github.com/aaronpan007/CDYstack

## CEO Assistant
- `/ceo` - Router: classify intent → dispatch
- `/ceo-decide` - Go/no-go decisions (dissolution + YC questions)
- `/ceo-portfolio` - Multi-product portfolio management
- `/ceo-action` - Execution blocker diagnosis (self/team/process)
- `/ceo-prioritize` - Priority ranking with ICE framework
- `/ceo-compete` - Competitive intelligence (5-filter method)
- `/ceo-market` - Market trend analysis (3-perspective)
- `/ceo-comm` - Communication preparation (memo/investor/social/review)
- `/ceo-review` - Weekly review ritual with trend detection

Memory: `memory/ceo/` (portfolio-state, competitive-intel, market-intel, decision-log, weekly-log, priorities, comm-archive, learnings)
BLOCK
    echo "  [done] CLAUDE.md updated"
fi

# --- Done ---
echo ""
echo "  CDYstack installed successfully!"
echo ""
echo "  Next steps:"
echo "    1. Open Claude Code in: $TARGET"
echo "    2. Type: /ceo"
echo "    3. Follow the welcome guide to set up your portfolio"
echo ""
echo "  Quick reference: https://github.com/aaronpan007/CDYstack"
echo ""
