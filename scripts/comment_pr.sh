#!/bin/bash
set -e

echo "💬 Adding comment to PR..."

# Check if we're in a PR context or manual workflow dispatch
if [ "$GITHUB_EVENT_NAME" = "pull_request" ]; then
    # Get PR number from GITHUB_REF for PR events
    PR_NUMBER=$(echo "$GITHUB_REF" | sed 's/refs\/pull\/\([0-9]*\)\/merge/\1/')
    
    if [ -z "$PR_NUMBER" ] || [ "$PR_NUMBER" = "$GITHUB_REF" ]; then
        echo "❌ Could not extract PR number from GITHUB_REF: $GITHUB_REF"
        exit 1
    fi
elif [ "$GITHUB_EVENT_NAME" = "workflow_dispatch" ]; then
    # For manual workflow dispatch, we need to find the PR number from the current branch
    echo "🔍 Manual workflow dispatch detected, looking for PR..."
    
    # Get current branch name
    BRANCH_NAME="$GITHUB_HEAD_REF"
    if [ -z "$BRANCH_NAME" ]; then
        BRANCH_NAME="$GITHUB_REF_NAME"
    fi
    
    echo "📋 Current branch: $BRANCH_NAME"
    
    # Find PR number for the current branch
    PR_NUMBER=$(gh api repos/$GITHUB_REPOSITORY/pulls --jq ".[] | select(.head.ref == \"$BRANCH_NAME\" and .state == \"open\") | .number" | head -1)
    
    if [ -z "$PR_NUMBER" ]; then
        echo "❌ No open PR found for branch: $BRANCH_NAME"
        exit 1
    fi
    
    echo "📋 Found PR #$PR_NUMBER for branch $BRANCH_NAME"
else
    echo "ℹ️  Not a PR or workflow_dispatch context, skipping comment"
    exit 0
fi

echo "📋 PR Number: $PR_NUMBER"

# Check if we already commented about TestFlight build
EXISTING_COMMENT=$(gh api repos/$GITHUB_REPOSITORY/issues/$PR_NUMBER/comments --jq '.[] | select(.user.type == "Bot" and (.body | contains("TestFlight build"))) | .id' 2>/dev/null || echo "")

if [ -n "$EXISTING_COMMENT" ]; then
    echo "ℹ️  Comment already exists, skipping..."
    exit 0
fi

# Prepare comment body
VERSION=${VERSION:-""}
BUILD_NUMBER=${BUILD_NUMBER:-""}

if [ -n "$VERSION" ] && [ -n "$BUILD_NUMBER" ]; then
    COMMENT_BODY="✅ TestFlight build ${VERSION}(${BUILD_NUMBER}) is published"
else
    COMMENT_BODY="✅ TestFlight build is published"
fi

echo "📝 Comment: $COMMENT_BODY"

# Add comment to PR
gh api repos/$GITHUB_REPOSITORY/issues/$PR_NUMBER/comments \
    --field body="$COMMENT_BODY" \
    --silent

echo "✅ Comment added successfully to PR #$PR_NUMBER"
