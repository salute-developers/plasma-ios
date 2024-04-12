#!/bin/bash
source "$(dirname "$0")/pretty_echo.sh"

PROJECT_ROOT_DIR="$(dirname "$0")/.."
PROJECT_ROOT_DIR=$(cd "$PROJECT_ROOT_DIR" && pwd)
print_info "Root directory is ${PROJECT_ROOT_DIR}"

WORKSPACE_NAME="SDDS.xcworkspace"
WORKSPACE_PATH="${PROJECT_ROOT_DIR}/${WORKSPACE_NAME}"
print_info "XCWorkspace path is ${PROJECT_ROOT_DIR}"

BUILD_FOLDER="build"
BUILD_PATH="${PROJECT_ROOT_DIR}/${BUILD_FOLDER}"

print_info "Artefacts will appear in ${BUILD_PATH}"

rm -rf "${BUILD_PATH}"
mkdir -p "${BUILD_PATH}"

modules=("SDDSSwiftUI" "SDDSUIKit" "SDDSIcons" "SDDSCore")

print_info "Building XCFrameworks for the all targets..."
for MODULE in "${!modules[@]}"; do
    SCHEME=${modules[$MODULE]}
    XCODE_PROJECT_PATH="${PROJECT_ROOT_DIR}/${SCHEME}/${SCHEME}.xcodeproj"

    print_info "Building XCFramework for the scheme $SCHEME"
    
    print_info "Making an archive for iOS device..."
    iOS_ARCHIVE_PATH="${BUILD_PATH}/${SCHEME}-iphoneos.xcarchive"
    SKIP_LINT=YES BUILD_ALL=YES xcodebuild archive -project ${XCODE_PROJECT_PATH} -scheme ${SCHEME} -archivePath "${iOS_ARCHIVE_PATH}" -sdk iphoneos SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES
    
    print_info "Making an archive for iOS simulator..."
    iOS_SIMULATOR_ARCHIVE_PATH="${BUILD_PATH}/${SCHEME}-iossimulator.xcarchive"
    SKIP_LINT=YES BUILD_ALL=YES xcodebuild archive -project ${XCODE_PROJECT_PATH} -scheme ${SCHEME} -archivePath "${iOS_SIMULATOR_ARCHIVE_PATH}" -sdk iphonesimulator SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES
    
    print_info "Making XCFramework..."
    SKIP_LINT=YES BUILD_ALL=YES xcodebuild -create-xcframework -framework "${BUILD_PATH}/${SCHEME}-iphoneos.xcarchive/Products/Library/Frameworks/${SCHEME}.framework" -framework "${BUILD_PATH}/${SCHEME}-iossimulator.xcarchive/Products/Library/Frameworks/${SCHEME}.framework" -output "${BUILD_PATH}/${SCHEME}.xcframework"

    if [ $? -ne 0 ]; then
        print_error "Build failed for the scheme $SCHEME."
        exit 1
    else
        print_success "Build succeeded for the scheme $SCHEME"
    fi
    
    print_info "Cleaning up archives..."
    rm -rf "${iOS_ARCHIVE_PATH}"
    rm -rf "${iOS_SIMULATOR_ARCHIVE_PATH}"
done

print_success "All builds succeeded"
