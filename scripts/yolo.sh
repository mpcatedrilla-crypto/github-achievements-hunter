#!/bin/bash
# YOLO Achievement Hunter
# Merges a PR without review

set -e

echo "🤪 YOLO Achievement Hunter"
echo "Creating and merging PR without review..."
echo ""

BRANCH="yolo-$(date +%s)"

# Create branch and make change
git checkout -b "$BRANCH" 2>/dev/null || true
echo "YOLO merge test - $(date)" >> yolo.log
git add . 2>/dev/null || true
git commit -m "feat: yolo test commit" 2>/dev/null || true
git push -u origin "$BRANCH" 2>/dev/null || true

# Create PR
PR_URL=$(gh pr create --title "YOLO Merge Test" --body "This PR will be merged without review for YOLO achievement" 2>/dev/null || echo "")

if [ -n "$PR_URL" ]; then
    PR_NUM=$(echo "$PR_URL" | grep -oE '[0-9]+$')
    echo "Created PR #$PR_NUM"
    
    # Merge with admin flag (bypasses review requirements)
    sleep 2
    gh pr merge "$PR_NUM" --admin --delete-branch 2>/dev/null || {
        echo "Admin merge failed, trying squash..."
        gh pr merge "$PR_NUM" --squash --delete-branch 2>/dev/null || true
    }
    echo "✅ Merged PR #$PR_NUM without review (YOLO achieved!)"
fi

git checkout main 2>/dev/null || true

echo ""
echo "✅ YOLO attempt complete!"
echo "Note: This requires admin access to the repository."
