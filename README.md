# Coder & Claude Code User Guide (For First-Time Users)

<!-- ponytail: translated guide -->
Version: 1.0 · Document Maintainer: Dev / IT Team · Last Updated: July 2026

By the end of this guide, you will be able to launch VS Code on the web via Coder, use Claude Code, instruct Claude to write code according to the team's SOPs (SOP skills), and save your code to GitHub.

---

## 1. System Overview

```text
You (Browser)
      │
      ▼
Coder ─── Create Workspace (Cloud dev machine)
      │
      ▼
VS Code on Web ─── Access Terminal just like a local machine
      │
      ▼
Claude Code ─── AI Coding Assistant in Terminal
      │
      ▼
SOP Skill ─── Enforce coding standards (SDLC, React+TS, Node, PostgreSQL)
      │
      ▼
GitHub ─── Persistent storage for all your code
```

| Component | What is it? |
| :--- | :--- |
| **Coder** | Cloud development environment platform to spin up virtual workspaces via your browser. |
| **VS Code on Web** | IDE running inside Coder workspace with the look and feel of standard VS Code. |
| **Claude Code** | Terminal-based AI agent to write/refactor code using natural language. |
| **SOP Skill** | Core team guidelines (GS Battery SDLC standards) loaded into Claude Code before it begins work. |

> [!IMPORTANT]
> **Critical Failure Points:**
> 1. Incorrect installation or login for Claude Code → Cannot use the assistant at all.
> 2. Installing SOP skills in the wrong path → Claude works, but ignores company SOPs (will be rejected during review).
> 
> *Never skip the verification/check steps at the end of sections 4 and 5.*

---

## 2. Prerequisites

Complete all checks before proceeding to Section 3. Refer to the remedy column if you do not have an item.

| Status | Prerequisite | Remedy (If missing) |
| :---: | :--- | :--- |
| ☐ | GitHub account added to the company Organization | Contact IT to invite you to the GitHub Org |
| ☐ | Access to Coder (URL: `[Insert Company Coder URL]`) | Contact IT to create an account |
| ☐ | Company Claude account (Email + Password from IT) | Contact IT to assign a Claude seat |
| ☐ | Latest version of Chrome or Edge browser | Update your browser |

> [!TIP]
> **Quick Test:** If you can sign in to github.com and reach the Coder URL login page, you are ready to start.

---

## 3. First-Time Access to Coder

### 3.1 Login to Coder
1. Open your browser and go to `[Insert Company Coder URL]`.
2. Log in using your IT-issued credentials (or click *Sign in with GitHub* if configured).

* **Success Criteria:** The Coder Dashboard loads showing the **Workspaces** menu on the left.

### 3.2 Create Workspace
1. Click **Workspaces** → **Create Workspace**.
2. Select the template specified by your team: `[Company Template Name, e.g. dev-fullstack]`.
3. Name your workspace after yourself, e.g., `dev-somchai`.
4. Click **Create** and wait for the status to change to **Running** (takes 1–3 minutes).

* **Success Criteria:** The workspace shows a green **Running** status and the VS Code (Web) option appears.

