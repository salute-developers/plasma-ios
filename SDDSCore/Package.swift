// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "SDDSCore",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "SDDSCore",
            targets: ["SDDSCore"]),
    ],
    targets: [
        .target(
            name: "SDDSCore",
            dependencies: [],
            path: "Sources/SDDSCore",
            exclude: ["SDDSCore.h"]
        ),
        .testTarget(
            name: "SDDSCoreTests",
            dependencies: ["SDDSCore"],
            path: "SDDSCoreTests"
        ),
    ]
)
