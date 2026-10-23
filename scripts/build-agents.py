#!/usr/bin/env python3
"""Rebuild agents/ from an upstream clone of msitarzewski/agency-agents.

Usage:  python3 scripts/build-agents.py /path/to/agency-agents

Each agent becomes a Claude Code subagent with:
  name   -> file stem (kebab-case, unique)
  model  -> haiku (light/writing/business roles) or sonnet (build/review/security)
  effort -> medium for sonnet agents (haiku runs without an effort override)
  color  -> green = haiku, blue = sonnet (so you can see the tier in the transcript)
Descriptions are trimmed so ~280 agents stay under Claude Code's
15k-token startup budget for agent descriptions.
"""
import json, re, shutil, sys
from pathlib import Path

SRC = Path(sys.argv[1]).resolve()
OUT = Path(__file__).resolve().parent.parent / "agents"
MAX_DESC = 150

# Divisions whose agents build, review or secure code -> sonnet by default.
SONNET_DIVISIONS = {"engineering", "testing", "security", "spatial-computing", "game-development", "gis"}

# Exceptions inside sonnet divisions that are mostly writing/analysis -> haiku.
HAIKU_OVERRIDES = {
    "engineering-technical-writer", "engineering-git-workflow-master",
    "engineering-codebase-onboarding-engineer", "engineering-it-service-manager",
    "testing-tool-evaluator", "testing-workflow-optimizer", "testing-test-results-analyzer",
    "security-compliance-auditor", "security-threat-intelligence-analyst",
    "game-designer", "narrative-designer", "level-designer", "economy-designer",
    "roblox-experience-designer",
    "gis-analyst", "gis-technical-consultant", "gis-cartography-designer",
}

# Technical agents living in otherwise light divisions -> sonnet.
SONNET_OVERRIDES = {
    "design-ui-designer", "design-ux-architect", "design-ui-finish-gate-reviewer",
    "product-dx-engineer",
    "agents-orchestrator", "identity-graph-operator", "specialized-mcp-builder",
    "lsp-index-engineer", "specialized-master-plan-architect", "specialized-model-qa",
    "specialized-codebase-archaeologist", "agentic-identity-trust",
    "automation-governance-architect", "specialized-salesforce-architect",
    "specialized-document-generator", "specialized-workflow-architect",
    "specialized-fedramp-rmf-compliance", "specialized-civil-engineer",
}


def tier(division: str, slug: str) -> str:
    if slug in SONNET_OVERRIDES:
        return "sonnet"
    if slug in HAIKU_OVERRIDES:
        return "haiku"
    return "sonnet" if division in SONNET_DIVISIONS else "haiku"


def split_frontmatter(text: str):
    m = re.match(r"^---\n(.*?)\n---\n?(.*)$", text, re.S)
    if not m:
        return None, text
    meta = {}
    for line in m.group(1).splitlines():
        km = re.match(r"^([A-Za-z_][\w-]*):\s*(.*)$", line)
        if km:
            meta[km.group(1)] = km.group(2).strip().strip('"').strip("'")
    return meta, m.group(2)


def short(desc: str) -> str:
    desc = " ".join(desc.split())
    if len(desc) <= MAX_DESC:
        return desc
    cut = desc[:MAX_DESC].rsplit(" ", 1)[0].rstrip(",;:-.")
    return cut + "…"


def main():
    divisions = json.loads((SRC / "divisions.json").read_text())["divisions"]
    if OUT.exists():
        shutil.rmtree(OUT)
    seen, counts = set(), {"haiku": 0, "sonnet": 0}
    for division in sorted(divisions):
        for path in sorted((SRC / division).rglob("*.md")):
            meta, body = split_frontmatter(path.read_text(encoding="utf-8"))
            if not meta or "name" not in meta or "description" not in meta:
                continue
            slug = path.stem
            if slug in seen:
                raise SystemExit(f"duplicate agent slug: {slug}")
            seen.add(slug)
            model = tier(division, slug)
            counts[model] += 1
            lines = [
                "---",
                f"name: {slug}",
                f"description: {json.dumps(short(meta['description']), ensure_ascii=False)}",
                f"model: {model}",
            ]
            if model == "sonnet":
                lines.append("effort: medium")
            lines += [f"color: {'blue' if model == 'sonnet' else 'green'}", "---", ""]
            dest = OUT / division / f"{slug}.md"
            dest.parent.mkdir(parents=True, exist_ok=True)
            dest.write_text("\n".join(lines) + body.lstrip("\n"), encoding="utf-8")
    total = sum(counts.values())
    print(f"built {total} agents -> {OUT}  (sonnet: {counts['sonnet']}, haiku: {counts['haiku']})")


if __name__ == "__main__":
    main()
