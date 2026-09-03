# Security Policy

## Supported versions

Security fixes are applied to the latest published release only. Releases are tagged
`release-DD-MM-YYYY`; see the [Releases page](https://github.com/salute-developers/plasma-ios/releases)
for the current one. Older releases do not receive backports — upgrade to the latest tag first.

| Version | Supported |
|---|---|
| Latest release | ✅ |
| Any earlier release | ❌ |

## Reporting a vulnerability

**Do not open a public issue for security problems.**

Use GitHub's private vulnerability reporting:
[Report a vulnerability](https://github.com/salute-developers/plasma-ios/security/advisories/new).
The report is visible only to the maintainers listed in [CODEOWNERS](CODEOWNERS) until a fix ships.

Please include:

- affected module and version (`SDDSComponents`, `SDDSThemeCore`, a theme, or the `dsbuilder` CLI);
- how the module is integrated (xcframework from a release, Swift Package Manager, standalone sources);
- a minimal reproduction and the impact you observed;
- any suggested mitigation.

## What to expect

| Stage | Target |
|---|---|
| Acknowledgement of the report | 3 business days |
| Initial assessment and severity | 10 business days |
| Fix or documented mitigation | depends on severity, communicated in the advisory thread |

We will keep you updated in the advisory thread and credit you in the release notes unless you
ask us not to.

## Scope

In scope: the Swift packages in this repository, the generated theme packages, the `dsbuilder`
CLI, and the build and release scripts.

Out of scope: the demo application (`SDDSDemoApp`) as shipped to TestFlight, third-party
dependencies listed in [THIRD_PARTY_LICENSES.md](THIRD_PARTY_LICENSES.md) (report those upstream),
and findings that require a physically compromised device.
