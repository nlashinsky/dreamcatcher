---
description: Capture an idea — app concepts, features, tools, work projects — refine it with quick questions, then build it, plan it, or save it for later
argument-hint: <your idea in a few words>
---

# /dream — Capture and Act on an Idea

You are helping the user capture an idea using the Dreamcatcher system. Ideas can be anything: app concepts, internal tools, side projects, features for existing products, work initiatives, CLI utilities, automations — anything that can be planned and built. The user is likely in the middle of building something else, so be efficient but thorough enough to capture a useful idea.

## Input

The user's raw idea: $ARGUMENTS

If $ARGUMENTS is empty, ask the user: "What's the idea? Give me a quick description."

## Step 1: Initialize Storage (if needed)

Check if ~/.dreamcatcher/ exists. If not, create the full directory structure:

```bash
mkdir -p ~/.dreamcatcher/ideas ~/.dreamcatcher/plans ~/.dreamcatcher/builds
```

If ~/.dreamcatcher/config.json does not exist, create it:

```json
{
  "next_id": 1,
  "default_build_dir": "~/dev/dreamcatcher-projects",
  "auto_plan": false,
  "show_pending_on_start": true
}
```

## Step 2: Socratic Refinement

Ask 3-5 quick, targeted questions to sharpen the idea. Use the AskUserQuestion tool with multiple choice options where possible to keep it fast.

Adapt your questions based on the type of idea:

**For app/tool ideas, ask:**
1. Who's the primary user / target audience?
2. What platform? (web app, mobile app, CLI tool, desktop app, browser extension, internal tool)
3. What's the ONE core feature that makes this idea valuable?
4. Any specific tech preferences or constraints? (e.g., "use Next.js", "needs to work offline", "must integrate with Slack")

**For work/team projects, ask:**
1. What problem does this solve and for whom?
2. What does the end result look like? (tool, service, automation, dashboard, API, etc.)
3. What's the scope? (MVP/proof of concept, production-ready, internal prototype)
4. Any existing systems it needs to integrate with?

Keep it to 3-4 questions max. Use AskUserQuestion with smart default options based on the idea.

## Step 3: Save the Idea

Read ~/.dreamcatcher/config.json to get the current next_id.

Generate a slug from the idea title (lowercase, hyphens, max 40 characters, no special characters).

Pad the ID to 3 digits (e.g., 1 → "001", 12 → "012").

Write the idea JSON to ~/.dreamcatcher/ideas/{NNN}-{slug}.json:

```json
{
  "id": <next_id>,
  "slug": "<generated-slug>",
  "title": "<clean, concise title derived from the idea>",
  "raw_input": "<exact text the user typed after /dream>",
  "refined_summary": "<1-2 sentence summary incorporating the refinement answers>",
  "refinement_answers": {
    "target_user": "<from question 1>",
    "platform": "<from question 2>",
    "core_feature": "<from question 3>",
    "tech_preferences": "<from question 4, or null>"
  },
  "status": "captured",
  "tags": ["<2-4 auto-generated tags based on the idea>"],
  "created_at": "<ISO-8601 timestamp>",
  "updated_at": "<ISO-8601 timestamp>",
  "captured_context": {
    "working_on": "<name of current project directory>",
    "directory": "<current working directory path>"
  },
  "plan_path": null,
  "build_path": null,
  "notes": []
}
```

Update config.json to increment next_id by 1.

## Step 4: Ask What To Do

Use AskUserQuestion to present the three options:

**Question:** "Idea #{id} captured: '{title}' — What do you want to do with it?"

**Options:**
1. **"Build it now"** — "Spawn an autonomous agent to plan and build the full project in the background. You can keep working."
2. **"Plan it"** — "Generate a detailed plan document (tech stack, features, data model, user flows) that you can review and build from later."
3. **"Save for later"** — "Stash it in your idea vault. Review anytime with /dreams."

## Step 5: Execute the Choice

### If "Build it now":
1. Update the idea status to "building"
2. Use the Task tool to spawn a background agent (subagent_type: "general-purpose", run_in_background: true) with this prompt:

   "You are the Dreamcatcher builder. Read the idea file at ~/.dreamcatcher/ideas/{NNN}-{slug}.json. First, generate a comprehensive plan following this structure: App Overview, Core Features (MVP vs later), Tech Stack with reasoning, Data Model, Architecture, User Flows, UI/UX Notes, Build Phases, Complexity Estimate. Save the plan to ~/.dreamcatcher/plans/{NNN}-{slug}.md and update the idea's plan_path. Then build the MVP: create the project at ~/dev/dreamcatcher-projects/{slug}/, initialize with the chosen tech stack, implement MVP features, create README.md and CLAUDE.md, make git commits. Update the idea status to 'built' when done, or 'build_failed' with notes if blocked. Log all progress to ~/.dreamcatcher/builds/{NNN}-{slug}/build-log.md."

3. Tell the user: **"Building in the background! Keep working — check progress anytime with `/dreams`."**

### If "Plan it":
1. Update the idea status to "planning"
2. Use the Task tool to spawn an agent (subagent_type: "general-purpose") with this prompt:

   "You are the Dreamcatcher planner. Read the idea file at ~/.dreamcatcher/ideas/{NNN}-{slug}.json. Generate a comprehensive app plan with these sections: 1) App Overview & value proposition, 2) Core Features — MVP (Phase 1) vs Phase 2 vs Nice-to-have (Phase 3), 3) Tech Stack — table with Layer/Choice/Reasoning, 4) Data Model — entities with fields and types, 5) Architecture — API routes, auth approach, system design, 6) User Flows — 2-3 primary flows step-by-step, 7) UI/UX Notes — key screens and navigation, 8) Build Phases — phased checklist with tasks, 9) Complexity Estimate — Simple/Medium/Complex with reasoning, 10) Open Questions. Save to ~/.dreamcatcher/plans/{NNN}-{slug}.md. Update the idea JSON: status → 'planned', plan_path → the file path."

3. Display the generated plan to the user.
4. Tell the user: **"Plan saved! Review anytime with `/dream-plan {id}`. Ready to build? Run `/dream-build {id}`."**

### If "Save for later":
1. The idea is already saved from Step 3.
2. Tell the user: **"Idea #{id} saved to your vault. Review your ideas anytime with `/dreams`."**
3. That's it. Keep it brief so the user gets back to work.
