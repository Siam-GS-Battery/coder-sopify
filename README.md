# Coder-Sopify

A repository containing setup automation to configure your development environment.

## What is Installed

The setup script automatically installs:
1. **Claude Code** (AI programming assistant)
2. **agent-skill** (Custom SOP tools cloned and installed to `~/.claude/skills/sop`)
3. **GitHub CLI** (`gh`)

## Getting Started

To install and configure your environment, run the script directly in your terminal using the `source` command.

```bash
source <(curl -fsSL https://raw.githubusercontent.com/Siam-GS-Battery/coder-sopify/main/setup.sh)
```

### Why we use `source` instead of piping to `bash`

* **Executes in your current shell:** `source` runs the script directly inside your active terminal process instead of launching a temporary child subshell.
* **Applies PATH changes immediately:** Because the script executes in your active shell, the `source ~/.bashrc` line inside the script successfully reloads your shell's environment variables. You can run the `claude` command immediately without needing to restart your terminal.

## Uninstalling / Reverting

To remove Claude Code and the installed agent skills:

```bash
rm -f ~/.local/bin/claude && rm -rf ~/agent-skill ~/.claude/skills/sop
```
*(Note: If you wish to remove the GitHub CLI, you can do so by running `sudo apt purge gh -y`.)*
