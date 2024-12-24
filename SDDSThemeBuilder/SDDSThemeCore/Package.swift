// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "SDDSThemeCore",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "SDDSThemeCore",
            targets: ["SDDSThemeCore"]),
    ],
    targets: [
        .target(
            name: "SDDSThemeCore",
            dependencies: [],
            path: "Sources/SDDSThemeCore",
            exclude: ["SDDSThemeCore.h"]
        )
    ]
)
