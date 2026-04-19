#!/bin/bash
# Galaxy Brain Achievement Hunter
# Creates and answers discussions

set -e

COUNT=${1:-1}

echo "🧠 Galaxy Brain Achievement Hunter"
echo "Creating $COUNT discussions and answers"
echo ""

for i in $(seq 1 $COUNT); do
    TITLE="Discussion $i - $(date +%s)"
    
    # Create discussion using GitHub API (gh CLI doesn't support discussions yet)
    echo "Creating discussion: $TITLE"
    
    # Alternative: Use API call
    curl -X POST \
        -H "Authorization: token $(gh auth token)" \
        -H "Accept: application/vnd.github.v3+json" \
        https://api.github.com/repos/$(gh repo view --json nameWithOwner -q .nameWithOwner)/discussions \
        -d '{
            "title": "'$TITLE'",
            "body": "This is a discussion for Galaxy Brain achievement",
            "category_id": "1"
        }' 2>/dev/null || echo "Note: Discussions API requires category ID - create manually in UI"
    
    echo "  Progress: $i/$COUNT"
done

echo ""
echo "ℹ️ Note: GitHub Discussions are best created via the web UI"
echo "Steps:"
echo "  1. Go to your repo on GitHub"
echo "  2. Click 'Discussions' tab"
echo "  3. Click 'New discussion'"
echo "  4. Create and answer your own questions"
echo ""
echo "✅ Galaxy Brain guide complete!"
