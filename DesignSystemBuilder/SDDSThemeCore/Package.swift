// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "SDDSThemeCore",
    platforms: [.iOS("15.0")],
    products: [
        .library(
            name: "SDDSThemeCore",
            targets: ["SDDSThemeCore"])
    ],
    targets: [
        .target(
            name: "SDDSThemeCore",
            path: "Sources/SDDSThemeCore",
            exclude: ["SDDSThemeCore.h"]
        )
    ]
)
