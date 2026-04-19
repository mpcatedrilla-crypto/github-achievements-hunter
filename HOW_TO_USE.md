# 🎯 How to Use This Repository (No AI Required!)

Anyone can use this repository to unlock GitHub achievements. Here's the complete guide:

---

## 🚀 Quick Start (3 Steps)

### Step 1: Get the Code

**Option A: Fork (Recommended)**
1. Go to: https://github.com/mpcatedrilla-crypto/github-achievements-hunter
2. Click the **"Fork"** button (top right)
3. Wait ~30 seconds for your fork to be created

**Option B: Template**
1. Click **"Use this template"** button
2. Create your own repo from this template

**Option C: Clone**
```bash
git clone https://github.com/mpcatedrilla-crypto/github-achievements-hunter.git
cd github-achievements-hunter
```

---

### Step 2: Setup (One Time)

#### Windows Users:
```powershell
# Open PowerShell as Administrator
# Install GitHub CLI
winget install --id GitHub.cli

# Login to GitHub
gh auth login
# Follow prompts: HTTPS → Paste token
```

#### Mac/Linux Users:
```bash
# Install GitHub CLI
brew install gh        # macOS
sudo apt install gh    # Ubuntu/Debian

# Login
gh auth login
```

---

### Step 3: Run Achievement Scripts

#### Windows - Double Click Method:
1. Open `scripts\achievements.bat`
2. Follow the menu prompts

#### Mac/Linux - Terminal:
```bash
chmod +x scripts/*.sh
./scripts/achievements.sh
```

---

## 📋 Achievement Guides

### ⚡ Quickdraw (Easiest - 1 Minute)

**Goal:** Close an issue or PR within 5 minutes

**Manual Method:**
1. Go to your forked repo on GitHub
2. Click **Issues** → **New issue**
3. Title: "Quickdraw test"
4. Click **Submit new issue**
5. Immediately click **Close issue**

**Script Method:**
```bash
./scripts/quickdraw.sh
```

---

### 🦈 Pull Shark (Easy - 5 Minutes)

**Goal:** Merge 2/16/128 pull requests

**Manual Method:**
```bash
# 1. Create a branch
git checkout -b my-update

# 2. Make any change
echo "update" >> README.md

# 3. Commit and push
git add . && git commit -m "update"
git push -u origin my-update

# 4. Create PR on GitHub
# Go to repo → Compare & pull request → Create PR

# 5. Merge the PR
# Click "Merge pull request" on GitHub

# 6. Repeat 16 times for Silver!
```

**Script Method (Automatic):**
```bash
./scripts/pull-shark.sh 16
```

---

### 🤪 YOLO (Easy - 2 Minutes)

**Goal:** Merge a PR without review

**Manual Method:**
1. Create a branch and push it
2. Open PR on GitHub
3. Click **"Merge without waiting"** (needs admin)
4. Or use: `gh pr merge --admin`

**Script Method:**
```bash
./scripts/yolo.sh
```

---

### 👥 Pair Extraordinaire (Easy - 5 Minutes)

**Goal:** Create commits with multiple authors

**Manual Method:**
```bash
git checkout -b coauthor-test

# Make a change
echo "test" >> file.txt

# Commit with co-author
git add . && git commit -m "feat: update

Co-authored-by: Your Name <your@email.com>
Co-authored-by: Friend Name <friend@email.com>"

git push -u origin coauthor-test

# Create PR on GitHub and merge it
```

**Script Method:**
```bash
./scripts/pair-extraordinaire.sh
```

---

### 🧠 Galaxy Brain (Medium - 30 Minutes)

**Goal:** Answer 1/16/32 discussions

**Setup:**
1. Go to your repo on GitHub
2. Click **Settings** tab
3. Scroll to **Features**
4. Check **Discussions** → Save

**Method:**
1. Go to **Discussions** tab
2. Click **New discussion**
3. Category: **Q&A**
4. Title: "How do I unlock achievements?"
5. Body: Write a question
6. Submit
7. Comment with an answer
8. Click **"Mark as answer"** on your comment

**Repeat 16 times for Silver, 32 for Gold!**

---

### ⭐ Starstruck (Hard - Days/Weeks)

**Goal:** Get 16/128/512 stars on your repos

**What to Create:**
- Developer tools
- VS Code extensions
- Configuration templates
- Learning resources
- Cheat sheets

**Promotion Tips:**
- Share on Reddit: r/webdev, r/programming, r/github
- Post on Twitter/X with #opensource #github
- Write article on Dev.to
- Submit to awesome-lists

---

### 💖 Public Sponsor (Easy - Costs $1+)

**Goal:** Sponsor an open source developer

**Method:**
1. Go to: https://github.com/sponsors
2. Find a developer you like
3. Click **Sponsor**
4. Choose minimum tier ($1/month)
5. Select **Public** sponsorship (not private)
6. Complete payment

---

## 🎮 Complete Workflow Example

**For someone who wants ALL achievements in one session:**

```bash
# 1. Fork the repo on GitHub first!

# 2. Clone your fork
git clone https://github.com/YOUR_USERNAME/github-achievements-hunter.git
cd github-achievements-hunter

# 3. Run all basic achievements
./scripts/achievements.sh
# Select option 7: "Run ALL"

# 4. Enable Discussions for Galaxy Brain
# Go to GitHub → Settings → Features → Enable Discussions
# Then create and answer 32 discussions

# 5. For Starstruck
# Create separate interesting repos
# Promote them on social media
# Wait for stars

# 6. For Public Sponsor
# Go to https://github.com/sponsors
# Sponsor someone for $1+
```

---

## 📊 Track Your Progress

Check your achievements at:
```
https://github.com/YOUR_USERNAME?tab=achievements
```

**Note:** Achievements appear 24-48 hours after completing requirements!

---

## ❓ Troubleshooting

### "Permission denied" when running scripts
```bash
chmod +x scripts/*.sh
```

### "gh command not found"
Install GitHub CLI: https://cli.github.com/

### "Authentication required"
```bash
gh auth login
```

### "Repository not found"
Make sure you forked the repo, not just viewing it!

### Achievements not showing
- Wait 24-48 hours
- Make sure actions are on public repos
- Check https://github.com/settings/profile → "Profile settings" → "Show achievements"

---

## 🎯 One-Liner Commands

**Quickdraw:**
```bash
curl -X POST -H "Authorization: token YOUR_TOKEN" https://api.github.com/repos/YOUR_USER/REPO/issues -d '{"title":"test"}' && curl -X PATCH -H "Authorization: token YOUR_TOKEN" https://api.github.com/repos/YOUR_USER/REPO/issues/1 -d '{"state":"closed"}'
```

**Pull Shark (one PR):**
```bash
git checkout -b test && echo "x" >> x && git add . && git commit -m "test" && git push -u origin test && gh pr create --fill && gh pr merge --squash && git checkout main
```

---

## 🎓 Tips for Success

1. **Start with Quickdraw** - Easiest achievement
2. **Do Pull Shark in batches** - Run script overnight
3. **Combine achievements** - One PR can count for multiple
4. **Use GitHub Actions** - Enable the workflow for passive progress
5. **Be patient** - Achievements take 24-48h to appear

---

## 🔗 Useful Links

- Your Profile: https://github.com/YOUR_USERNAME?tab=achievements
- GitHub CLI: https://cli.github.com/
- GitHub Token: https://github.com/settings/tokens

---

**Happy Achievement Hunting! 🏆**
