// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "SDDSTheme",
    platforms: [.iOS("15.0")],
    products: [
        .library(
            name: "SDDSTheme",
            targets: ["SDDSTheme"]),
    ],
    dependencies: [
        .package(name: "SDDSThemeCore", path: "../SDDSThemeCore")
    ],
    targets: [
        .target(
            name: "SDDSTheme",
            dependencies: ["SDDSThemeCore"],
            path: "Sources/SDDSTheme",
            exclude: ["SDDSTheme.h"],
            resources: [
                .process("Fonts")
            ]
        )
    ]
)
