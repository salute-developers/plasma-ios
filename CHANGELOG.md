# Changelog

Release notes are generated per release and published on the
[Releases page](https://github.com/salute-developers/plasma-ios/releases).

Each release entry lists:

- the modules whose version changed (`SDDSComponents`, `SDDSThemeCore`, `SDDSIcons`, the theme
  packages, the `dsbuilder` CLI);
- the attached artifacts — `.xcframework` archives, `dsbuilder-cli-<tag>.zip` and
  `SDDSSources-<tag>.zip`;
- the changes grouped by Conventional Commit type, built from commit messages by
  [`.github/workflows/generate-changelog.yml`](.github/workflows/generate-changelog.yml).

Icons ship on their own cadence under the `SDDSIcons-v*` tags.

## Versioning

Every module carries its own version, so release tags (`release-DD-MM-YYYY`) do not map to a
single semantic version. Current module versions are recorded in
[`release-manifest.json`](release-manifest.json).

## Unreleased

Changes merged into `develop` are published with the next release. To see what is pending,
compare [`develop` against `main`](https://github.com/salute-developers/plasma-ios/compare/main...develop).
