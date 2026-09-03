// swift-tools-version:5.9
import PackageDescription
import CompilerPluginSupport

// Umbrella manifest: lets consumers depend on this repository by git URL and pick the
// products they need. Targets point at the same sources the per-package manifests use, so
// the nested `Package.swift` files stay valid for local, path-based development.
let package = Package(
    name: "plasma-ios",
    platforms: [
        .iOS(.v15),
        // Required by the SDDSApiInfo macro plugin, which builds for the host.
        .macOS(.v10_15)
    ],
    products: [
        .library(name: "SDDSComponents", targets: ["SDDSComponents"]),
        .library(name: "SDDSThemeCore", targets: ["SDDSThemeCore"]),
        .library(name: "SDDSIcons", targets: ["SDDSIcons"]),
        .library(name: "SDDSServTheme", targets: ["SDDSServTheme"]),
        .library(name: "PlasmaB2CTheme", targets: ["PlasmaB2CTheme"]),
        .library(name: "PlasmaHomeDSTheme", targets: ["PlasmaHomeDSTheme"])
    ],
    dependencies: [
        // Resolved from git rather than the Vendor submodule: submodules are not fetched
        // when this package itself is consumed by URL.
        .package(url: "https://github.com/RedMadRobot/input-mask-ios.git", from: "7.3.2"),
        .package(url: "https://github.com/swiftlang/swift-syntax.git", from: "601.0.0")
    ],
    targets: [
        .macro(
            name: "SDDSApiInfoMacros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ],
            path: "SDDSApiInfo/Sources/SDDSApiInfoMacros"
        ),
        .target(
            name: "SDDSApiInfo",
            dependencies: ["SDDSApiInfoMacros"],
            path: "SDDSApiInfo/Sources/SDDSApiInfo"
        ),
        .target(
            name: "SDDSThemeCore",
            path: "DesignSystemBuilder/SDDSThemeCore/Sources/SDDSThemeCore",
            exclude: ["SDDSThemeCore.h"]
        ),
        .target(
            name: "SDDSIcons",
            path: "SDDSIcons",
            exclude: [
                "Package.swift",
                "SDDSIcons.xcodeproj",
                "SDDSIcons/SDDSIcons.h",
                "Scripts",
                "Templates",
                "swiftgen.yml",
                "info.plist",
                "README.md",
                "CLAUDE.md",
                "LICENCE.txt"
            ],
            resources: [
                .process("SDDSIcons/Assets.xcassets")
            ]
        ),
        .target(
            name: "SandboxCore",
            path: "IntegrationCore/SandboxCore/Sources/SandboxCore"
        ),
        .target(
            name: "SDDSComponents",
            dependencies: [
                "SDDSThemeCore",
                "SDDSApiInfo",
                .product(name: "InputMask", package: "input-mask-ios")
            ],
            path: "SDDSComponents/Sources/SDDSComponents",
            exclude: ["SDDSComponents.h"],
            resources: [
                .process("../../Assets.xcassets")
            ]
        ),
        .target(
            name: "SDDSServTheme",
            dependencies: ["SDDSThemeCore", "SDDSComponents", "SDDSIcons", "SandboxCore"],
            path: "Themes/SDDSservTheme",
            exclude: ["Package.swift", "SDDSservTheme.xcodeproj", "SDDSTheme.h", "docs", "override-docs"]
        ),
        .target(
            name: "PlasmaB2CTheme",
            dependencies: ["SDDSThemeCore", "SDDSComponents", "SDDSIcons", "SandboxCore"],
            path: "Themes/PlasmaB2CTheme",
            exclude: ["Package.swift", "PlasmaB2CTheme.xcodeproj", "SDDSTheme.h", "docs", "override-docs"]
        ),
        .target(
            name: "PlasmaHomeDSTheme",
            dependencies: ["SDDSThemeCore", "SDDSComponents", "SDDSIcons", "SandboxCore"],
            path: "Themes/PlasmaHomeDSTheme",
            exclude: ["Package.swift", "PlasmaHomeDSTheme.xcodeproj", "SDDSTheme.h", "docs", "override-docs"]
        )
    ]
)
