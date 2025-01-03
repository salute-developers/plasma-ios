// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "SDDSComponents",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "SDDSComponents",
            targets: ["SDDSComponents"])
    ],
    dependencies: [
        .package(name: "SDDSIcons", path: "../SDDSIcons"),
        .package(name: "SDDSThemeCore", path: "../SDDSThemeBuilder/SDDSThemeCore")
    ],
    targets: [
        .target(
            name: "SDDSComponents",
            dependencies: ["SDDSIcons", "SDDSThemeCore"],
            path: "Sources/SDDSComponents",
            exclude: ["SDDSComponents.h"],
            resources: [
                .process("../../Assets.xcassets")
            ]
        )
    ]
)
