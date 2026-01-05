#!/bin/sh
# Simple script to create a new notebook entry
# Usage: ./bin/author/new-entry.sh "my-post-title"

if [ -z "$1" ]; then
    echo "Usage: $0 <post-slug>"
    echo "Example: $0 my-first-post"
    exit 1
fi

SLUG="$1"
TIMESTAMP=$(date +%s)
FILENAME="entries/${TIMESTAMP}-${SLUG}.md"

# Get timezone (default to EST if not set)
TZ_NAME=${TZ:-America/New_York}

# Get location (can be customized)
LOCATION="Your Location"

cat > "$FILENAME" << EOF
---
tz: ${TZ_NAME}
location: ${LOCATION}
---

# Your Title Here

Your content here.

Use @sidenote: for margin notes.
EOF

echo "Created new entry: $FILENAME"
echo "Open this file in Obsidian to start writing!"
