#!/bin/bash
# Pull Shark Achievement Hunter
# Creates and merges pull requests to unlock Pull Shark badges

set -e

COUNT=${1:-2}
REPO=${2:-$(gh repo view --json nameWithOwner -q .nameWithOwner)}

echo "🏆 Pull Shark Hunter - Creating $COUNT PRs"
echo "Target: $REPO"
echo ""

for i in $(seq 1 $COUNT); do
    BRANCH="pull-shark-$(date +%s)-$i"
    
    # Create branch
    git checkout -b "$BRANCH" 2>/dev/null || git checkout "$BRANCH"
    
    # Make a change
    echo "Update $i - $(date)" >> pull-shark.log
    git add . 2>/dev/null || true
    
    # Commit
    git commit -m "docs: pull shark update #$i" || true
    
    # Push
    git push -u origin "$BRANCH" 2>/dev/null || true
    
    # Create PR
    PR_URL=$(gh pr create --title "Pull Shark Update #$i" --body "Automated PR for Pull Shark achievement" 2>/dev/null || echo "")
    
    if [ -n "$PR_URL" ]; then
        PR_NUM=$(echo "$PR_URL" | grep -oE '[0-9]+$')
        echo "  ✓ Created PR #$PR_NUM"
        
        # Merge immediately
        sleep 2
        gh pr merge "$PR_NUM" --squash --delete-branch 2>/dev/null || true
        echo "  ✓ Merged PR #$PR_NUM"
    fi
    
    # Back to main
    git checkout main 2>/dev/null || git checkout master 2>/dev/null || true
    
    echo "  Progress: $i/$COUNT"
    sleep 1
done

echo ""
echo "✅ Pull Shark batch complete! Check your profile in ~24 hours."
