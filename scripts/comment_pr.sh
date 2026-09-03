#!/bin/bash
set -euo pipefail

echo "💬 Adding comment to PR..."

# The workflow resolves the PR number (both for `pull_request` and `workflow_dispatch`)
# and exports it as GITHUB_PR_NUMBER. Fall back to looking it up by branch.
PR_NUMBER="${GITHUB_PR_NUMBER:-}"

if [ -z "$PR_NUMBER" ]; then
    BRANCH_NAME="${GITHUB_HEAD_REF:-${GITHUB_REF_NAME:-}}"
    echo "🔍 No GITHUB_PR_NUMBER, looking up an open PR for branch: $BRANCH_NAME"
    PR_NUMBER=$(gh api "repos/$GITHUB_REPOSITORY/pulls" \
        --jq ".[] | select(.head.ref == \"$BRANCH_NAME\" and .state == \"open\") | .number" | head -1)
fi

if [ -z "$PR_NUMBER" ]; then
    echo "ℹ️  No open PR found, skipping comment"
    exit 0
fi

echo "📋 PR Number: $PR_NUMBER"

VERSION="${VERSION:-}"
BUILD_NUMBER="${BUILD_NUMBER:-}"
DEMO_SUFFIX="${DEMO_SUFFIX:-}"
SHORT_SHA="$(printf '%.7s' "${HEAD_SHA:-${GITHUB_SHA:-}}")"

# One comment per build: design review needs the history of builds on the PR,
# so we always post a new comment instead of skipping when one already exists.
COMMENT_BODY="✅ TestFlight build SDDSDemo"
if [ -n "$DEMO_SUFFIX" ]; then
    COMMENT_BODY="$COMMENT_BODY $DEMO_SUFFIX"
fi
if [ -n "$VERSION" ] && [ -n "$BUILD_NUMBER" ]; then
    COMMENT_BODY="$COMMENT_BODY ${VERSION}(${BUILD_NUMBER})"
fi
if [ -n "$SHORT_SHA" ]; then
    COMMENT_BODY="$COMMENT_BODY for \`${SHORT_SHA}\`"
fi
COMMENT_BODY="$COMMENT_BODY is published"

echo "📝 Comment: $COMMENT_BODY"

gh api "repos/$GITHUB_REPOSITORY/issues/$PR_NUMBER/comments" \
    --field body="$COMMENT_BODY" \
    --silent

echo "✅ Comment added successfully to PR #$PR_NUMBER"
