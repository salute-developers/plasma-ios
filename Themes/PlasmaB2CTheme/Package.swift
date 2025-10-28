// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "PlasmaB2CTheme",
    platforms: [
        .iOS("15.0")
    ],
    products: [
        .library(
            name: "PlasmaB2CTheme",
            targets: ["PlasmaB2CTheme"]),
    ],
    dependencies: [
        .package(name: "SDDSThemeCore", path: "../../SDDSThemeBuilder/SDDSThemeCore"),
        .package(name: "SDDSComponents", path: "../../SDDSComponents"),
        .package(name: "SDDSIcons", path: "../../SDDSIcons")
    ],
    targets: [
        .target(
            name: "PlasmaB2CTheme",
            dependencies: ["SDDSThemeCore", "SDDSComponents", "SDDSIcons"],
            path: ".",
            exclude: ["PlasmaB2CTheme.xcodeproj", "SDDSTheme.h"]
        )
    ]
)
