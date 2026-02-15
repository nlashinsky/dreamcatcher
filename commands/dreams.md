---
description: Browse your Dreamcatcher idea vault — see all captured, planned, and built ideas
argument-hint: [status filter: captured|planned|built|archived|all]
---

# /dreams — Browse Your Idea Vault

You are showing the user their Dreamcatcher idea backlog.

## Arguments

Optional filter: $ARGUMENTS

## Step 1: Check for Ideas

Read all JSON files from ~/.dreamcatcher/ideas/ directory.

If the directory doesn't exist or has no JSON files:
> **No ideas captured yet.** Use `/dream <your idea>` to capture one.
Stop here.

## Step 2: Parse and Filter

Parse each JSON file. Apply status filter if provided:
- If $ARGUMENTS contains "captured", "planned", "built", "building", "archived" → filter by that status
- If $ARGUMENTS contains "all" → show everything including archived
- If no filter → show all non-archived ideas (default)

## Step 3: Display Table

Sort by ID (ascending). Display as a markdown table:

```
| #  | Title               | Status   | Tags          | Captured |
|----|---------------------|----------|---------------|----------|
| 1  | Recipe Sharing App  | planned  | social, food  | 2d ago   |
| 2  | Habit Tracker       | captured | health        | 5d ago   |
| 3  | Dog Social Network  | built    | social, pets  | 1w ago   |
```

For the "Captured" column, show relative time (e.g., "2d ago", "1w ago", "3mo ago").

## Step 4: Summary and Actions

After the table:

**{N} ideas** ({breakdown by status, e.g., "2 captured, 1 planned, 1 built"})

Quick actions:
- `/dream-plan <id>` — generate a detailed plan
- `/dream-build <id>` — build the project
- `/dream-status <id> archived` — shelve an idea
- `/dream <idea>` — capture a new idea
