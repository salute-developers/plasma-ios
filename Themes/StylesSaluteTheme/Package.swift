// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "StylesSaluteTheme",
    platforms: [
        .iOS("15.0")
    ],
    products: [
        .library(
            name: "StylesSaluteTheme",
            targets: ["StylesSaluteTheme"]),
    ],
    dependencies: [
        .package(name: "SDDSThemeCore", path: "../../SDDSThemeBuilder/SDDSThemeCore"),
        .package(name: "SDDSComponents", path: "../../SDDSComponents"),
        .package(name: "SDDSIcons", path: "../../SDDSIcons")
    ],
    targets: [
        .target(
            name: "StylesSaluteTheme",
            dependencies: ["SDDSThemeCore", "SDDSComponents", "SDDSIcons"],
            path: ".",
            exclude: ["StylesSaluteTheme.xcodeproj", "SDDSTheme.h"],
            resources: [
                .process("Fonts")
            ]
        )
    ]
)
