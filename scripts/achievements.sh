#!/bin/bash
# Main Achievement Hunter Script
# Run all achievement strategies

set -e

echo "🏆 GitHub Achievements Hunter"
echo "============================="
echo ""

# Check dependencies
if ! command -v gh &> /dev/null; then
    echo "❌ GitHub CLI (gh) is required but not installed."
    echo "Install: https://cli.github.com/"
    exit 1
fi

# Check authentication
if ! gh auth status &> /dev/null; then
    echo "❌ Not authenticated with GitHub CLI"
    echo "Run: gh auth login"
    exit 1
fi

echo "✅ GitHub CLI authenticated"
echo ""

# Menu
echo "Select achievement to hunt:"
echo ""
echo "  1) 🦈 Pull Shark (merge PRs)"
echo "  2) 🤪 YOLO (merge without review)"
echo "  3) 👥 Pair Extraordinaire (co-authored commits)"
echo "  4) ⚡ Quickdraw (fast close)"
echo "  5) 🧠 Galaxy Brain (discussions)"
echo "  6) ⭐ Starstruck (star tracking)"
echo "  7) 🎯 Run ALL"
echo "  0) Exit"
echo ""

read -p "Enter choice [0-7]: " choice

case $choice in
    1)
        read -p "How many PRs to create? [16]: " count
        ./scripts/pull-shark.sh "${count:-16}"
        ;;
    2)
        ./scripts/yolo.sh
        ;;
    3)
        read -p "How many co-authored commits? [16]: " count
        read -p "Your email [$(git config user.email)]: " email1
        read -p "Co-author email [coauthor@example.com]: " email2
        ./scripts/pair-extraordinaire.sh "${count:-16}" "${email1:-$(git config user.email)}" "$(git config user.name)" "$email2"
        ;;
    4)
        ./scripts/quickdraw.sh
        ;;
    5)
        read -p "How many discussions? [16]: " count
        ./scripts/galaxy-brain.sh "${count:-16}"
        ;;
    6)
        echo "Starstruck requires creating valuable repos that others star."
        echo "See README.md for strategies."
        ;;
    7)
        echo "Running all achievement hunters..."
        ./scripts/pull-shark.sh 2
        ./scripts/yolo.sh
        ./scripts/pair-extraordinaire.sh 1
        ./scripts/quickdraw.sh
        echo "✅ All basic achievements attempted!"
        ;;
    0)
        echo "Goodbye!"
        exit 0
        ;;
    *)
        echo "Invalid choice"
        exit 1
        ;;
esac
