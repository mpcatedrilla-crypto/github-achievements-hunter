#!/bin/bash
# Quickdraw Achievement Hunter
# Closes issues/PRs within 5 minutes

set -e

echo "⚡ Quickdraw Achievement Hunter"
echo "Creating and immediately closing issue..."
echo ""

# Method 1: Issue
ISSUE=$(gh issue create --title "Quickdraw Test $(date +%s)" --body "This issue will be closed immediately for Quickdraw achievement" 2>/dev/null || echo "")

if [ -n "$ISSUE" ]; then
    ISSUE_NUM=$(echo "$ISSUE" | grep -oE '[0-9]+$')
    echo "Created issue #$ISSUE_NUM"
    
    # Close immediately
    gh issue close "$ISSUE_NUM" 2>/dev/null || true
    echo "✅ Closed issue #$ISSUE_NUM (Quickdraw achieved!)"
fi

echo ""
echo "Alternative: Creating and closing PR..."

# Method 2: PR
BRANCH="quickdraw-$(date +%s)"
git checkout -b "$BRANCH" 2>/dev/null || true
echo "quickdraw test" >> quickdraw.log
git add . 2>/dev/null || true
git commit -m "chore: quickdraw test" 2>/dev/null || true
git push -u origin "$BRANCH" 2>/dev/null || true

PR_URL=$(gh pr create --title "Quickdraw PR Test" --body "Quickdraw test" 2>/dev/null || echo "")

if [ -n "$PR_URL" ]; then
    PR_NUM=$(echo "$PR_URL" | grep -oE '[0-9]+$')
    echo "Created PR #$PR_NUM"
    
    # Close immediately
    sleep 1
    gh pr close "$PR_NUM" 2>/dev/null || true
    echo "✅ Closed PR #$PR_NUM"
fi

git checkout main 2>/dev/null || true

echo ""
echo "✅ Quickdraw attempts complete!"
echo "One of these should unlock the Quickdraw achievement."
