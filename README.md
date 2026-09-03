# Steve ProDex (`steve-prodex`)

A comprehensive, production-grade developer experience and design engineering plugin for AI coding agents (Google Antigravity, Gemini IDE, Cursor, Claude Code, etc.).

## Overview

`steve-prodex` packages **29 deduplicated, battle-tested skills** into a single cohesive unit. It spans the entire development lifecycle:
- **Product & Clarification**: Socratic brainstorming, PRDs, conversion copywriting.
- **Frontend Taste & Polish**: Awwwards-level GSAP layouts, 20-dimension UI polish, optical alignment, and concentric radii.
- **Micro-interactions & Motion**: React view transitions, interruptible spring physics, stagger animations.
- **Code Minimalism (Ponytail)**: Senior-dev YAGNI discipline, native platform features before dependencies, and shortest working diffs.
- **Architecture & Fullstack**: Scalable React composition, Convex, Supabase/PostgreSQL optimization, Vercel deployments.
- **Quality & Workflows**: Systematic debugging, dead-code cleanup, structured code reviews.

---

## Included Skills (29 Total)

| Skill | Category | Description |
| :--- | :--- | :--- |
| `agent-browser` | Automation | Browser automation and web interaction workflows |
| `brainstorming` | Product | Socratic questioning, idea shaping, and requirement clarification |
| `clone-website` | Frontend | Website reverse-engineering and visual layout cloning |
| `composition-patterns` | Frontend | Scalable React component composition architectures |
| `convex-best-practices` | Backend | Production-ready reactive Convex backend patterns |
| `deploy-to-vercel` | DevOps | Vercel deployment workflows and build optimization |
| `frontend-design` | Frontend | Anthropic's high-quality frontend design guidelines |
| `frontend-skill` | Frontend | Robust modern UI structure for landing pages and apps |
| `gpt-tasteskill` | Design / Motion | Elite GSAP motion, gapless bento grids, and typography |
| `impeccable` | UI Polish | Paul Bakaus's 20-dimension design critique and polish suite |
| `improve-animations` | Motion | Emil Kowalski's spring tuning, interrupts, and gesture physics |
| `landing-page-copywriter` | Product | Conversion-focused value props and landing page copy |
| `make-interfaces-feel-better` | UI Polish | Emil Kowalski's 16 core principles (optical alignment, concentric radius) |
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

---

## How to Reuse Across Projects

### Option 1: Native In-Project Plugin (Already Active Here)
When placed in `.agents/plugins/steve-prodex/`, the agent automatically discovers and activates all 29 skills.

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
To share with teammates or use across devices:
1. Open terminal in `.agents/plugins/steve-prodex/`
2. Run:
   ```bash
   git init
   git add .
   git commit -m "feat: initial release of steve-prodex plugin"
   git remote add origin https://github.com/<your-username>/steve-prodex.git
   git branch -M main
   git push -u origin main
   ```
3. In any other project, simply add it as a Git submodule:
   ```bash
   git submodule add https://github.com/<your-username>/steve-prodex.git .agents/plugins/steve-prodex
   ```
