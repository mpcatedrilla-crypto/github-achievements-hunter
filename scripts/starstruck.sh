#!/bin/bash
# Starstruck Achievement Tracker
# Tracks stars on your repositories

set -e

USERNAME=$(gh api user -q .login)

echo "⭐ Starstruck Achievement Tracker"
echo "================================="
echo ""
echo "Checking repositories for $USERNAME..."
echo ""

# Get all repos with star count
REPOS=$(gh repo list $USERNAME --limit 100 --json name,stargazersCount -q '.[] | "\(.name):\(.stargazersCount)"')

echo "Your Repositories:"
echo "------------------"

TOTAL_STARS=0
MAX_STARS=0
MAX_REPO=""

while IFS=: read -r repo stars; do
    echo "  $repo: $stars ⭐"
    TOTAL_STARS=$((TOTAL_STARS + stars))
    
    if [ "$stars" -gt "$MAX_STARS" ]; then
        MAX_STARS=$stars
        MAX_REPO=$repo
    fi
done <<< "$REPOS"

echo ""
echo "📊 Summary"
echo "----------"
echo "Total repositories: $(echo "$REPOS" | wc -l)"
echo "Total stars: $TOTAL_STARS"
echo "Top repository: $MAX_REPO with $MAX_STARS stars"
echo ""

# Starstruck requirements
echo "🏆 Starstruck Progress"
echo "----------------------"
echo "Bronze (16 stars): $([ $MAX_STARS -ge 16 ] && echo "✅ UNLOCKED" || echo "❌ Need $((16 - MAX_STARS)) more on one repo")"
echo "Silver (128 stars): $([ $MAX_STARS -ge 128 ] && echo "✅ UNLOCKED" || echo "❌ Need $((128 - MAX_STARS)) more on one repo")"
echo "Gold (512 stars): $([ $MAX_STARS -ge 512 ] && echo "✅ UNLOCKED" || echo "❌ Need $((512 - MAX_STARS)) more on one repo")"
echo ""

# Suggestions
echo "💡 Suggestions to get more stars:"
echo "--------------------------------"
echo "  1. Create developer tools/utilities"
echo "  2. Share dotfiles/configurations"
echo "  3. Build templates/starter kits"
echo "  4. Write tutorials with code"
echo "  5. Contribute to popular projects"
echo "  6. Share on Reddit r/webdev, r/github"
echo "  7. Post on Twitter/X with #opensource"
echo "  8. Submit to awesome-lists"
echo ""
