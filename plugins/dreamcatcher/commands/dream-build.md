---
description: Build a project from a Dreamcatcher idea plan (runs autonomously)
argument-hint: <idea-id> [--dir <path>] [--scope mvp|full]
---

# /dream-build — Build a Project from an Idea

You are building a real project from a Dreamcatcher idea.

## Arguments

$ARGUMENTS — expected: idea ID number. Optional flags: --dir <path>, --scope mvp|full

## Step 1: Load Idea and Plan

Parse the idea ID from $ARGUMENTS. Read the idea JSON from ~/.dreamcatcher/ideas/.

If not found: "Idea #{id} not found. Run `/dreams` to see your ideas."

If the idea has no plan (plan_path is null or the file doesn't exist):
- Tell the user: "This idea needs a plan first. Generating one now..."
- Follow the plan generation process (same as /dream-plan) before continuing.

Read the plan from the idea's plan_path.

## Step 2: Parse Flags

- **--dir**: Build directory. Default: ~/dev/dreamcatcher-projects/{slug}/
- **--scope**: "mvp" (default) or "full"

Create the default build directory parent if it doesn't exist: mkdir -p ~/dev/dreamcatcher-projects/

## Step 3: Confirm with User

Show a brief summary:

> **Ready to build: "{title}"**
> - **Scope:** {mvp or full}
> - **Directory:** {build path}
> - **Tech stack:** {from plan}
> - **Complexity:** {from plan}
>
> This will create the project directory and scaffold the app. Proceed?

Use AskUserQuestion with options: "Yes, build it" / "Build in background" / "Cancel"

## Step 4: Execute Build

### If "Yes, build it" (foreground):

Update the idea status to "building" and save.

Based on the plan, systematically:

1. **Create project directory**: mkdir -p {build_path}
2. **Initialize project**: Based on tech stack (e.g., npx create-next-app@latest, cargo init, etc.)
3. **Set up structure**: Create directories and config files per the plan
4. **Implement MVP features**: Write actual working code for Phase 1 features
5. **If scope is "full"**: Continue through Phase 2 and Phase 3
6. **Create README.md**: Include project overview, setup instructions, how to run, tech stack used
7. **Create CLAUDE.md**: Include project overview, architecture notes, key files, build/run/test commands
8. **Git init + commit**: git init && git add -A && git commit -m "Initial scaffold from Dreamcatcher"
9. **Write build log**: Save progress/decisions to ~/.dreamcatcher/builds/{NNN}-{slug}/build-log.md

Update idea JSON: status → "built", build_path → the directory, updated_at → now.

Present completion summary:
> **Build complete: "{title}"**
> - **Location:** {build_path}
> - **To start:** `cd {build_path} && {run command}`
> - **Build log:** ~/.dreamcatcher/builds/{NNN}-{slug}/build-log.md

### If "Build in background":

Update idea status to "building".

Use the Task tool with run_in_background: true, subagent_type: "general-purpose" to spawn a builder agent with the full plan context and build instructions (same as above).

Tell the user:
> **Building in the background!** Keep working. Check status with `/dreams` or look at the build log at ~/.dreamcatcher/builds/{NNN}-{slug}/build-log.md

### If "Cancel":
> Build cancelled. The plan is still saved — run `/dream-build {id}` when you're ready.
