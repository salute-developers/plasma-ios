// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "SDDSComponents",
    platforms: [
        .iOS("15.0")
    ],
    products: [
        .library(
            name: "SDDSComponents",
            targets: ["SDDSComponents"])
    ],
    dependencies: [
        .package(name: "SDDSThemeCore", path: "../SDDSThemeBuilder/SDDSThemeCore"),
        .package(name: "SDDSIcons", path: "../SDDSIcons")
    ],
    targets: [
        .target(
            name: "SDDSComponents",
            dependencies: ["SDDSThemeCore", "SDDSIcons"],
            path: "Sources/SDDSComponents",
            exclude: ["SDDSComponents.h"],
            resources: [
                .process("../../Assets.xcassets")
            ]
        )
    ]
)
