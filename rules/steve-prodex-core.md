# Steve ProDex Autonomous Operating Protocol

The agent MUST automatically and proactively apply the relevant skill standards from the `steve-prodex` suite on EVERY task, without requiring the user to explicitly request them or invoke slash commands.

## 1. Frontend & UI Tasks (Automatic Polish & Taste)
Whenever building, styling, or refactoring user interfaces:
- **Aesthetic Direction**: Strictly enforce `gpt-tasteskill` and `frontend-design`. Avoid generic AI layouts, boring center-aligned blocks, and cheap meta-labels ("SECTION 01", "ABOUT US"). Use wide editorial typography, generous vertical padding (`py-24` to `py-48`), and mathematically gapless bento grids.
- **Detail Engineering**: Strictly enforce `make-interfaces-feel-better` and `impeccable`:
  - Concentric border radius: `outerRadius = innerRadius + padding`.
  - Optical alignment over raw geometric centering (especially icons and badges).
  - Tactile feedback: `active:scale-[0.96]` on buttons and clickable controls.
  - Headings: `text-wrap: balance`. Body text: `text-wrap: pretty`. Dynamic numbers: `tabular-nums`.
  - Layered subtle shadows over heavy solid borders.
  - Image outlines: `1px` subtle outline (`rgba(0,0,0,0.1)` light mode, `rgba(255,255,255,0.1)` dark mode).
- **Motion & Transitions**: Automatically apply `react-view-transitions` and `improve-animations`:
  - Never use `transition: all`. Always specify properties explicitly.
  - Interruptible spring animations with `bounce: 0`.
  - Split and stagger enter transitions; keep exits softer and subtle.

## 2. Coding, Architecture & Implementation (Automatic Ponytail / YAGNI)
Whenever writing code, adding features, or creating modules:
- Automatically apply `ponytail` discipline:
  - Stop at the first rung of the ladder: Does it need to exist at all? (YAGNI).
  - Check existing code first: Reuse utilities, helpers, types, and components already in the codebase.
  - Standard library and native platform features over third-party dependencies.
  - Fewest files possible, shortest working diff that solves the root problem.
  - No speculative abstractions, no single-implementation factories, no boilerplate "for later".
  - Code first, followed by concise rationale.

## 3. Bug Fixing & Troubleshooting (Automatic Systematic Debugging)
Whenever diagnosing an error, test failure, or unexpected behavior:
- Automatically apply `systematic-debugging`:
  - Never guess or patch superficial symptoms.
  - Trace the complete flow and check all callers of the target function.
  - Fix at the root cause where all callers route through.
  - Verify assumptions with logs, tests, or dry runs before finalizing the fix.

## 4. Fullstack, Database & Component Architecture
- React / Next.js: Follow `composition-patterns` and `react-best-practices` (prevent unnecessary re-renders, avoid waterfall fetching).
- Supabase / Postgres: Follow `supabase-postgres-best-practices` (appropriate indexes, RLS policies, avoiding N+1 queries).
- Convex: Follow `convex-best-practices`.
- shadcn/ui: Follow `shadcn` composition conventions.

## 5. Product & Copywriting
- When drafting landing page text or marketing headlines, automatically apply `landing-page-copywriter` (PAS/AIDA frameworks, punchy value propositions).
- When planning major features or systems, automatically apply `brainstorming` and `prd` standards.
