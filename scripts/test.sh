#!/bin/bash
source "$(dirname "$0")/pretty_echo.sh"

PROJECT_ROOT_DIR="$(dirname "$0")/.."
PROJECT_ROOT_DIR=$(cd "$PROJECT_ROOT_DIR" && pwd)
print_info "Root directory is ${PROJECT_ROOT_DIR}"

WORKSPACE_NAME="SDDS.xcworkspace"
WORKSPACE_PATH="${PROJECT_ROOT_DIR}/${WORKSPACE_NAME}"
print_info "XCWorkspace path is ${PROJECT_ROOT_DIR}"

modules=("SDDSSwiftUI" "SDDSUIKit" "SDDSIcons" "SDDSCore")

print_info "Running tests for all targets..."
for MODULE in "${!modules[@]}"; do
    SCHEME=${modules[$MODULE]}
    XCODE_PROJECT_PATH="${PROJECT_ROOT_DIR}/${SCHEME}/${SCHEME}.xcodeproj"

    print_info "Running tests for the scheme $SCHEME"
    
    SKIP_LINT=YES xcodebuild -scheme ${SCHEME} -workspace ${WORKSPACE_PATH} -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 14 Pro Max' test
    
    if [ $? -ne 0 ]; then
        print_error "Tests failed for the scheme $SCHEME."
        exit 1
    else
        print_success "Tests succeeded for the scheme $SCHEME"
    fi
    
done

print_success "All tests succeeded"
