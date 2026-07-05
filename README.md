# Coder-Sopify

A repository containing setup automation to configure your development environment.

## What is Installed

The setup script automatically installs:
1. **Claude Code** (AI programming assistant)
2. **agent-skill** (Custom SOP tools cloned and installed to `~/.claude/skills/sop`)
3. **GitHub CLI** (`gh`)

## Prerequisites (Before Running Setup)

Before running the setup script, ensure you complete the following steps:

1. **Clone this repository and navigate into it:**
   ```bash
   git clone https://github.com/Siam-GS-Battery/coder-sopify.git
   cd coder-sopify
   ```

2. **Authenticate with GitHub:**
   Because `agent-skill` is a private repository, you must be authenticated with GitHub to clone it. Make sure your SSH keys are set up or your Git credential helper is configured.
   You can verify GitHub access by running:
   ```bash
   ssh -T git@github.com
   ```

## Getting Started

Once the prerequisites are met, run the setup script:

```bash
bash setup.sh
```

## Uninstalling / Reverting

To remove Claude Code and the installed agent skills:

```bash
rm -f ~/.local/bin/claude && rm -rf ~/agent-skill ~/.claude/skills/sop
```
*(Note: If you wish to remove the GitHub CLI, you can do so by running `sudo apt purge gh -y`.)*
