# Dreamcatcher

A Claude Code plugin for capturing ideas on the fly — app concepts, feature requests, side projects, work initiatives — and turning them into plans or built projects.

## Commands

| Command | Purpose |
|---------|---------|
| `/dream <idea>` | Capture an idea, refine with questions, choose to build/plan/save |
| `/dreams` | Browse your idea vault |
| `/dream-plan <id>` | Generate or view a detailed plan |
| `/dream-build <id>` | Build a project from an idea |
| `/dream-status <id> <action>` | Update status or add notes |

## Storage

All data is stored globally at `~/.dreamcatcher/`:
- `ideas/` — One JSON file per idea (e.g., `001-recipe-app.json`)
- `plans/` — Generated plan documents (Markdown)
- `builds/` — Build logs
- `config.json` — Settings and ID counter

## Development

To test changes to this plugin:
```bash
claude --plugin-dir /path/to/dreamcatcher/plugins/dreamcatcher
```

Then test with `/dream internal dashboard for tracking team velocity` and verify the flow works.
