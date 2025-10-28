// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "PlasmaHomeDSTheme",
    platforms: [
        .iOS("15.0")
    ],
    products: [
        .library(
            name: "PlasmaHomeDSTheme",
            targets: ["PlasmaHomeDSTheme"]),
    ],
    dependencies: [
        .package(name: "SDDSThemeCore", path: "../../SDDSThemeBuilder/SDDSThemeCore"),
        .package(name: "SDDSComponents", path: "../../SDDSComponents"),
        .package(name: "SDDSIcons", path: "../../SDDSIcons")
    ],
    targets: [
        .target(
            name: "PlasmaHomeDSTheme",
            dependencies: ["SDDSThemeCore", "SDDSComponents", "SDDSIcons"],
            path: ".",
            exclude: ["PlasmaHomeDSTheme.xcodeproj", "SDDSTheme.h"]
        )
    ]
)
