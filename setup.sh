#!/bin/bash
# ponytail: simplified script containing only install steps, no tests

# 1. Install Claude Code
curl -fsSL https://claude.ai/install.sh | bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
export PATH="$HOME/.local/bin:$PATH"

# 2. Install agent-skill
rm -rf ~/agent-skill
git clone https://github.com/SiamGS-Sopify/agent-skill.git ~/agent-skill
mkdir -p ~/.claude/skills
rm -rf ~/.claude/skills/sop
cp -r ~/agent-skill/sop ~/.claude/skills/sop

# 3. Install GitHub CLI
(type -p wget >/dev/null || (sudo apt update && sudo apt install wget -y)) \
&& sudo mkdir -p -m 755 /etc/apt/keyrings \
&& out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
&& cat $out | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
&& sudo mkdir -p -m 755 /etc/apt/sources.list.d \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y
# 4. Check installation
# ponytail: simple check logic using standard command -v and test
echo "=== Installation Check ==="
command -v claude &>/dev/null && echo "Claude: Installed" || echo "Claude: NOT Installed"
test -f ~/.claude/skills/sop/SKILL.md && echo "agent-skill: Installed" || echo "agent-skill: NOT Installed"
command -v gh &>/dev/null && echo "gh CLI: Installed" || echo "gh CLI: NOT Installed"
