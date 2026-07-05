# Coder-Sopify

A repository containing setup automation to configure your development environment.

## What is Installed

The setup script automatically installs:
1. **Claude Code** (AI programming assistant)
2. **agent-skill** (Custom SOP tools cloned and installed to `~/.claude/skills/sop`)
3. **GitHub CLI** (`gh`)

## Getting Started

You can install everything using the one-liner command below (recommended), or by cloning this repository.

### Option 1: Quick Install (One-liner)

Run this directly in your terminal:
```bash
curl -fsSL https://raw.githubusercontent.com/Siam-GS-Battery/coder-sopify/main/setup.sh | bash
```

### Option 2: Clone and Run

```bash
git clone https://github.com/Siam-GS-Battery/coder-sopify.git
cd coder-sopify
bash setup.sh
```

---

### ⚠️ Critical Step After Installation

After running the script, the `claude` command might not be immediately available in your current active terminal session. To fix this and load the path config, **run one of the following commands in your terminal**:

```bash
export PATH="$HOME/.local/bin:$PATH"
# OR reload your bash session:
exec bash
```

## Uninstalling / Reverting

To remove Claude Code and the installed agent skills:

```bash
rm -f ~/.local/bin/claude && rm -rf ~/agent-skill ~/.claude/skills/sop
```
*(Note: If you wish to remove the GitHub CLI, you can do so by running `sudo apt purge gh -y`.)*
