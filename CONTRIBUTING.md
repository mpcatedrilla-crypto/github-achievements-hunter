# Contributing to GitHub Achievements Hunter

Thanks for your interest! This is an educational project about GitHub achievements.

## How to Contribute

### Reporting Issues
- Use the issue tracker
- Describe the achievement you're trying to unlock
- Share what methods you've tried

### Adding New Strategies
1. Fork the repository
2. Create a feature branch: `git checkout -b feature/new-strategy`
3. Add your strategy to the README or as a script
4. Submit a pull request

### Script Contributions
When adding new automation scripts:
- Place in `scripts/` directory
- Make executable: `chmod +x scripts/your-script.sh`
- Include header comments explaining purpose
- Add to the achievements.sh menu

## Development Setup

```bash
# Clone the repo
git clone https://github.com/YOUR_USERNAME/github-achievements-hunter.git

# Install GitHub CLI
# macOS
brew install gh

# Windows
winget install --id GitHub.cli

# Linux
sudo apt install gh

# Authenticate
gh auth login
```

## Code of Conduct

- Be respectful and helpful
- Focus on educational value
- Follow GitHub's Terms of Service
- Don't spam or abuse GitHub's systems

## Questions?

Open an issue or start a discussion!
