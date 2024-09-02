// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "SDDSServTheme",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "SDDSServTheme",
            targets: ["SDDSServTheme"]),
    ],
    dependencies: [
        .package(name: "SDDSThemeCore", path: "../../SDDSThemeBuilder/SDDSThemeCore")
    ],
    targets: [
        .target(
            name: "SDDSServTheme",
            dependencies: ["SDDSThemeCore"],
            path: ".",
            exclude: ["SDDSServTheme.xcodeproj", "SDDSTheme.h"],
            resources: [
                .process("Fonts")
            ]
        )
    ]
)
