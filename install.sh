#!/bin/bash
# Installation script for Claude Agent Factory
# Uses a transparent git clone, forcing HTTPS to avoid credential issues.

# Stop script on error
set -e

# --- CONFIGURATION ---
REPO_OWNER="YuniorGlez"
REPO_NAME="claude-agent-super-setup"
BRANCH="main"
TARGET_DIR=".claude"

SOURCE_REPO_URL="git@github.com:${REPO_OWNER}/${REPO_NAME}.git"
TEMP_DIR="/tmp/${REPO_NAME}_install"

echo "🚀 Starting Claude Agent Factory installation..."

# 1. Clone the repository using a method that avoids credential helpers
echo "   - Cloning repository transparently..."
# Clean up temp dir if it exists
if [ -d "$TEMP_DIR" ]; then
  rm -rf "$TEMP_DIR"
fi

# The magic is here: We temporarily override git's behavior for this command.
# -c http.extraHeader='AUTHORIZATION:' tells git to send an EMPTY Authorization header.
# This prevents git's credential helper from adding its own authentication.
# For a public repo, an empty auth header is perfectly fine.
git -c http.extraHeader='AUTHORIZATION:' clone --depth 1 "$SOURCE_REPO_URL" "$TEMP_DIR" > /dev/null 2>&1

# 2. Check if the target directory exists and create if not
if [ ! -d "$TARGET_DIR" ]; then
  echo "   - Creating directory '$TARGET_DIR'..."
  mkdir -p "$TARGET_DIR"
fi

# 3. Create necessary subdirectories to ensure a clean merge
mkdir -p "$TARGET_DIR/agents"
mkdir -p "$TARGET_DIR/commands"
mkdir -p "$TARGET_DIR/agent-templates"

echo "   - Setting up the agent factory..."
# 4. Copy files from the cloned repo
cp "$TEMP_DIR/.claude/agents/agent-architect.md" "$TARGET_DIR/agents/"
cp "$TEMP_DIR/.claude/commands/setup-agents.md" "$TARGET_DIR/commands/"
# Copy all templates
cp -r "$TEMP_DIR/.claude/agent-templates/." "$TARGET_DIR/agent-templates/"

# 5. Clean up temporary files
echo "   - Cleaning up..."
rm -rf "$TEMP_DIR"

echo "✅ Installation complete!"
echo "You can now run 'claude' in your project and use the '/setup-agents' command."
echo "Enjoy your new autonomous development team. ✨"