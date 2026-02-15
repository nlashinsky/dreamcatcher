# Dreamcatcher

**Capture ideas the moment they spark — without leaving your flow.**

You're deep in building something when it hits you: *"We should build an internal tool that tracks deployment health across all our services."* Instead of losing that thought or context-switching to a notes app, you type one command and you're back to work in seconds.

```
/dream internal tool that tracks deployment health across services
```

Dreamcatcher asks a few quick questions to sharpen the idea, then lets you choose:

- **Build it** — an autonomous agent plans and scaffolds the entire project in the background
- **Plan it** — generates a detailed spec (tech stack, data model, user flows) you can build from later
- **Save it** — stashes it in your idea vault for a rainy day

That's it. Idea captured. Back to work.

Works for anything you can plan and build: app concepts, internal tools, side projects, work initiatives, features, CLI utilities, automations, prototypes.

---

## Install

Add the Dreamcatcher marketplace to Claude Code, then install the plugin:

```
/plugin marketplace add nlashinsky/dreamcatcher
/plugin install dreamcatcher@dreamcatcher
```

Choose **User** scope to load it automatically in every session, or **Project** scope to enable it per-repo.

That's it — `/dream` is now available every time you open Claude Code.

<details>
<summary>Alternative: load manually per session</summary>

```bash
claude --plugin-dir /path/to/dreamcatcher/plugins/dreamcatcher
```

</details>

---

## Commands

### `/dream <idea>` — Capture an Idea

The main command. Describe your idea in a few words and Dreamcatcher handles the rest.

```
/dream recipe sharing app where friends rate each other's cooking
/dream CLI tool that generates changelogs from git commits
/dream internal dashboard for tracking team velocity
/dream Slack bot that summarizes long threads
/dream mobile app for tracking house plant watering schedules
```

Each idea gets refined through a quick Socratic Q&A, saved as structured JSON, and tagged automatically. You choose what happens next.

### `/dreams` — Browse Your Vault

See everything you've captured at a glance.

```
/dreams              # Show all non-archived ideas
/dreams captured     # Only ideas waiting for action
/dreams planned      # Ideas with generated plans
/dreams built        # Completed builds
/dreams all          # Everything, including archived
```

Output:

```
| #  | Title                    | Status   | Tags              | Captured |
|----|--------------------------|----------|-------------------|----------|
| 1  | Recipe Sharing App       | planned  | social, food      | 2d ago   |
| 2  | Deploy Health Dashboard  | captured | devops, internal  | 5d ago   |
| 3  | Slack Thread Summarizer  | built    | productivity      | 1w ago   |

3 ideas (1 captured, 1 planned, 1 built)
```

### `/dream-plan <id>` — Generate a Detailed Plan

Turn a rough idea into a comprehensive spec.

```
/dream-plan 2
/dream-plan 2 --regenerate   # Fresh plan from scratch
```

Plans include:
- App overview and value proposition
- Core features broken into MVP, Phase 2, and Nice-to-have
- Tech stack with reasoning for each choice
- Data model with entities, fields, and relationships
- Architecture decisions (API design, auth, storage)
- Step-by-step user flows
- UI/UX notes and key screens
- Phased build checklist
- Complexity estimate

Plans are saved as Markdown at `~/.dreamcatcher/plans/` — readable, editable, and ready to build from.

### `/dream-build <id>` — Build It

Turn a plan into a real, running project.

```
/dream-build 2                        # Build MVP in foreground
/dream-build 2 --scope full           # Build all phases
/dream-build 2 --dir ~/projects/app   # Custom directory
```

The builder agent will:
1. Create and initialize the project with the right framework
2. Implement features phase by phase
3. Set up README, CLAUDE.md, and git history
4. Log decisions and progress to a build log

Build in the foreground or kick it off in the background and keep working.

### `/dream-status <id> <action>` — Quick Updates

```
/dream-status 2 archived              # Shelve an idea
/dream-status 2 captured              # Un-archive
/dream-status 2 note "use Supabase"   # Add a note for later
/dream-status 2                       # View current status
```

---

## How It Works

```
  You're coding away...
       |
  Idea strikes
       |
  /dream "your idea"
       |
  3-4 quick questions ──→ Idea saved to ~/.dreamcatcher/ideas/
       |
  What do you want to do?
       |
  ┌────┼────────────┐
  │    │             │
Build  Plan        Save
  │    │             │
  ▼    ▼             ▼
Agent  Detailed     Vault
builds spec         (review
project generated   later)
  │    │
  ▼    ▼
~/dev/dreamcatcher-projects/
```

### Storage

All data lives globally at `~/.dreamcatcher/` so your ideas persist across projects and sessions:

```
~/.dreamcatcher/
├── ideas/          # One JSON file per idea (e.g., 001-deploy-dashboard.json)
├── plans/          # Generated plan docs (Markdown)
├── builds/         # Build logs and progress
└── config.json     # Settings and ID counter
```

### Session Hook

When you start a new Claude Code session, Dreamcatcher shows a quick summary:

```
Dreamcatcher: 5 ideas (2 captured, 2 planned, 1 built) - /dreams to review
```

### Agents

Two specialized agents handle the heavy lifting:

- **dream-planner** — Product designer and architect. Takes a rough idea and produces a buildable 10-section spec.
- **dream-builder** — Full-stack developer. Takes a plan and scaffolds a working project with git history and documentation.

Both can run in the background so you stay in flow.

---

## Idea Lifecycle

```
captured → planning → planned → building → built
    │                    │                    │
    └──── archived ◄─────┴────────────────────┘
              │
          captured  (un-archive)
```

Ideas can be archived at any stage and brought back when you're ready.

---

## Plugin Structure

```
dreamcatcher/
├── .claude-plugin/
│   └── marketplace.json          # Marketplace manifest
├── plugins/
│   └── dreamcatcher/
│       ├── .claude-plugin/
│       │   └── plugin.json       # Plugin manifest
│       ├── commands/
│       │   ├── dream.md          # Main capture command
│       │   ├── dreams.md         # Idea vault browser
│       │   ├── dream-plan.md     # Plan generator
│       │   ├── dream-build.md    # Project builder
│       │   └── dream-status.md   # Status updates
│       ├── agents/
│       │   ├── dream-planner.md  # Planning agent
│       │   └── dream-builder.md  # Building agent
│       ├── skills/
│       │   └── dreamcatcher/
│       │       ├── SKILL.md      # Ambient awareness skill
│       │       └── references/
│       │           └── plan-template.md
│       ├── hooks/
│       │   ├── hooks.json
│       │   └── hooks-handlers/
│       │       └── session-start.sh
│       └── CLAUDE.md
└── README.md
```

---

## Contributing

Dreamcatcher is a Claude Code plugin — all logic lives in Markdown files that instruct Claude how to behave. To modify or extend it:

1. Clone the repo
2. Edit the command/agent/skill Markdown files in `plugins/dreamcatcher/`
3. Test with `claude --plugin-dir ./plugins/dreamcatcher`

No build step. No dependencies. Just Markdown.

---

## License

MIT
