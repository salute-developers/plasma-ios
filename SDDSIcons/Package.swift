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
            type: .dynamic,
            targets: ["SDDSIcons"]),
    ],
    targets: [
        .target(
            name: "SDDSIcons",
            dependencies: [],
            path: "SDDSIcons",
            resources: [
                .process("Assets.xcassets")
            ]
        ),
        .testTarget(
            name: "SDDSIconsTests",
            dependencies: ["SDDSIcons"],
            path: "SDDSIconsTests"
        ),
    ]
)
