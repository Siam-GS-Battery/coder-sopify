# Coder-Sopify

A repository containing setup automation to configure your development environment.

## What is Installed

The setup script automatically installs:
1. **Claude Code** (AI programming assistant)
2. **agent-skill** (Custom SOP tools cloned and installed to `~/.claude/skills/sop`)
3. **GitHub CLI** (`gh`)

## Getting Started

To run the environment setup script:

```bash
bash setup.sh
```

## Uninstalling / Reverting

To remove Claude Code and the installed agent skills:

```bash
rm -f ~/.local/bin/claude && rm -rf ~/agent-skill ~/.claude/skills/sop
```
*(Note: If you wish to remove the GitHub CLI, you can do so by running `sudo apt purge gh -y`.)*
