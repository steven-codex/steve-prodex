# Steve ProDex (`steve-prodex`)

A comprehensive, production-grade developer experience and design engineering plugin for AI coding agents. One install wires it into **Claude Code** and **Google Antigravity** at the same time (macOS / Linux).

## Overview

`steve-prodex` packages **92 deduplicated skills** and **282 specialist agents** (from [The Agency](https://github.com/msitarzewski/agency-agents)) into a single cohesive unit, with automatic model routing. It spans the entire development lifecycle:
- **Product & Clarification**: Socratic brainstorming, PRDs, conversion copywriting.
- **Frontend Taste & Polish**: Awwwards-level GSAP layouts, 20-dimension UI polish, optical alignment, and concentric radii.
- **Micro-interactions & Motion**: React view transitions, interruptible spring physics, stagger animations.
- **Video & Motion Graphics (HyperFrames & MotionFields)**: Video generation from HTML compositions, DOM-declared timing, seekable animation runtimes, and cinematic motion direction.
- **Code Minimalism (Ponytail)**: Senior-dev YAGNI discipline, native platform features before dependencies, and shortest working diffs.
- **Architecture & Fullstack**: Scalable React composition, Convex, Supabase/PostgreSQL optimization, Vercel deployments.
- **Quality & Workflows**: Systematic debugging, dead-code cleanup, structured code reviews.

---

## Included Skills (92 Total)

| Skill | Category | Description |
| :--- | :--- | :--- |
| `agent-browser` | Automation | Browser automation and web interaction workflows |
| `antislop` | UI Quality | Rules against generic AI-generated UI, copy, and code |
| `brainstorming` | Product | Socratic questioning, idea shaping, and requirement clarification |
| `clone-website` | Frontend | Website reverse-engineering and visual layout cloning |
| `composition-patterns` | Frontend | Scalable React component composition architectures |
| `convex-best-practices` | Backend | Production-ready reactive Convex backend patterns |
| `deploy-to-vercel` | DevOps | Vercel deployment workflows and build optimization |
| `frontend-design` | Frontend | Anthropic's high-quality frontend design guidelines |
| `frontend-skill` | Frontend | Robust modern UI structure for landing pages and apps |
| `gpt-tasteskill` | Design / Motion | Elite GSAP motion, gapless bento grids, and typography |
| `hyperframes` | Video & Motion | HeyGen's video and motion graphics rendering from HTML |
| `hyperframes-animation` | Video & Motion | GSAP, CSS, and Lottie animation runtime adapters for HyperFrames |
| `hyperframes-cli` | Video & Motion | HyperFrames CLI tooling, previewing, and batch-rendering |
| `hyperframes-core` | Video & Motion | HyperFrames technical authoring contract & DOM timing |
| `impeccable` | UI Polish | Paul Bakaus's 20-dimension design critique and polish suite |
| `improve-animations` | Motion | Emil Kowalski's spring tuning, interrupts, and gesture physics |
| `landing-page-copywriter` | Product | Conversion-focused value props and landing page copy |
| `make-interfaces-feel-better` | UI Polish | Emil Kowalski's 16 core principles (optical alignment, concentric radius) |
| `motionfields` | Video & Motion | Creative direction and execution orchestration for premium product motion and coded films |
| `pdf` | Utility | PDF reading, rendering, generation, and inspection |
| `ponytail` | Architecture | Dietrich Gebert's anti-overengineering and YAGNI minimal code discipline |
| `prd` | Product | Product Requirement Documents, user stories, and specs |
| `react-best-practices` | Frontend | React and Next.js performance patterns (anti re-render) |
| `react-native-skills` | Mobile | React Native and Expo production best practices |
| `react-view-transitions` | Motion | Native-feeling page and element view transitions in React |
| `receiving-code-review` | QA / Workflow | Handling and validating pull request feedback |
| `refactor-clean` | Code Quality | Safe cleanup, dead-code removal, and refactoring |
| `requesting-code-review` | QA / Workflow | Preparing PRs, diff checklists, and review readiness |
| `seo-audit` | Marketing | SEO diagnostics, OpenGraph tags, and Web Vitals |
| `shadcn` | UI Components | shadcn/ui & Radix UI implementation best practices |
| `social-content` | Marketing | Developer release notes, tweets, and launch copy |
| `supabase-postgres-best-practices` | Database | Postgres indexes, RLS security, and query tuning |
| `systematic-debugging` | Debugging | Root-cause analysis and structured troubleshooting |
| `ui-ux-pro-max` | UI / UX | Comprehensive UI/UX design systems and patterns |
| `web-design-guidelines` | Accessibility | WCAG accessibility, contrast checks, and UI audits |

### Additional Skills (43)

| Source | Skills |
| :--- | :--- |
| Addy Osmani | `api-and-interface-design`, `browser-testing-with-devtools`, `ci-cd-and-automation`, `code-review-and-quality`, `code-simplification`, `constraint-driven-development`, `context-engineering`, `debugging-and-error-recovery`, `deprecation-and-migration`, `documentation-and-adrs`, `doubt-driven-development`, `frontend-ui-engineering`, `git-workflow-and-versioning`, `idea-refine`, `incremental-implementation`, `interview-me`, `observability-and-instrumentation`, `performance-optimization`, `planning-and-task-breakdown`, `security-and-hardening`, `shipping-and-launch`, `source-driven-development`, `spec-driven-development`, `test-driven-development`, `using-agent-skills` |
| Strix | `api-security-testing`, `application-security-testing`, `ci-security-scanning-with-strix`, `find-security-vulnerabilities-in-code`, `fix-security-vulnerabilities-with-strix`, `managed-pentesting-with-strix`, `owasp-top-10-testing`, `penetration-testing-with-strix`, `web-app-penetration-testing` |
| Graphify Labs | `graphify` |
| 21st.dev | `21st-ui` |
| Andrej Karpathy Skills | `karpathy-guidelines` |
| Emil Kowalski | `emil-design-eng` |
| Taste Skill | `design-taste-frontend` |
| transitions.dev | `transitions-dev`, `transitions-polish` |
| Matt Pocock | `grill-me` (type `/grill-me`), `grilling` |
| Jakub Krehel | `better-accessibility`, `better-colors`, `better-interface`, `better-layout`, `better-typography`, `better-ui`, `better-writing`, `break`, `build-design`, `explain-interface`, `interface-review`, `state-machine`, `technical-drawing`, `variant` |

Skill source and version metadata is recorded in [`skills-lock.json`](skills-lock.json).

---

## Specialist Agents (282)

Every agent from [msitarzewski/agency-agents](https://github.com/msitarzewski/agency-agents) (MIT) lives in [`agents/`](agents), grouped by division: engineering, design, testing, security, product, project management, marketing, paid media, sales, support, finance, game development, spatial computing, GIS, academic, healthcare, research and specialized.

Each one is a Claude Code subagent with its model already chosen, so the expensive model is only used where it pays off:

| Where | Model | Used for |
|---|---|---|
| Main session | Opus, medium effort | Understanding the request, planning, choosing skills/agents, final check |
| 🟦 `sonnet` agents (127) | Sonnet, medium effort | Implementation, debugging, review, testing, security, databases, UI build |
| 🟩 `haiku` agents (155) | Haiku | Copy, marketing, sales, docs, research summaries, product/PM, business advice |

If a Haiku agent's work fails verification, the router re-runs it once on Sonnet; if Sonnet also fails, the main Opus session finishes it. The full rules are in [`rules/steve-prodex-core.md`](rules/steve-prodex-core.md).

In Antigravity (no subagents), the same specialists are installed as skills named `agency-<agent-name>`.

To refresh agents from upstream: `python3 scripts/build-agents.py /path/to/agency-agents`. Model assignments live at the top of that script.

---

## Install (macOS / Linux)

```bash
git clone https://github.com/steven-codex/steve-prodex.git ~/steve-prodex
cd ~/steve-prodex && ./install.sh
```

Then restart Claude Code and Antigravity. What the installer does:

| Tool | Skills | Agents | Rules |
|---|---|---|---|
| Claude Code | linked into `~/.claude/skills/` | linked into `~/.claude/agents/steve-prodex/` | imported from `~/.claude/CLAUDE.md`; default model set to Opus, medium effort |
| Antigravity | linked into `~/.gemini/config/skills/` | generated as `agency-*` skills | written into `~/.gemini/GEMINI.md` |

Everything is symlinked to this folder, so it works in every project without re-reading the repo. Your own skills and notes are never overwritten; the rules go between `<!-- steve-prodex:start -->` markers.

| Command | Does |
|---|---|
| `git pull && ./install.sh` | Update to the latest version |
| `./install.sh --claude` / `--antigravity` | Install for one tool only |
| `./install.sh --uninstall` | Remove everything the installer added |

### Using it

- Skills apply automatically when the task matches. Call one directly with `/name`, e.g. `/ponytail`, `/grill-me`, `/systematic-debugging`.
- Ask for a specialist by role: "have the security appsec engineer review this", "use the marketing seo specialist".
- Before building something new, start with `/grill-me` so the plan is settled before any code is written.

### Per-project install (Antigravity, optional)

Antigravity also discovers the plugin per project when it sits in `.agents/plugins/steve-prodex/`:

```bash
git submodule add https://github.com/steven-codex/steve-prodex.git .agents/plugins/steve-prodex
```

---

## Credits

Skills and agents come from their original authors, listed above and in [`skills-lock.json`](skills-lock.json). The Agency agents are MIT-licensed by Michael Sitarzewski and contributors; `grill-me`/`grilling` are MIT-licensed by Matt Pocock.
