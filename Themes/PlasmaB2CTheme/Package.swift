// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "PlasmaB2CTheme",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "PlasmaB2CTheme",
            targets: ["PlasmaB2CTheme"]),
    ],
    dependencies: [
        .package(name: "SDDSThemeCore", path: "../../SDDSThemeBuilder/SDDSThemeCore")
    ],
    targets: [
        .target(
            name: "PlasmaB2CTheme",
            dependencies: ["SDDSThemeCore"],
            path: ".",
            exclude: ["PlasmaB2CTheme.xcodeproj", "SDDSTheme.h"],
            resources: [
                .copy("Fonts")
            ]
        )
    ]
)
