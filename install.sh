#!/bin/bash
# Installation script for Claude Agent Super Setup

set -e

TARGET_DIR=".claude"
SOURCE_REPO="https://github.com/YuniorGlez/claude-agent-super-setup.git"
TEMP_DIR="/tmp/claude_agent_super_setup_install"

echo "🚀 Starting Claude Agent Super Setup installation..."

echo "   - Downloading the latest version..."
if [ -d "$TEMP_DIR" ]; then
  rm -rf "$TEMP_DIR"
fi
git clone --depth 1 "$SOURCE_REPO" "$TEMP_DIR" > /dev/null 2>&1

if [ ! -d "$TARGET_DIR" ]; then
  echo "   - Creating directory '$TARGET_DIR'..."
  mkdir -p "$TARGET_DIR"
fi

mkdir -p "$TARGET_DIR/agents"
mkdir -p "$TARGET_DIR/commands"
mkdir -p "$TARGET_DIR/agent-templates"

echo "   - Setting up the agent factory..."
cp "$TEMP_DIR/.claude/agents/agent-architect.md" "$TARGET_DIR/agents/"
cp "$TEMP_DIR/.claude/commands/setup-agents.md" "$TARGET_DIR/commands/"
cp -r "$TEMP_DIR/.claude/agent-templates/." "$TARGET_DIR/agent-templates/"

echo "   - Cleaning up..."
rm -rf "$TEMP_DIR"

echo "✅ Installation complete!"
echo "You can now run 'claude' in your project and use the '/setup-agents' command."
echo "Enjoy your new autonomous development team. ✨"