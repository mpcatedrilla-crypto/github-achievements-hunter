#!/bin/bash
# Pair Extraordinaire Achievement Hunter
# Creates co-authored commits

set -e

COUNT=${1:-1}
EMAIL1=${2:-"$(git config user.email)"}
NAME1=${3:-"$(git config user.name)"}
EMAIL2=${4:-"coauthor@example.com"}
NAME2=${5:-"Co-Author"}

echo "👥 Pair Extraordinaire Hunter"
echo "Creating $COUNT co-authored commits"
echo "Primary: $NAME1 <$EMAIL1>"
echo "Co-author: $NAME2 <$EMAIL2>"
echo ""

for i in $(seq 1 $COUNT); do
    BRANCH="pair-extraordinaire-$(date +%s)-$i"
    
    # Create branch
    git checkout -b "$BRANCH" 2>/dev/null || true
    
    # Make a change
    echo "Co-authored update $i - $(date)" >> pair-extraordinaire.log
    git add . 2>/dev/null || true
    
    # Commit with co-author
    git commit -m "feat: pair extraordinaire update #$i

Co-authored-by: $NAME1 <$EMAIL1>
Co-authored-by: $NAME2 <$EMAIL2>" 2>/dev/null || true
    
    # Push
    git push -u origin "$BRANCH" 2>/dev/null || true
    
    # Create and merge PR
    PR_URL=$(gh pr create --title "Pair Extraordinaire #$i" --body "Co-authored commit for achievement" 2>/dev/null || echo "")
    
    if [ -n "$PR_URL" ]; then
        PR_NUM=$(echo "$PR_URL" | grep -oE '[0-9]+$')
        sleep 2
        gh pr merge "$PR_NUM" --squash --delete-branch 2>/dev/null || true
        echo "  ✓ Merged co-authored PR #$PR_NUM"
    fi
    
    git checkout main 2>/dev/null || git checkout master 2>/dev/null || true
    echo "  Progress: $i/$COUNT"
done

echo ""
echo "✅ Pair Extraordinaire batch complete!"
