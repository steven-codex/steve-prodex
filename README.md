# Steve ProDex (`steve-prodex`)

A comprehensive, production-grade developer experience and design engineering plugin for AI coding agents (Google Antigravity, Gemini IDE, Cursor, Claude Code, etc.).

## Overview

`steve-prodex` packages **76 deduplicated skills** into a single cohesive unit. It spans the entire development lifecycle:
- **Product & Clarification**: Socratic brainstorming, PRDs, conversion copywriting.
- **Frontend Taste & Polish**: Awwwards-level GSAP layouts, 20-dimension UI polish, optical alignment, and concentric radii.
- **Micro-interactions & Motion**: React view transitions, interruptible spring physics, stagger animations.
- **Video & Motion Graphics (HyperFrames & MotionFields)**: Video generation from HTML compositions, DOM-declared timing, seekable animation runtimes, and cinematic motion direction.
- **Code Minimalism (Ponytail)**: Senior-dev YAGNI discipline, native platform features before dependencies, and shortest working diffs.
- **Architecture & Fullstack**: Scalable React composition, Convex, Supabase/PostgreSQL optimization, Vercel deployments.
- **Quality & Workflows**: Systematic debugging, dead-code cleanup, structured code reviews.

---

## Included Skills (76 Total)

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

### Additional Skills (41)

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

Skill source and version metadata is recorded in [`skills-lock.json`](skills-lock.json).

---

## How to Reuse Across Projects

### Option 1: Native In-Project Plugin (Already Active Here)
When placed in `.agents/plugins/steve-prodex/`, the agent automatically discovers and activates all 33 skills.

### Option 2: Shared Local Path
If you want to keep one copy on your machine and reference it in other projects:
1. Move or copy `steve-prodex` to a central directory (e.g., `D:\agent-plugins\steve-prodex`).
2. In any project, create `.agents/plugins.json`:
   ```json
   {
     "entries": [
       { "path": "D:/agent-plugins/steve-prodex" }
     ]
   }
   ```

### Option 3: Separate GitHub Repository (For Teams / Multi-Device)
In any other project, simply add it as a Git submodule:
```bash
git submodule add https://github.com/steven-codex/steve-prodex.git .agents/plugins/steve-prodex
```
