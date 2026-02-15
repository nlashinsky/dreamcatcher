# Dreamcatcher Plan Template

Use this structure when generating plans for Dreamcatcher ideas. Each section should be substantive and specific enough to build from.

## 1. App Overview

One paragraph describing: what the app does, who the target users are, what problem it solves, and what makes it valuable.

## 2. Core Features

### MVP (Phase 1) — Build these first
- **Feature Name**: Brief description of what it does and why it's essential

### Phase 2 — Build after MVP works
- **Feature Name**: Description

### Phase 3 (Nice-to-have) — Polish and extras
- **Feature Name**: Description

## 3. Tech Stack

| Layer | Choice | Why |
|-------|--------|-----|
| Frontend | e.g., Next.js 14 (App Router) | Reasoning |
| Backend | e.g., Next.js API routes / tRPC | Reasoning |
| Database | e.g., PostgreSQL via Prisma | Reasoning |
| Auth | e.g., NextAuth.js / Clerk | Reasoning |
| Hosting | e.g., Vercel | Reasoning |
| Styling | e.g., Tailwind CSS + shadcn/ui | Reasoning |

## 4. Data Model

### Entity: EntityName
| Field | Type | Notes |
|-------|------|-------|
| id | uuid | Primary key |
| created_at | timestamp | Auto-set |
| ... | ... | ... |

**Relationships:** Describe how entities relate (one-to-many, many-to-many, etc.)

## 5. Architecture

- **Pattern**: Monolith / microservices / serverless
- **API Design**: REST routes or tRPC procedures — list the main ones
- **Auth Flow**: How users sign up, log in, stay authenticated
- **File Storage**: Where uploaded files/images go (if applicable)
- **Real-time**: WebSockets / SSE / polling (if applicable)

## 6. User Flows

### Flow 1: [Primary Action Name]
1. User navigates to...
2. User fills in / clicks...
3. System validates / processes...
4. User sees...

### Flow 2: [Second Most Important Action]
1. ...

### Flow 3: [Third Flow] (optional)
1. ...

## 7. UI/UX Notes

**Key Screens:**
- Screen 1: Purpose, key elements
- Screen 2: Purpose, key elements

**Navigation:** How users move between screens (sidebar, tabs, bottom nav, etc.)

**Design Direction:** Minimal/clean, playful, professional, etc.

## 8. Build Phases

### Phase 1: MVP (estimated effort: X)
- [ ] Task 1
- [ ] Task 2
- [ ] Task 3

### Phase 2: Core Features (estimated effort: X)
- [ ] Task 4
- [ ] Task 5

### Phase 3: Polish (estimated effort: X)
- [ ] Task 6
- [ ] Task 7

## 9. Complexity Estimate

**Rating:** Simple / Medium / Complex

**Reasoning:** Brief explanation of what drives the complexity (auth, real-time, complex data model, third-party integrations, etc.)

## 10. Open Questions

- Question 1 that needs a decision?
- Question 2?
- Question 3?
