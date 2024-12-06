#!/bin/bash

# Input parameters
RUNNER_TEMP=$1
BUILD_CERTIFICATE_BASE64=$2
P12_PASSWORD=$3
BUILD_PROVISION_PROFILE_BASE64=$4
KEYCHAIN_PASSWORD=$5

# Derived variables
CERTIFICATE_PATH="$RUNNER_TEMP/build_certificate.p12"
PP_PATH="$RUNNER_TEMP/build_pp.mobileprovision"
KEYCHAIN_PATH="$RUNNER_TEMP/app-signing.keychain-db"

# Decode certificate and provisioning profile
echo -n "$BUILD_CERTIFICATE_BASE64" | base64 --decode -o "$CERTIFICATE_PATH"
echo -n "$BUILD_PROVISION_PROFILE_BASE64" | base64 --decode -o "$PP_PATH"

# Create temporary keychain
security create-keychain -p "$KEYCHAIN_PASSWORD" "$KEYCHAIN_PATH"
security set-keychain-settings -lut 21600 "$KEYCHAIN_PATH"
security unlock-keychain -p "$KEYCHAIN_PASSWORD" "$KEYCHAIN_PATH"

# Import certificate to keychain
security import "$CERTIFICATE_PATH" -P "$P12_PASSWORD" -A -t cert -f pkcs12 -k "$KEYCHAIN_PATH"
security set-key-partition-list -S apple-tool:,apple: -k "$KEYCHAIN_PASSWORD" "$KEYCHAIN_PATH"
security list-keychain -d user -s "$KEYCHAIN_PATH"

echo "Certificate and provisioning profile installed successfully."

