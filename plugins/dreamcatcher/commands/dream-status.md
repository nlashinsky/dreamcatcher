---
description: Update a Dreamcatcher idea's status or add notes
argument-hint: <idea-id> <archived|captured|note "text">
model: haiku
---

# /dream-status — Update Idea Status

You are updating a Dreamcatcher idea's status or adding notes.

## Arguments

$ARGUMENTS — expected: idea ID followed by action

## Instructions

Parse $ARGUMENTS:
- First token: idea ID number
- Second token: either a status keyword or "note"
- Remaining tokens: note text (if action is "note")

### Find the idea

Look for the matching JSON file in ~/.dreamcatcher/ideas/ (files starting with the zero-padded ID).

If not found: "Idea #{id} not found. Run `/dreams` to see your ideas."

### If action is a status keyword (archived, captured, planned):

Read the idea JSON, update status and updated_at, write back.

Respond: **Idea #{id} "{title}" → {new status}**

### If action is "note":

Read the idea JSON, append to the notes array:
```json
{
  "text": "<the note text>",
  "added_at": "<ISO-8601 timestamp>"
}
```
Update updated_at. Write back.

Respond: **Note added to idea #{id} "{title}"**

### If no action provided:

Show the idea's current status, any notes, and available transitions:
- captured → archived, planning
- planned → archived, building
- built → archived
- archived → captured (un-archive)
