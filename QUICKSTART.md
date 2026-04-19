# ⚡ 60-Second Quickstart

## I Want Achievements NOW (No Reading!)

### Step 1: Fork This Repo (30 sec)
1. Click **Fork** button (top right of this page)
2. Wait for it to create your copy

### Step 2: Terminal (30 sec)

**Copy-paste this entire block:**

```bash
# Replace YOUR_USERNAME with your actual GitHub username
export USER=YOUR_USERNAME

git clone https://github.com/$USER/github-achievements-hunter.git
cd github-achievements-hunter

# Make scripts executable
chmod +x scripts/*.sh

# LOGIN (follow prompts)
gh auth login

# RUN EVERYTHING
./scripts/achievements.sh
```

### Step 3: Select Option 7
When you see the menu, type `7` and press Enter.

---

## 🎯 What This Unlocks

✅ **Quickdraw** - Creates and closes an issue instantly  
✅ **YOLO** - Merges PR without review  
✅ **Pull Shark** - Creates and merges 3 PRs  
✅ **Pair Extraordinaire** - Creates co-authored commit  

⏱️ **Time:** ~5 minutes  
📊 **Results:** Check https://github.com/YOUR_USERNAME?tab=achievements in 24-48 hours

---

## 🛑 Common Issues

**"gh: command not found"**
```bash
# macOS
brew install gh

# Windows
winget install --id GitHub.cli

# Linux
sudo apt install gh
```

**"Permission denied"**
```bash
chmod +x scripts/*.sh
```

**"Authentication failed"**
```bash
gh auth login
# Choose HTTPS, paste your Personal Access Token
```

---

## 🎮 Manual Mode (No Scripts)

If scripts don't work, do it manually:

### Quickdraw (1 min)
1. Go to your fork on GitHub
2. Click **Issues** → **New issue**
3. Type anything → Submit → Immediately click **Close issue**

### Pull Shark (5 min per PR)
1. Click **Add file** → **Create new file**
2. Name: `test.txt`, Content: `hello`
3. Click **"Create a new branch"** → **Propose changes**
4. Click **Create pull request**
5. Click **Merge pull request**
6. Repeat 16 times for Silver!

### YOLO (Same as above)
- Just merge without waiting for review

### Pair Extraordinaire
- When committing, add this to message:
```
Co-authored-by: Name <email@example.com>
```

---

## 💡 Pro Tips

1. **Fork = Your own copy** - Make any changes you want
2. **Run weekly** - Script can run repeatedly for more PRs
3. **Make it public** - Private repos don't count!
4. **Wait 2 days** - Achievements don't appear instantly

---

## 🆘 Still Stuck?

Open an issue on this repo and we'll help!

**Good luck! 🏆**
