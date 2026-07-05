# Coder-Sopify

This repository is created to guide you on how to set up and use Claude Code (coder) in your development environment.

## Overview

<!-- ponytail: simplified overview listing tools -->
This setup script automatically installs and configures:
1. **Claude Code** (AI programming assistant)
2. **agent-skill** (Custom SOP tools cloned and installed to `~/.claude/skills/sop`)
3. **GitHub CLI** (`gh`)

Once installed, you can use these tools to run custom SOP skills and monitor background processes.

## One-time Setup

<!-- ponytail: merged setup steps -->
1. **Run the installation script:**
   ```bash
   source <(curl -fsSL https://raw.githubusercontent.com/Siam-GS-Battery/coder-sopify/main/setup.sh)
   ```

2. **Log in to GitHub:**
   ```bash
   gh auth login
   ```

3. **Launch Claude Code:**
   ```bash
   claude
   ```

## Usage

<!-- ponytail: simple usage guidelines -->
### Running SOP Skills
Inside your interactive Claude Code session, type the slash command:
```text
/sop
```

### Using the Monitor Tool
When running long-running processes or watching log files, tell Claude to use its built-in `Monitor` tool to react to events efficiently without polling.

## Troubleshooting & Support

If you encounter any issues or have problems while setting up or using these tools, please contact the administrator for support.

## Uninstalling / Reverting

To remove Claude Code and the installed agent skills:

```bash
rm -f ~/.local/bin/claude && rm -rf ~/agent-skill ~/.claude/skills/sop
```
*(Note: If you wish to remove the GitHub CLI, you can do so by running `sudo apt purge gh -y`.)*
