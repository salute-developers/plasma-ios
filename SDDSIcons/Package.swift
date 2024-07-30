// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "SDDSIcons",
    platforms: [
        .iOS(.v14)
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
            path: "Sources/SDDSIcons",
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
