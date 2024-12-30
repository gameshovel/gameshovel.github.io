#!/bin/bash

# Navigate to the project directory
cd /Users/albertreed/projects/gameshovel.github.io

# Use jq to set the message to null in src/status.json
jq '.message = null' src/status.json > tmp.$$.json && mv tmp.$$.json src/status.json

# Add the changes to git
git add src/status.json

# Commit the changes
git commit -m "Set message to null in status.json"

# Push the changes to GitHub
git push origin main