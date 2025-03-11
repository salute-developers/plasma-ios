// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "SDDSIcons",
    platforms: [
        .iOS("15.0")
    ],
    products: [
        .library(
            name: "SDDSIcons",
            targets: ["SDDSIcons"]),
    ],
    targets: [
        .target(
            name: "SDDSIcons",
            dependencies: [],
            path: "./",
            exclude: ["SDDSIcons.xcodeproj", "SDDSIcons/SDDSIcons.h"],
            resources: [
                .process("SDDSIcons/Assets.xcassets")
            ]
        )
    ]
)
