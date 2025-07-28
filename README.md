# Claude Agent Factory 🚀

Turn your Claude Code into a custom, autonomous development team for any project with a single command.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## What is Claude Agent Factory?

It's a "plug-and-play" system for Claude Code that lets you automatically generate a suite of specialized AI sub-agents and a collaboration protocol, all based on an analysis of your codebase.

### Key Features

*   **🤖 Custom AI Team:** Generates expert agents (frontend, backend, DB, etc.) specific to your tech stack.
*   **⚡ One-Command Install:** Sets up the entire system in seconds.
*   **📜 Template-Driven:** Easily customize and extend the types of agents that can be created.
*   **🤝 Collaboration Protocol:** Automatically creates a `claude.local.md` file with rules for your agents to work together efficiently.
*   **🔄 Non-Destructive:** Respects your existing configurations and only adds new functionality.

## Installation

Open your terminal at the **root of your project** and run this command:

```bash
bash <(curl -s https://raw.githubusercontent.com/YuniorGlez/claude-agent-factory/main/install.sh)
```

That's it. The script will copy the necessary structure (`.claude/agents`, `.claude/commands`, `.claude/templates`) into your project.

## Usage

1.  **Install:** Run the installation command above in your project.
2.  **Start Claude:** In the same terminal, run `claude`.
3.  **Generate Your Team:** Use the new command you just installed:
    ```
    /setup-agents
    ```
4.  **Enjoy!** Claude Code now has a team of specialists. When you ask for a new feature, the main Claude agent will delegate tasks to the appropriate sub-agents.

## How It Works

This system is built on a three-layer architecture:

1.  **Templates:** `.md` files in `.claude/templates/agents/` that define the base structure for each type of agent.
2.  **The Architect:** A meta-agent (`agent-architect`) that analyzes your project, picks the right templates, and customizes them.
3.  **The Command:** A simple slash command (`/setup-agents`) that activates the architect to build your team.

## Customization

You can create your own agents by adding new templates to the `.claude/templates/agents/` directory. For example, to create a testing agent:

1.  Create a `testing-template.md` file in `.claude/templates/agents/`.
2.  Define its structure with placeholders like `{{AGENT_NAME}}`.
3.  The next time you run `/setup-agents`, the architect will be able to use your new template if it detects a need for a testing specialist in the project.

## Contributing

Contributions are welcome! Please open an issue to discuss your ideas or submit a Pull Request.
