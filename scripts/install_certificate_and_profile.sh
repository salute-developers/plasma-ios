#!/bin/bash

# create variables
CERTIFICATE_PATH=$RUNNER_TEMP/build_certificate.p12
PP_PATH=$RUNNER_TEMP/build_pp.mobileprovision
KEYCHAIN_PATH=$RUNNER_TEMP/app-signing.keychain-db

# import certificate and provisioning profile from secrets
echo -n "$BUILD_CERTIFICATE_BASE64" | base64 --decode -o $CERTIFICATE_PATH
echo -n "$BUILD_PROVISION_PROFILE_BASE64" | base64 --decode -o "$PP_PATH"

# create temporary keychain
security create-keychain -p "$KEYCHAIN_PASSWORD" $KEYCHAIN_PATH
security set-keychain-settings -lut 21600 $KEYCHAIN_PATH
security unlock-keychain -p "$KEYCHAIN_PASSWORD" $KEYCHAIN_PATH

# import certificate to keychain
security import $CERTIFICATE_PATH -P "$P12_PASSWORD" -A -t cert -f pkcs12 -k $KEYCHAIN_PATH
security set-key-partition-list -S apple-tool:,apple: -k "$KEYCHAIN_PASSWORD" $KEYCHAIN_PATH
security list-keychain -d user -s $KEYCHAIN_PATH

# verify certificate import
security find-identity -v -p codesigning $KEYCHAIN_PATH

# verify provisioning profile
ls -l "$PP_PATH"
security cms -D -i "$PP_PATH"
