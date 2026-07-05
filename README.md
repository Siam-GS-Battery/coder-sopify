# Coder-Sopify

A repository containing setup automation to configure your development environment.

## What is Installed

The setup script automatically installs:
1. **Claude Code** (AI programming assistant)
2. **agent-skill** (Custom SOP tools cloned and installed to `~/.claude/skills/sop`)
3. **GitHub CLI** (`gh`)

## Getting Started

To install and configure your environment, run the script using the `source` command. Sourcing ensures that the new `PATH` configuration takes effect in your current terminal session immediately.

Run this directly in your terminal:

```bash
source <(curl -fsSL https://raw.githubusercontent.com/Siam-GS-Battery/coder-sopify/main/setup.sh)
```

*(Note: If you already cloned the repository locally, you can run `source setup.sh` instead.)*

## Uninstalling / Reverting

To remove Claude Code and the installed agent skills:

```bash
rm -f ~/.local/bin/claude && rm -rf ~/agent-skill ~/.claude/skills/sop
```
*(Note: If you wish to remove the GitHub CLI, you can do so by running `sudo apt purge gh -y`.)*
