// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "SDDSThemeUtilities",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "SDDSThemeUtilities",
            targets: ["SDDSThemeUtilities"]),
    ],
    targets: [
        .target(
            name: "SDDSThemeUtilities",
            path: "Sources/SDDSThemeUtilities",
            exclude: ["SDDSThemeUtilities.h"]
        )
    ]
)
