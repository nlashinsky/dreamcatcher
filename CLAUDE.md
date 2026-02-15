# Dreamcatcher

A Claude Code plugin for capturing app ideas on the fly and turning them into plans or built projects.

## Plugin Structure

This is a Claude Code plugin. To use it:

```bash
claude --plugin-dir /Users/nicklashinsky/dev/AI-playground/dreamcatcher
```

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

To test changes to this plugin, run Claude Code with:
```bash
claude --plugin-dir .
```

Then test with `/dream test idea for a todo app` and verify the flow works.
