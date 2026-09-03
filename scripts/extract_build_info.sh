#!/bin/bash
set -e

FASTLANE_OUTPUT_FILE=${1:-fastlane_output.log}

echo "🔍 Extracting build info from $FASTLANE_OUTPUT_FILE..."

# Extract version and build number from the fastlane output
BUILD_INFO=$(grep "🎉 Build.*successfully uploaded!" "$FASTLANE_OUTPUT_FILE" || echo "")

if [[ -n "$BUILD_INFO" ]]; then
    echo "📋 Found build info: $BUILD_INFO"
    
    # Extract version and build number using regex
    # Build name is "SDDSDemo[ <theme>] <version> <build>", the theme suffix is optional.
    if [[ $BUILD_INFO =~ SDDSDemo([[:space:]]\[[a-z0-9]+\])?[[:space:]]([0-9]+\.[0-9]+)[[:space:]]([0-9]+) ]]; then
        DEMO_SUFFIX="${BASH_REMATCH[1]}"
        VERSION="${BASH_REMATCH[2]}"
        BUILD_NUMBER="${BASH_REMATCH[3]}"

        echo "VERSION=$VERSION" >> $GITHUB_ENV
        echo "BUILD_NUMBER=$BUILD_NUMBER" >> $GITHUB_ENV
        echo "DEMO_SUFFIX=${DEMO_SUFFIX// /}" >> $GITHUB_ENV

        echo "✅ Extracted version: $VERSION, build number: $BUILD_NUMBER"
    else
        echo "⚠️  Could not extract version and build number from: $BUILD_INFO"
    fi
else
    echo "⚠️  No build success message found in $FASTLANE_OUTPUT_FILE"
fi 