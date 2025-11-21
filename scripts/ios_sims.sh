#!/usr/bin/env bash

set -eo pipefail

GIT_ROOT=${GIT_ROOT:-"$PWD"}

XCODE_VERSION='16.1'
IOS_SIMULATOR_DEVICE_TYPE='iPhone 16 Pro'
IOS_SIMULATOR_RUNTIME_VERSION='18.1'

log() {
  printf '%s\n' "$@" 1>&2
}

assert_defined() {
  local has_missing=false
  local var_name

  for var_name in "$@"; do
    if [ -z "${!var_name}" ]; then
      log "Missing required param: $var_name"
      has_missing=true
    fi
  done

  if [[ $has_missing = true ]]; then
    return 3
  fi
}

function remove_all { ## Remove all iOS device simulators from Xcode
  log '🧹  Will remove all iOS Simulators'
  xcrun simctl delete all
  log '🗑️  Removed all iOS Simulators'
}

function add { ## Add iOS device simulator for Monorepo tests in Workspace
  local device_name="Xcode ${XCODE_VERSION}, iOS ${IOS_SIMULATOR_RUNTIME_VERSION}"
  local device_type_id="com.apple.CoreSimulator.SimDeviceType.${IOS_SIMULATOR_DEVICE_TYPE// /-}"
  local runtime_id="com.apple.CoreSimulator.SimRuntime.iOS-${IOS_SIMULATOR_RUNTIME_VERSION//\./-}"

  log "Will try create device:" \
    "- runtime_id: $runtime_id" \
    "- device_type_id: $device_type_id" \
    "- name: $device_name"

  local device_udid
  device_udid=$(xcrun simctl create "${device_name}" "${device_type_id}" "${runtime_id}")

  localize "$device_udid"

  defaults write com.apple.dt.Xcode DVTDeviceVisibilityPreferences -dict-add "${device_udid}" -int 1
  log "👁️  Made '${device_name}' always visible in Xcode dropdown menu"

  log "iOS Simulator for tests run to your Xcode, name: ${device_name}, udid: ${device_udid}"
}

function localize { ## Localize iOS simulator to Russian using template plist
  local device_udid=$1
  assert_defined device_udid

  local device_home="$HOME/Library/Developer/CoreSimulator/Devices/${device_udid}"
  local global_prefs_plist="$device_home/data/Library/Preferences/.GlobalPreferences.plist"
  local template_plist="$GIT_ROOT/templates/simulator/GlobalPreferences.plist"

  mkdir -p "$(dirname "$global_prefs_plist")"
  cp -f "$template_plist" "$global_prefs_plist"

  log "🇷🇺 Set language and locale for simulator ${device_udid}"
}

"$@"