// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "SDDSThemeCore",
    platforms: [.iOS("15.0")],
    products: [
        .library(
            name: "SDDSThemeCore",
            targets: ["SDDSThemeCore"]),
    ],
    dependencies: [
        .package(name: "SDDSThemeUtilities", path: "../SDDSThemeUtilities")
    ],
    targets: [
        .target(
            name: "SDDSThemeCore",
            dependencies: ["SDDSThemeUtilities"],
            path: "Sources/SDDSThemeCore",
            exclude: ["SDDSThemeCore.h"]
        )
    ]
)
