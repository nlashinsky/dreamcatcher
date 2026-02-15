---
description: Generate or view a detailed plan for a captured idea
argument-hint: <idea-id> [--regenerate]
---

# /dream-plan — Generate or View a Plan

You are expanding a captured Dreamcatcher idea into a comprehensive app plan.

## Arguments

$ARGUMENTS — expected: idea ID number, optionally --regenerate flag

## Step 1: Load the Idea

Parse the idea ID from $ARGUMENTS. Read the matching JSON file from ~/.dreamcatcher/ideas/ (look for files starting with the zero-padded ID, e.g., "001-").

If not found: "Idea #{id} not found. Run `/dreams` to see your ideas."

## Step 2: Check for Existing Plan

If the idea's plan_path is set AND the file exists AND --regenerate was NOT passed:
- Read and display the existing plan file
- At the end: "Want a fresh plan? Run `/dream-plan {id} --regenerate`"
- Stop here.

## Step 3: Generate the Plan

Update the idea status to "planning" and save.

Generate a comprehensive plan using this structure:

### 1. App Overview
One paragraph: what the app does, who it's for, what problem it solves. Use the refined_summary and refinement_answers from the idea JSON.

### 2. Core Features
#### MVP (Phase 1)
- Feature with brief description
#### Phase 2
- Additional features
#### Phase 3 (Nice-to-have)
- Polish features

### 3. Tech Stack
| Layer | Choice | Why |
|-------|--------|-----|
| Frontend | ... | ... |
| Backend | ... | ... |
| Database | ... | ... |
| Auth | ... | ... |
| Hosting | ... | ... |

Respect the user's tech_preferences from refinement_answers if specified.

### 4. Data Model
For each entity:
| Field | Type | Notes |
|-------|------|-------|
| id | uuid | Primary key |
| ... | ... | ... |

Include relationships between entities.

### 5. Architecture
- Monolith vs microservices decision
- API route structure
- Authentication approach
- File/media storage approach (if relevant)

### 6. User Flows
2-3 primary user flows described step-by-step:
1. User does X
2. System responds with Y
3. User sees Z

### 7. UI/UX Notes
- Key screens (list with brief descriptions)
- Navigation structure
- Design principles / aesthetic direction

### 8. Build Phases
#### Phase 1: MVP
- [ ] Task 1
- [ ] Task 2
#### Phase 2: Core Features
- [ ] Task 3
#### Phase 3: Polish
- [ ] Task 4

### 9. Complexity Estimate
Simple / Medium / Complex — with brief reasoning.

### 10. Open Questions
- Decisions that need to be made before or during building.

## Step 4: Save the Plan

Write the plan as Markdown to: ~/.dreamcatcher/plans/{NNN}-{slug}.md

Update the idea JSON:
- status → "planned"
- plan_path → the path to the plan file
- updated_at → current ISO-8601 timestamp

## Step 5: Present

Display the full plan to the user.

At the end:
> **Plan saved!** Review anytime with `/dream-plan {id}`.
> Ready to build? Run `/dream-build {id}` to scaffold the project.
