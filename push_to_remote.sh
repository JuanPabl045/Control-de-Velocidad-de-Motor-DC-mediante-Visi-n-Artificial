#!/bin/sh
# Usage: ./push_to_remote.sh <git-remote-url>
if [ -z "$1" ]; then
  echo "Usage: $0 <git-remote-url>"
  exit 1
fi
REMOTE="$1"

git init
git add .
git commit -m "Initial project import"
git remote add origin "$REMOTE"
git branch -M main
git push -u origin main

echo "Done."
