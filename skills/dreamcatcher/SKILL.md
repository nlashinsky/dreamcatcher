---
name: dreamcatcher
description: This skill should be used when the user mentions "dreamcatcher", "my ideas", "idea backlog", "app ideas", "captured ideas", says "I have an idea", "what if there was an app", or asks about their idea pipeline. Provides awareness of the Dreamcatcher idea capture and build system.
---

# Dreamcatcher — Idea Capture & Build System

Dreamcatcher is a plugin for capturing app ideas on the fly and turning them into plans or built projects.

## Available Commands

| Command | Purpose | Example |
|---------|---------|---------|
| `/dream` | Capture a new idea (refine + choose action) | `/dream recipe sharing app with ratings` |
| `/dreams` | Browse your idea vault | `/dreams` or `/dreams planned` |
| `/dream-plan` | Generate/view a detailed plan | `/dream-plan 3` |
| `/dream-build` | Build a project from an idea | `/dream-build 3` |
| `/dream-status` | Update status or add notes | `/dream-status 3 archived` |

## Storage

Ideas are stored globally at `~/.dreamcatcher/ideas/` as individual JSON files. Plans are saved as Markdown at `~/.dreamcatcher/plans/`. Build logs go to `~/.dreamcatcher/builds/`.

## When Users Mention Ideas Casually

If the user describes an app concept or says something like "I have an idea" or "what if there was an app that...", suggest capturing it:

> That sounds like a great idea to capture! Run `/dream <brief description>` to save it to your vault.

## Status Reference

Ideas progress through: captured → planning → planned → building → built. Ideas can also be archived at any stage.
