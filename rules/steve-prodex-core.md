# Steve ProDex Operating Protocol

The `steve-prodex` suite is installed globally: 92 skills plus 282 specialist agents from The Agency. Apply them proactively, without waiting for the user to name them. Apply **only the sections that match the current task** — a backend bug fix does not need the UI rules, and loading unrelated skills wastes context.

## 0. Route first
Before working, classify the task (plan/design, UI, code, bug, data, security, copy, video, analysis) and load only the matching skills below. If the user names a skill (`/ponytail`) or an agent ("use the frontend developer"), use exactly that.

## 1. Planning, designing & analysing something new
- Requirements fuzzy or the change is big → run `grilling` (user shortcut: `/grill-me`) before writing code: one round of numbered questions with a recommended answer each, until the design tree is settled.
- Then shape it with `brainstorming`, `idea-refine`, `prd`, `spec-driven-development` and `planning-and-task-breakdown`. Build in thin slices with `incremental-implementation`.
- Analysing an existing codebase or decision → `doubt-driven-development`, `source-driven-development`, `graphify` for structure, `documentation-and-adrs` to record the decision.

## 2. Frontend & UI (taste and polish)
- **Aesthetic direction**: `gpt-tasteskill`, `frontend-design`, `design-taste-frontend`, `antislop`. No generic AI layouts, no centred-block filler, no cheap meta-labels ("SECTION 01", "ABOUT US"). Wide editorial type, generous vertical padding (`py-24`–`py-48`), gapless bento grids.
- **Detail engineering**: `make-interfaces-feel-better`, `impeccable`, `emil-design-eng`, the `better-*` family.
  - Concentric radius: `outerRadius = innerRadius + padding`.
  - Optical over geometric alignment (icons, badges).
  - Tactile press: `active:scale-[0.96]` on clickable controls.
  - Headings `text-wrap: balance`, body `text-wrap: pretty`, changing numbers `tabular-nums`.
  - Layered soft shadows over heavy borders; 1px image outline (`rgba(0,0,0,0.1)` light / `rgba(255,255,255,0.1)` dark).
- **Motion**: `react-view-transitions`, `improve-animations`, `transitions-dev`. Never `transition: all`; interruptible springs with `bounce: 0`; staggered enters, softer exits.
- **Components & a11y**: `shadcn`, `21st-ui`, `web-design-guidelines`, `better-accessibility`.

## 3. Writing code (Ponytail / YAGNI)
Apply `ponytail` and `karpathy-guidelines` on every code change:
- Does it need to exist at all? Reuse existing helpers, types and components first.
- Standard library and native platform features before dependencies.
- Fewest files, shortest working diff that fixes the root problem. No speculative abstractions or "for later" boilerplate.
- Tests with `test-driven-development` when behaviour changes. Code first, short rationale after.

## 4. Bugs & failures
Apply `systematic-debugging` and `debugging-and-error-recovery`: reproduce, trace every caller, fix at the root, verify with a test, log or dry run. Never patch symptoms by guessing.

## 5. Fullstack, data & shipping
- React / Next.js: `composition-patterns`, `react-best-practices`. React Native / Expo: `react-native-skills`.
- Supabase / Postgres: `supabase-postgres-best-practices` (indexes, RLS, no N+1). Convex: `convex-best-practices`.
- APIs: `api-and-interface-design`. Deploy: `deploy-to-vercel`, `ci-cd-and-automation`, `shipping-and-launch`.
- Review: `requesting-code-review`, `receiving-code-review`, `code-review-and-quality`, `refactor-clean`.

## 6. Security
Auth, payments, user data or anything internet-facing → `security-and-hardening` and `owasp-top-10-testing`; deeper audits with `find-security-vulnerabilities-in-code` and the Strix skills. Only test systems the user owns or is authorised to test.

## 7. Product, copy & marketing
Landing copy → `landing-page-copywriter` (PAS/AIDA). Launch posts → `social-content`. SEO → `seo-audit`.

## 8. Video & motion graphics
Video, animated explainers, captions or HTML compositions → `hyperframes`, `hyperframes-core`, `hyperframes-cli`, `hyperframes-animation`, and `motionfields` for creative direction. Declare timing in the DOM (`data-*`, `class="clip"`), seekable runtimes, framework-owned media playback.

## 9. Agency specialists & model routing (Claude Code)
The main session runs on **Opus, medium effort**. It understands the request, plans, picks skills and agents, integrates results and does the final check. It does not do bulk mechanical work itself when a specialist fits.

Delegate to the matching agent from `~/.claude/agents/steve-prodex/` (names mirror their role, e.g. `engineering-frontend-developer`, `security-appsec-engineer`, `marketing-seo-specialist`). Each agent already carries its model:

| Tier | Colour | Used for |
|---|---|---|
| `haiku` | green | Copy, marketing, sales, docs, research summaries, product/PM, business and domain advice, git workflow, onboarding reads |
| `sonnet` (medium) | blue | Implementation, debugging, code review, testing, security, databases, UI build, game/XR/GIS engineering |

Rules:
1. **Small work stays inline.** Under ~5 tool calls, or a one-file edit: do it in the main session; spawning an agent costs more than it saves.
2. **Codebase searches** go to the built-in `Explore` agent with `model: haiku`.
3. **Escalate once, then take over.** If a haiku agent's result fails verification (build or tests fail, requirements missed, it hedges or asks something it could have looked up), re-dispatch the same agent with the model override `sonnet`. If sonnet also fails, the main session finishes the task itself.
4. **Parallelise independent work** (e.g. frontend + API + copy) by dispatching agents together; keep dependent steps sequential.
5. Agent output is input, not truth: the main session verifies it (run the tests, open the page, re-read the diff) before reporting done.

## 10. Antigravity
Antigravity has no per-agent model routing. The same specialists are installed there as skills named `agency-<agent-name>` (e.g. `agency-engineering-frontend-developer`); load the one that fits the task. Suggest the user switch to a lighter model for pure writing tasks and a stronger one for architecture.
