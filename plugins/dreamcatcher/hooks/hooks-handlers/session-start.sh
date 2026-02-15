#!/bin/bash
# Dreamcatcher: Show idea backlog summary on session start

DREAMCATCHER_DIR="$HOME/.dreamcatcher"

# Skip silently if dreamcatcher is not initialized
if [[ ! -d "$DREAMCATCHER_DIR/ideas" ]]; then
  exit 0
fi

# Check if there are any idea files
shopt -s nullglob
IDEAS=("$DREAMCATCHER_DIR/ideas/"*.json)
shopt -u nullglob

TOTAL=${#IDEAS[@]}

# Skip if no ideas
if [[ "$TOTAL" -eq 0 ]]; then
  exit 0
fi

# Count by status
CAPTURED=0
PLANNED=0
BUILDING=0
BUILT=0

for f in "${IDEAS[@]}"; do
  STATUS=$(grep -o '"status": "[^"]*"' "$f" | head -1 | cut -d'"' -f4)
  case "$STATUS" in
    captured) ((CAPTURED++)) ;;
    planned) ((PLANNED++)) ;;
    planning) ((PLANNED++)) ;;
    building) ((BUILDING++)) ;;
    built) ((BUILT++)) ;;
  esac
done

# Build status breakdown
PARTS=()
[[ $CAPTURED -gt 0 ]] && PARTS+=("${CAPTURED} captured")
[[ $PLANNED -gt 0 ]] && PARTS+=("${PLANNED} planned")
[[ $BUILDING -gt 0 ]] && PARTS+=("${BUILDING} building")
[[ $BUILT -gt 0 ]] && PARTS+=("${BUILT} built")

BREAKDOWN=$(IFS=', '; echo "${PARTS[*]}")

echo "Dreamcatcher: ${TOTAL} ideas (${BREAKDOWN}) - /dreams to review"
