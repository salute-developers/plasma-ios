// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "SDDSComponents",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "SDDSComponents",
            targets: ["SDDSComponents"]),
        .library(
            name: "SDDSComponentsPreview",
            targets: ["SDDSComponentsPreview"]),
    ],
    dependencies: [
        .package(name: "SDDSIcons", path: "../SDDSIcons"),
        .package(name: "SDDSThemeCore", path: "../SDDSThemeBuilder/SDDSThemeCore"),
        .package(name: "SDDSServTheme", path: "../Themes/SDDSservTheme")
    ],
    targets: [
        .target(
            name: "SDDSComponents",
            dependencies: ["SDDSIcons", "SDDSThemeCore"],
            path: "Sources/SDDSComponents",
            exclude: ["SDDSComponents.h"],
            resources: [
                .process("../../Assets.xcassets")
            ]
        ),
        .target(
            name: "SDDSComponentsPreview",
            dependencies: ["SDDSServTheme", "SDDSThemeCore"],
            path: "SDDSComponentsPreview",
            exclude: ["SDDSComponentsPreview.h"],
            resources: [
                .process("Assets.xcassets")
            ]
        ),
        .testTarget(
            name: "SDDSComponentsTests",
            dependencies: ["SDDSComponents"],
            path: "SDDSComponentsTests"
        )
    ]
)
