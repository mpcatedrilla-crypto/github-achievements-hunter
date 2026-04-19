# 🏆 GitHub Achievements Hunter

A comprehensive guide and automation toolkit to unlock all GitHub profile achievements.

## 🎯 Achievements Overview

| Achievement | Tier 1 | Tier 2 | Tier 3 | How to Unlock |
|-------------|--------|--------|--------|---------------|
| **Pull Shark** | 🥉 | 🥈 | 🥇 | Merge pull requests (2/16/128) |
| **YOLO** | 🥇 | - | - | Merge a PR without review |
| **Galaxy Brain** | 🥉 | 🥈 | 🥇 | Answer discussions (1/16/32) |
| **Starstruck** | 🥉 | 🥈 | 🥇 | Create repos with stars (16/128/512) |
| **Quickdraw** | 🥇 | - | - | Close issue/PR within 5 minutes |
| **Pair Extraordinaire** | 🥉 | 🥈 | 🥇 | Co-author commits (1/16/32) |
| **Public Sponsor** | 🥇 | - | - | Sponsor open source contributors |

---

## 🚀 Quick Start

### 1. Clone This Repository
```bash
git clone https://github.com/YOUR_USERNAME/github-achievements-hunter.git
cd github-achievements-hunter
```

### 2. Run Achievement Scripts
```bash
# Make scripts executable
chmod +x scripts/*.sh

# Run the achievement hunter
./scripts/achievements.sh
```

---

## 📋 Achievement Strategies

### 🦈 Pull Shark (2/16/128 PRs Merged)

**Strategy:** Create and merge your own PRs to this repo.

```bash
# Create a feature branch
git checkout -b feature/update-docs

# Make changes
echo "Update $(date)" >> updates.log
git add . && git commit -m "docs: update log"

# Push and create PR
git push -u origin feature/update-docs
gh pr create --title "Update docs" --body "Documentation update"

# Merge your own PR
gh pr merge --squash
```

**Quick Automation:**
```bash
./scripts/pull-shark.sh 16  # Creates and merges 16 PRs
```

---

### 🤪 YOLO (Merge Without Review)

**Strategy:** Disable branch protection temporarily, merge directly.

```bash
# Create PR with --admin flag to bypass rules
gh pr merge --admin --squash
```

> ⚠️ **Note:** Only works if you have admin access to the repo.

---

### 🧠 Galaxy Brain (Answer Discussions)

**Strategy:** Enable GitHub Discussions and answer your own or community questions.

1. Go to **Settings** → **Features** → Enable **Discussions**
2. Create discussion categories
3. Post questions and answer them:

```bash
# Using GitHub CLI
echo "How do I unlock GitHub achievements?" | gh discussion create --title "Q&A: Achievements" --category "Q&A"
```

---

### ⭐ Starstruck (Repo Stars 16/128/512)

**Strategy:** Create interesting repositories that attract stars.

**Projects that get starred:**
- Developer tools
- Configuration templates
- Learning resources
- Cheat sheets

**Promote your repo:**
- Share on Twitter/X, Reddit (r/webdev, r/github)
- Submit to awesome-lists
- Add to your profile README

---

### ⚡ Quickdraw (Close Within 5 Min)

**Strategy:** Create and immediately close issues/PRs.

```bash
# Quickdraw script
./scripts/quickdraw.sh
```

Or manually:
```bash
# Create and close an issue instantly
gh issue create --title "Quickdraw test" --body "Testing" && gh issue close $(gh issue list --limit 1 --json number -q '.[0].number')
```

---

### 👥 Pair Extraordinaire (Co-authored Commits)

**Strategy:** Create commits with multiple authors.

```bash
# Make a commit with co-author
git commit -m "feat: add feature

Co-authored-by: Your Name <your@email.com>
Co-authored-by: Friend Name <friend@email.com>"
```

**Use the automation script:**
```bash
./scripts/pair-extraordinaire.sh
```

---

### 💖 Public Sponsor

**Strategy:** Sponsor any GitHub user via [GitHub Sponsors](https://github.com/sponsors).

Minimum: $1/month to any sponsored developer.

---

## 🛠️ Automation Scripts

| Script | Purpose | Usage |
|--------|---------|-------|
| `pull-shark.sh [count]` | Mass PR creation/merging | `./scripts/pull-shark.sh 16` |
| `pair-extraordinaire.sh` | Co-authored commits | `./scripts/pair-extraordinaire.sh` |
| `quickdraw.sh` | Fast close achievement | `./scripts/quickdraw.sh` |
| `galaxy-brain.sh` | Discussion automation | `./scripts/galaxy-brain.sh` |
| `starstruck.sh` | Star tracking | `./scripts/starstruck.sh` |

---

## 📊 Progress Tracker

Track your achievement progress:

| Achievement | Current | Target | Progress |
|-------------|---------|--------|----------|
| Pull Shark | 0 | 128 | 0% |
| Galaxy Brain | 0 | 32 | 0% |
| Pair Extraordinaire | 0 | 32 | 0% |
| Starstruck | 0 | 512 | 0% |
| YOLO | 0 | 1 | 0% |
| Quickdraw | 0 | 1 | 0% |
| Public Sponsor | 0 | 1 | 0% |

---

## ⚠️ Important Notes

1. **Authenticity:** GitHub may flag suspicious automated activity
2. **Rate Limits:** GitHub API has rate limits (5000 requests/hour)
3. **Community:** Focus on creating value, not just achievements
4. **Timing:** Some achievements take time to appear on your profile

---

## 🎓 Educational Purpose

This repository is for **educational purposes** to understand GitHub's achievement system. We recommend:
- Contributing to real open source projects
- Building genuine community engagement
- Creating valuable content that helps others

---

## 📜 License

MIT License - See [LICENSE](LICENSE)

---

**Happy Achievement Hunting! 🏆**
