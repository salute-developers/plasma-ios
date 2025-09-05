// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "SDDSThemeUtilities",
    platforms: [
        .iOS("15.0")
    ],
    products: [
        .library(
            name: "SDDSThemeUtilities",
            type: .static,
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
