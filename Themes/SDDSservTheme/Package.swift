// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "SDDSServTheme",
    platforms: [
        .iOS("15.0"),
        .macOS("10.15"),
    ],
    products: [
        .library(
            name: "SDDSServTheme",
            targets: ["SDDSServTheme"]),
    ],
    dependencies: [
        .package(name: "SDDSThemeCore", path: "../../SDDSThemeBuilder/SDDSThemeCore"),
        .package(name: "SDDSComponents", path: "../../SDDSComponents"),
        .package(name: "SDDSIcons", path: "../../SDDSIcons"),
        .package(name: "SandboxCore", path: "../../IntegrationCore/SandboxCore")
    ],
    targets: [
        .target(
            name: "SDDSServTheme",
            dependencies: ["SDDSThemeCore", "SDDSComponents", "SDDSIcons", "SandboxCore"],
            path: ".",
            exclude: ["SDDSServTheme.xcodeproj", "SDDSTheme.h"]
        )
    ]
)
