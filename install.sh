#!/usr/bin/env bash
# Steve ProDex installer for macOS / Linux.
# Links every skill and agent into Claude Code and Antigravity so they are
# available in every project. Re-run after `git pull` to pick up changes.
#
#   ./install.sh                 install for Claude Code + Antigravity
#   ./install.sh --claude        Claude Code only
#   ./install.sh --antigravity   Antigravity only
#   ./install.sh --uninstall     remove everything this script added
#
# Written for the bash 3.2 that ships with macOS (no associative arrays).
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RULES="$REPO/rules/steve-prodex-core.md"
START="<!-- steve-prodex:start -->"
END="<!-- steve-prodex:end -->"

CLAUDE_DIR="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
GEMINI_DIR="$HOME/.gemini"
AG_SKILLS="$GEMINI_DIR/config/skills"

DO_CLAUDE=1; DO_AG=1; UNINSTALL=0
case "${1:-}" in
  --claude) DO_AG=0 ;;
  --antigravity) DO_CLAUDE=0 ;;
  --uninstall) UNINSTALL=1 ;;
  "") ;;
  *) echo "unknown option: $1"; exit 1 ;;
esac

say() { printf '  %s\n' "$*"; }

# Replace (or append) the marked block in a rules file. $2 = block body.
write_block() {
  local file="$1" body="$2" tmp
  mkdir -p "$(dirname "$file")"; touch "$file"
  tmp="$(mktemp)"
  awk -v s="$START" -v e="$END" '$0==s{skip=1;next} $0==e{skip=0;next} !skip' "$file" > "$tmp"
  # trim trailing blank lines left by a previous block
  awk '{a[NR]=$0} END{n=NR; while(n>0 && a[n]=="") n--; for(i=1;i<=n;i++) print a[i]}' "$tmp" > "$file"
  rm -f "$tmp"
  if [ -n "$body" ]; then
    [ -s "$file" ] && printf '\n' >> "$file"
    printf '%s\n%s\n%s\n' "$START" "$body" "$END" >> "$file"
  fi
}

# Remove symlinks in $1 that point into this repo (stale or not).
unlink_ours() {
  local dir="$1" l
  [ -d "$dir" ] || return 0
  for l in "$dir"/*; do
    [ -L "$l" ] || continue
    case "$(readlink "$l")" in "$REPO"/*) rm -f "$l" ;; esac
  done
}

link_skills() {
  local dest="$1" d n linked=0 skipped=""
  mkdir -p "$dest"
  unlink_ours "$dest"
  for d in "$REPO"/skills/*/; do
    n="$(basename "$d")"
    if [ -e "$dest/$n" ] && [ ! -L "$dest/$n" ]; then
      skipped="$skipped $n"; continue
    fi
    ln -sfn "$REPO/skills/$n" "$dest/$n"; linked=$((linked+1))
  done
  say "$linked skills linked into $dest"
  [ -z "$skipped" ] || say "kept your own existing folders (not overwritten):$skipped"
}

# ---------------------------------------------------------------- Claude Code
claude_install() {
  echo "Claude Code ($CLAUDE_DIR)"
  link_skills "$CLAUDE_DIR/skills"

  local adir="$CLAUDE_DIR/agents/steve-prodex" f n=0
  mkdir -p "$adir"; unlink_ours "$adir"
  for f in "$REPO"/agents/*/*.md; do ln -sf "$f" "$adir/$(basename "$f")"; n=$((n+1)); done
  say "$n agents linked into $adir"

  write_block "$CLAUDE_DIR/CLAUDE.md" "@$RULES"
  say "router imported in $CLAUDE_DIR/CLAUDE.md"

  local settings="$CLAUDE_DIR/settings.json"
  if [ ! -s "$settings" ]; then
    printf '{\n  "model": "opus",\n  "effortLevel": "medium"\n}\n' > "$settings"
    say "default session set to Opus, medium effort"
  elif command -v python3 >/dev/null 2>&1 && python3 -c 'import json' 2>/dev/null; then
    cp "$settings" "$settings.bak"
    python3 -I - "$settings" <<'PY'
import json, sys
p = sys.argv[1]
d = json.load(open(p))
d["model"] = "opus"; d["effortLevel"] = "medium"
json.dump(d, open(p, "w"), indent=2); open(p, "a").write("\n")
PY
    say "default session set to Opus, medium effort (backup: settings.json.bak)"
  else
    say "add \"model\": \"opus\" and \"effortLevel\": \"medium\" to $settings yourself"
  fi
}

claude_uninstall() {
  echo "Claude Code ($CLAUDE_DIR)"
  unlink_ours "$CLAUDE_DIR/skills"
  unlink_ours "$CLAUDE_DIR/agents/steve-prodex"
  rmdir "$CLAUDE_DIR/agents/steve-prodex" 2>/dev/null || true
  [ -f "$CLAUDE_DIR/CLAUDE.md" ] && write_block "$CLAUDE_DIR/CLAUDE.md" ""
  say "removed (model settings left as they are)"
}

# ---------------------------------------------------------------- Antigravity
# Antigravity has no subagents, so each agent becomes a skill named agency-<name>.
ag_agents_as_skills() {
  local f slug dir n=0
  for dir in "$AG_SKILLS"/agency-*/; do
    [ -f "$dir/.steve-prodex" ] && rm -rf "$dir"
  done
  for f in "$REPO"/agents/*/*.md; do
    slug="$(basename "$f" .md)"; dir="$AG_SKILLS/agency-$slug"
    mkdir -p "$dir"; : > "$dir/.steve-prodex"
    awk -v name="agency-$slug" '
      NR==1 && $0=="---" {fm=1; print; next}
      fm && $0=="---" {fm=0; print "name: " name; print; next}
      fm && /^description:/ {print; next}
      fm {next}
      {print}' "$f" > "$dir/SKILL.md"
    n=$((n+1))
  done
  say "$n agents installed as agency-* skills"
}

ag_install() {
  echo "Antigravity ($GEMINI_DIR)"
  link_skills "$AG_SKILLS"
  ag_agents_as_skills
  write_block "$GEMINI_DIR/GEMINI.md" "$(cat "$RULES")"
  say "router written into $GEMINI_DIR/GEMINI.md (re-run after git pull)"
}

ag_uninstall() {
  echo "Antigravity ($GEMINI_DIR)"
  unlink_ours "$AG_SKILLS"
  local dir
  for dir in "$AG_SKILLS"/agency-*/; do
    [ -f "$dir/.steve-prodex" ] && rm -rf "$dir"
  done
  [ -f "$GEMINI_DIR/GEMINI.md" ] && write_block "$GEMINI_DIR/GEMINI.md" ""
  say "removed"
}

echo "Steve ProDex — $REPO"
if [ "$UNINSTALL" = 1 ]; then
  claude_uninstall; ag_uninstall
else
  [ "$DO_CLAUDE" = 1 ] && claude_install
  [ "$DO_AG" = 1 ] && ag_install
  echo "Done. Restart Claude Code / Antigravity so they load the new skills and agents."
fi
