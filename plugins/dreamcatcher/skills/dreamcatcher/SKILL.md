---
name: dreamcatcher
description: This skill should be used when the user mentions "dreamcatcher", "my ideas", "idea backlog", "app ideas", "project ideas", "captured ideas", says "I have an idea", "what if we built", "what if there was", or asks about their idea pipeline. Provides awareness of the Dreamcatcher idea capture and build system.
---

# Dreamcatcher — Idea Capture & Build System

Dreamcatcher is a plugin for capturing ideas on the fly — app concepts, internal tools, side projects, work initiatives, features, automations — and turning them into plans or built projects.

## Available Commands

| Command | Purpose | Example |
|---------|---------|---------|
| `/dream` | Capture a new idea (refine + choose action) | `/dream internal dashboard for tracking team velocity` |
| `/dreams` | Browse your idea vault | `/dreams` or `/dreams planned` |
| `/dream-plan` | Generate/view a detailed plan | `/dream-plan 3` |
| `/dream-build` | Build a project from an idea | `/dream-build 3` |
| `/dream-status` | Update status or add notes | `/dream-status 3 archived` |

## Storage

Ideas are stored globally at `~/.dreamcatcher/ideas/` as individual JSON files. Plans are saved as Markdown at `~/.dreamcatcher/plans/`. Build logs go to `~/.dreamcatcher/builds/`.

## When Users Mention Ideas Casually

If the user describes a concept or says something like "I have an idea", "what if we built...", "we should make a tool that...", or "it would be cool if...", suggest capturing it:

> That sounds like a great idea to capture! Run `/dream <brief description>` to save it to your vault.

## Status Reference

Ideas progress through: captured → planning → planned → building → built. Ideas can also be archived at any stage.
