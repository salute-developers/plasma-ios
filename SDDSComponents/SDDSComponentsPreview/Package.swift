// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "SDDSComponentsPreview",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "SDDSComponentsPreview",
            targets: ["SDDSComponentsPreview"]),
    ],
    dependencies: [
        .package(name: "SDDSComponents", path: "../"),
        .package(name: "SDDSThemeCore", path: "../../SDDSThemeBuilder/SDDSThemeCore"),
        .package(name: "SDDSServTheme", path: "../../Themes/SDDSservTheme")
//        .package(name: "SDDSIcons", path: "../../SDDSIcons")
    ],
    targets: [
        .target(
            name: "SDDSComponentsPreview",
            dependencies: [
                "SDDSServTheme",
                "SDDSThemeCore",
                "SDDSComponents"
//                .product(name: "SDDSIcons", package: "SDDSIcons")
                          ],
            path: "./",
            exclude: ["SDDSComponentsPreview.h"],
            resources: [
                .process("Assets.xcassets")
            ]
        )
    ]
)