### 3.3 Open VS Code on the Web
1. Click the **Code-Server** button in your workspace.
2. VS Code opens in a new browser tab.
3. Open the terminal: **Terminal** → **New Terminal** (or press `Ctrl` + `` ` ``).

* **Success Criteria:** The terminal pane opens. Running `pwd` displays the path, e.g., `/home/coder`.

*(If VS Code fails to open or freezes, refer to Section 6, Symptom A)*

---

## 4. Tool Installation (One-time Setup)

### 4.1 Run the Auto-Installation Script
Run the following command in the VS Code terminal:
```bash
source <(curl -fsSL https://raw.githubusercontent.com/Siam-GS-Battery/coder-sopify/main/setup.sh)
```

### 4.2 Authenticate Claude Code
1. Upon first launch, select log in with a **Claude Account** (do not use an API key).
2. The terminal will display a verification URL.
3. Copy the URL and open it in a new browser tab.
4. Log in using your **Company Claude account** — ⚠️ *Do not use your personal account* as it won't be linked to the organization.
5. Once authenticated, copy the verification code from the web page, paste it back into the terminal, and press Enter.

---

## 5. SOP Skills & Monitor Tool Usage

### 5.1 Running SOP Skills
Once inside the interactive Claude Code terminal, initiate the custom SOP guidelines using:
```text
/sop
```

### 5.2 Using the Monitor Tool
For long-running tasks (e.g. tests, builds, deployments) or log streaming, tell Claude to use the **Monitor Tool**. This tracks background progress efficiently without polling loops or wasting tokens:
* Example prompt: *"Run all unit tests in the background and use the Monitor tool to report results."*

---

## 6. Troubleshooting

Refer to the table below for solutions to common issues.

| Symptom | Common Cause | Remedy |
| :--- | :--- | :--- |
| **A. VS Code fails to open / freezes** | Workspace is stopped or in auto-sleep mode | Go to Coder Dashboard → Click **Start** on your workspace → Wait for green status → Re-open VS Code |
| **B. claude: command not found** | Installation failed or PATH variable is missing | Re-run setup script (4.1) and watch for errors · Restart terminal · Contact IT if the issue persists |
| **C. Authentication / permission error** | Logged in with personal account, or seat is not assigned | Run `/logout` inside Claude Code, then run `/login` using company credentials · Contact IT to check seat assignment |
| **D. git clone fails (not found / permission denied)** | GitHub account not in Org, or typo in repo URL | Double-check repo URL · Try opening the repository link in browser · Ask IT to check Org access rights |
| **E. Claude works, but ignores SOPs** | Skill files are in the wrong directory or Claude needs a reload | Run `ls ~/.claude/skills/sop/SKILL.md` to confirm file is present · Move file if necessary · Exit Claude (`/exit`) and restart |
| **F. Files disappear after workspace reset** | Workspace rebuilt; temporary container storage cleared | Re-run sections 4 and 5 (~10 minutes) · Unpushed code is lost; always push work to GitHub (see section 7) |

### 6.1 Requesting IT Support
If you cannot resolve the issue, contact IT with the following details:
1. Your Coder Workspace Name.
2. Full-screen screenshot of the error message.
3. Exact terminal command run before the error occurred.
4. The symptom code from the table above and what steps you've already tried.

---

## 7. Daily Workflow

### 7.1 Starting the Day
1. Coder Dashboard → Start your workspace if it is stopped.
2. Open VS Code Web → Open Terminal.
3. `cd` into your project directory and type `claude` (re-login is not required unless prompted).

### 7.2 Saving Work to GitHub
⚠️ *Workspaces are ephemeral containers. GitHub is the only permanent storage. Always push your changes daily.*

```bash
git add .
git commit -m "brief description of changes"
git push
```
Alternatively, instruct Claude Code to handle this: *"Commit and push all changes to GitHub"* — Claude will prompt for confirmation.

> [!WARNING]
> **Branch Rule:** Always work on a feature branch (e.g., `feature/user-auth`). Do not push directly to `main`.

### 7.3 SOP Guidelines (Summary)
* Follow phase Gates sequentially: Requirements → Design → Database → TDD → Write Code.
* Implement Test-Driven Development (TDD) — write tests before writing implementation code.
* Before finalizing: ensure linting, type-checking, and tests pass cleanly with no console logs or hardcoded secrets.
* Access full guidelines inside Claude Code by asking: *"What is our Definition of Done?"*

---

## 8. Appendix — Frequently Used Commands

| Command | Action |
| :--- | :--- |
| `claude` | Open Claude Code |
| `/exit` | Exit Claude Code |
| `/login` / `/logout` | Log in or out of your Claude account |
| `claude --version` | Display installed version |
| `claude doctor` | Diagnostics report (attach when opening IT tickets) |
| `ls ~/.claude/skills/sop/SKILL.md` | Verify SOP skill files are in the correct location |

---

### Official Documentation
* **Claude Code:** [docs.claude.com](https://docs.claude.com/en/docs/claude-code/overview)
* **Coder:** [coder.com/docs](https://coder.com/docs)

---
*Note: Fields enclosed in `[...]` (Coder URLs, Template names, Org names) should be replaced with actual values by the Dev/IT administrator before sharing with team members.*
