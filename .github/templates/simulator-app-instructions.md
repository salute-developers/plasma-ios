## Running the demo app on a simulator

Each release ships the sandbox app built for the iOS Simulator. It is unsigned, so it runs on a
simulator only — not on a device.

**1. Download and unpack**

Download `SDDSDemoApp-<theme>-simulator.zip` from the release assets, then:

```bash
unzip SDDSDemoApp-simulator.zip
xattr -dr com.apple.quarantine SDDSDemoApp.app
```

The `xattr` step clears the quarantine flag macOS puts on downloaded files; without it the
simulator refuses to install the bundle.

**2. Boot a simulator**

```bash
xcrun simctl list devices available | grep iPhone
xcrun simctl boot "iPhone 16 Pro"
open -a Simulator
```

**3. Install and launch**

```bash
xcrun simctl install booted SDDSDemoApp.app
xcrun simctl launch booted com.sd.SDDSDemo
```

**Bundle identifiers per build**

| Asset | Bundle id | Themes |
|---|---|---|
| `SDDSDemoApp-simulator.zip` | `com.sd.SDDSDemo` | all themes, switchable in the app |
| `SDDSDemoApp-sddsserv-simulator.zip` | `com.sd.SDDSDemo.sddsserv` | SDDSServTheme |
| `SDDSDemoApp-plasmab2c-simulator.zip` | `com.sd.SDDSDemo.plasmab2c` | PlasmaB2CTheme |
| `SDDSDemoApp-plasmahomeds-simulator.zip` | `com.sd.SDDSDemo.plasmahomeds` | PlasmaHomeDSTheme |

**Uninstall**

```bash
xcrun simctl uninstall booted com.sd.SDDSDemo
```
