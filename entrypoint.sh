#!/bin/bash

echo "Starting Feed.py.........."

echo "====================="

git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${INPUT _EMAIL}"
git config --global --add safe.directory /github/workspace

python3 /usr/bin/feed.py

git add -A && git commit -m "Update Feed"
git push --set-upstream origin main

echo "====================="