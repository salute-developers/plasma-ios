#!/bin/bash
set -e

FASTLANE_OUTPUT_FILE=${1:-fastlane_output.log}

echo "🔍 Extracting build info from $FASTLANE_OUTPUT_FILE..."

# Extract version and build number from the fastlane output
BUILD_INFO=$(grep "🎉 Build.*successfully uploaded!" "$FASTLANE_OUTPUT_FILE" || echo "")

if [[ -n "$BUILD_INFO" ]]; then
    echo "📋 Found build info: $BUILD_INFO"
    
    # Extract version and build number using regex
    if [[ $BUILD_INFO =~ SDDSDemo[[:space:]]([0-9]+\.[0-9]+)[[:space:]]([0-9]+) ]]; then
        VERSION="${BASH_REMATCH[1]}"
        BUILD_NUMBER="${BASH_REMATCH[2]}"
        
        echo "VERSION=$VERSION" >> $GITHUB_ENV
        echo "BUILD_NUMBER=$BUILD_NUMBER" >> $GITHUB_ENV
        
        echo "✅ Extracted version: $VERSION, build number: $BUILD_NUMBER"
    else
        echo "⚠️  Could not extract version and build number from: $BUILD_INFO"
    fi
else
    echo "⚠️  No build success message found in $FASTLANE_OUTPUT_FILE"
fi 