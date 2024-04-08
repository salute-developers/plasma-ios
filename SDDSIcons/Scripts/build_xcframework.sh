#!/bin/bash

PROJECT_ROOT_DIR="$(dirname "$0")/.."
PROJECT_ROOT_DIR=$(cd "$PROJECT_ROOT_DIR" && pwd)
echo "Root directory is ${PROJECT_ROOT_DIR}"

BUILD_FOLDER="build"
BUILD_PATH="${PROJECT_ROOT_DIR}/${BUILD_FOLDER}"

echo "Artefacts will appear in ${BUILD_PATH}"

rm -rf "${BUILD_PATH}"
mkdir -p "${BUILD_PATH}"

SCHEME="SDDSIcons"

echo "Building XCFrameworks for ${SCHEME}"

XCODE_PROJECT_PATH="${PROJECT_ROOT_DIR}/${SCHEME}.xcodeproj"

echo "Building XCFramework for the scheme $SCHEME"

echo "Making an archive for iOS device..."
iOS_ARCHIVE_PATH="${BUILD_PATH}/${SCHEME}-iphoneos.xcarchive"
SKIP_LINT=YES xcodebuild archive -project ${XCODE_PROJECT_PATH} -scheme ${SCHEME} -archivePath "${iOS_ARCHIVE_PATH}" -sdk iphoneos SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES

echo "Making an archive for iOS simulator..."
iOS_SIMULATOR_ARCHIVE_PATH="${BUILD_PATH}/${SCHEME}-iossimulator.xcarchive"
SKIP_LINT=YES xcodebuild archive -project ${XCODE_PROJECT_PATH} -scheme ${SCHEME} -archivePath "${iOS_SIMULATOR_ARCHIVE_PATH}" -sdk iphonesimulator SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES

echo "Making XCFramework..."
SKIP_LINT=YES xcodebuild -create-xcframework -framework "${BUILD_PATH}/${SCHEME}-iphoneos.xcarchive/Products/Library/Frameworks/${SCHEME}.framework" -framework "${BUILD_PATH}/${SCHEME}-iossimulator.xcarchive/Products/Library/Frameworks/${SCHEME}.framework" -output "${BUILD_PATH}/${SCHEME}.xcframework"

if [ $? -ne 0 ]; then
    echo "Build failed for the scheme $SCHEME."
    exit 1
else
    echo "Build succeeded for the scheme $SCHEME"
fi

echo "Cleaning up archives..."
rm -rf "${iOS_ARCHIVE_PATH}"
rm -rf "${iOS_SIMULATOR_ARCHIVE_PATH}"

echo "All builds succeeded"
